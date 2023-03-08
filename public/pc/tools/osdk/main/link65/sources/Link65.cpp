/*

The 6502 Linker, for the lcc or similar, that produce .s files to be processed later by a cross assembler
(See infos.h for details and version history)

*/



#include "infos.h"

#define _GNU_SOURCE 1 /* for fcloseall() */
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <memory.h>
#include <ctype.h>

#ifndef POSIX
#include <direct.h>
#else
#include <unistd.h>
#include <limits.h>
#define stricmp strcasecmp
#define _MAX_PATH PATH_MAX
// From https://groups.google.com/forum/#!topic/gnu.gcc.help/0dKxhmV4voE
void _splitpath(const char* Path,char* Drive,char* Directory,char*
                Filename,char* Extension)
{
  char* CopyOfPath = (char*) Path;
  int Counter = 0;
  int Last = 0;
  int Rest = 0;

  // no drives available in linux .
  // extensions are not common in linux
  // but considered anyway
  Drive = NULL;

  while(*CopyOfPath != '\0')
  {
    // search for the last slash
    while(*CopyOfPath != '/' && *CopyOfPath != '\0')
    {
      CopyOfPath++;
      Counter++;
    }
    if(*CopyOfPath == '/')
    {
      CopyOfPath++;
      Counter++;
      Last = Counter;
    }
    else
      Rest = Counter - Last;
  }
  // directory is the first part of the path until the
  // last slash appears
  strncpy(Directory,Path,Last);
  // strncpy doesnt add a '\0'
  Directory[Last] = '\0';
  // Filename is the part behind the last slahs
  strcpy(Filename,CopyOfPath -= Rest);
  // get extension if there is any
  while(*Filename != '\0')
  {
    // the part behind the point is called extension in windows systems
    // at least that is what i thought apperantly the '.' is used as part
    // of the extension too .
    if(*Filename == '.')
    {
      while(*Filename != '\0')
      {
        *Extension = *Filename;
        Extension++;
        Filename++;
      }
    }
    if(*Filename != '\0')
    {Filename++;}
  }
  *Extension = '\0';
  return;
}

// Abstract:   Make a path out of its parts
// Parameters: Path: Object to be made
//             Drive: Logical drive , only for compatibility , notconsidered
//             Directory: Directory part of path
//             Filename: File part of path
//             Extension: Extension part of path (includes the leading point)
// Returns:    Path is changed
// Comment:    Note that the concept of an extension is not available in Linux,
//             nevertheless it is considered

void _makepath(char* Path,const char* Drive,const char* Directory,
               const char* File,const char* Extension)
{
  while(*Drive != '\0' && Drive != NULL)
  {
    *Path = *Drive;
    Path++;
    Drive++;
  }
  while(*Directory != '\0' && Directory != NULL)
  {
    *Path = *Directory;
    Path ++;
    Directory ++;
  }
  while(*File != '\0' && File != NULL)
  {
    *Path = *File;
    Path ++;
    File ++;
  }
  while(*Extension != '\0' && Extension != NULL)
  {
    *Path = *Extension;
    Path ++;
    Extension ++;
  }
  *Path = '\0';
  return;
}

// Abstract:   Change the current working directory
// Parameters: Directory: The Directory which should be the workingdirectory.
// Returns:    0 for success , other for error
// Comment:    The command doesnt fork() , thus the directory is changed for
//             The actual process and not for a forked one which would betrue
//             for system("cd DIR");

int _chdir(const char* Directory)
{
  chdir(Directory);
  return 0;
}
#endif


#include "common.h"

// Disable the warning C4706 -> assignment within conditional expression
// Allow us to use Warning level 4 instead of level 3
#pragma warning( disable : 4706)
#pragma warning( disable : 4786)	// Debug symbols thing

#include <vector>
#include <string>
#include <set>
#include <cctype>

#define NB_ARG	2


#define MAX_LINE_SIZE	4096	// XA is limited to 2048


enum LabelState
{
  e_NoLabel,
  e_NewLabel,
  e_LabelReference
};



// Structure for labels in a pair of : label_name/resolved_flag
struct ReferencedLabelEntry
{
  bool		    m_IsResolved = false;
  std::string label_name;
  std::string file_name;
  int         line_number = 0;
  int         reference_count = 0;
};

// Lib index structure in pair of : label_name/file_containing_label
struct LabelEntry
{
  std::string label_name;
  std::string file_name;
};

class FileEntry
{
public:
  std::string	m_FileName;
  int			    m_SortPriority = 0;  ///< 1 for file given in command line or 0 for files given from lib file index, 2 for tail. It's used for sort...
};



const char* gLabelPattern=" *+-;:\\\n/\t,()";




class Linker : public ArgumentParser
{
public:
  Linker(int argc, char* argv[])
    : ArgumentParser(argc, argv)
  {
  }

  int Main();

  bool ParseFile(const std::string& filename);
  LabelState parseline(char* inpline, bool parseIncludeFiles);

  bool LoadLibrary(const std::string& path_library_files);

public:
  bool m_FlagKeepComments = false;			        ///< Use -C option to control
  bool m_FlagIncludeHeader = true;			        ///< Use -B option to force to 0
  bool m_FlagEnableFileDirective = false;	      ///< Use -F option to enable (force to one)
  bool m_FlagVerbose = false;				            ///< Use -V option to enable
  bool m_FlagQuiet = false;					            ///< Use -Q option to enable (note: seems to work the other way arround !)
  bool m_FlagLibrarian = false;				          ///< Use -L option to enable

  char *m_CurrentToken = nullptr;               ///< Contains the last value read from strtok while parsing files

  // Init the path_library_files variable with default library directory and the output_file_name var with the default go.s
  std::string m_PathLibraryFiles = "lib6502\\";  ///< Directory to find library files (Set by -d)
  std::string m_PathSourceFiles = "";            ///< Directory to find source files (set by -s)
  std::string m_OutputFileName = "go.s";         ///< Output file (set by -o)

  
  std::vector<FileEntry>			m_InputFileList;                ///< contains filenames to be linked based on 'm_SortPriority' for the order.
  std::vector<LabelEntry>			m_LibraryReferencesList;
  std::vector<ReferencedLabelEntry>	m_ReferencedLabelsList;
  std::set<std::string>				m_DefinedLabelsList;
};




std::string FilterLine(const std::string& sourceLine,bool keepQuotedStrings)
{
  static bool flag_in_comment_bloc=false;			// Used by the parser to know that we are currently parsing a bloc of comments

  std::string outline;
  outline.reserve(MAX_LINE_SIZE);

  const char* source_line=sourceLine.c_str();
  while (char car=*source_line++)
  {
    if (flag_in_comment_bloc)						// In a C block comment - that one may have been started on another line
    {
      if ( (car=='*') && (*source_line=='/') )
      {
        // Found end of C block comment
        source_line++;
        flag_in_comment_bloc=false;
      }
    }
    else
    {
      if (car=='\"')
      {
        // Found start of quoted string
        do
        {
          if (keepQuotedStrings)
          {
            outline+=car;
          }
          car=*source_line++;
        }
        while (car && (car!='\"'));
        if (car && keepQuotedStrings)
        {
          outline+=car;
        }
      }
      else
      if (car==';')
      {
        // Found start of assembler line comment - just stop here
        return outline;
      }
      else
      if ( (car=='/') && (*source_line=='*') )
      {
        // Found start of C block comment
        source_line++;
        flag_in_comment_bloc=true;
      }
      else
      if ( (car=='/') && (*source_line=='/') )
      {
        // Found start of C++ line comment - just stop here
        return outline;
      }
      else
      {
        // Any other character
        outline+=car;
      }
    }
  }
  return outline;
}

#if 0
std::string FilterLine(const std::string& cSourceLine)
{
  static bool flag_in_comment_bloc=false;			// Used by the parser to know that we are currently parsing a bloc of comments

  char inpline[MAX_LINE_SIZE+1];
  assert(sizeof(inpline)>cSourceLine.size());
  strcpy(inpline,cSourceLine.c_str());

  //
  // Checking for a end of C bloc comment
  //
  if (flag_in_comment_bloc)
  {
    char *ptr_line=strstr(inpline,"*/");
    if (ptr_line)
    {
      //
      // Finalize the comment
      //
      *ptr_line=0;
      strcpy(inpline+2,ptr_line);
      flag_in_comment_bloc=false;
    }
    else
    {
      //
      // We are still in the bloc
      //
      inpline[0]=0;
    }
  }

  //
  // Filtering of C++ like comments
  //
  {
    char *ptr_line=strstr(inpline,"//");
    if (ptr_line)
    {
      *ptr_line=0;
    }
  }

  //
  // Filtering of assembly comments
  //
  {
    char *ptr_line=strchr(inpline,';');
    if (ptr_line)
    {
      *ptr_line=0;
    }
  }

  //
  // Checking for a beginning of C bloc comment
  //
  if (!flag_in_comment_bloc)
  {
    char *ptr_line=strstr(inpline,"/*");
    if (ptr_line)
    {
      *ptr_line=0;
      flag_in_comment_bloc=true;
    }
  }

  return std::string(inpline);
}
#endif


/*
C:\OSDK\BIN\link65.exe -d C:\OSDK\lib/ -o C:\OSDK\TMP\linked.s -s C:\OSDK\TMP\ -q main
*/

//
// Parse a line. Mask out comment lines and null lines.
// Clear ending comments.
// Return defined labels in label var, with return value of 1
// Return labels used by JSR, JMP, LDA, STA in label var, with ret value of 2
//
LabelState Linker::parseline(char* inpline,bool parseIncludeFiles)
{
  char *tmp;

  /*
  char inpline[MAX_LINE_SIZE+1];
  assert(sizeof(inpline)>cInputLine.size());
  strncpy(inpline,cInputLine.c_str(),MAX_LINE_SIZE);
  inpline[MAX_LINE_SIZE]=0;
  */

  int len=strlen(inpline);

  //
  // Return if comment line or too small line
  //
  if (inpline[0] ==';')	  return e_NoLabel;
  if (len < 2)		        return e_NoLabel;

  //
  // Is a label defined..? (first char in line is what we want)
  //
  if ((inpline[0] !=' ') && (inpline[0] != 9))
  {
    m_CurrentToken=strtok(inpline,gLabelPattern);
    if (!m_CurrentToken)
    {
      //
      // No token was found
      //
      return e_NoLabel;
    }

    if (m_CurrentToken[0]=='#')
    {
      //
      // It's a preprocessor directive
      //
      if (!stricmp(m_CurrentToken,"#define"))	// MIKE: Do not need problems with #define (for XA equates)
      {
        //
        // #define is always followed by something that can be considered as a label.
        // For the linker that means that we have to add this 'label' in the list of
        // things to consider as internal linkage. (no need to lookup in the librarie)
        //
        // Read define name
        m_CurrentToken=strtok(NULL,gLabelPattern);
        return e_NewLabel;
      }
      else if (!stricmp(m_CurrentToken,"#include"))
      {
        //
        // Problem with #include is that they may contain labels,
        // but we do not want to insert the content of the file,
        // so basically we should just recurse on the name without
        // including the content.
        // A kind of "label eater", really.
        //
        // Read define name
        //const char* pcFilename=strtok(NULL," \"*+-;\\\n/\t,()");
        const char* filename=strtok(NULL," \"<>");
        if (parseIncludeFiles)
        {
          if (!filename)
          {
            ShowError("Invalid or missing filename after #include directive");
          }
          else
          {
            ParseFile(filename);
          }
        }
        /*
        if (!stricmp(pcFilename,"GenericEditorRoutines.s"))
        {
        printf("toto");
        }
        ParseFile(pcFilename);
        */
        return e_NoLabel;
      }
      //
      // Other '#' directives are not considered as labels.
      //
      return e_NoLabel;
    }
    else
    if ((m_CurrentToken[0]=='.') && ((m_CurrentToken[1]=='(') || (m_CurrentToken[1]==')')) )
    {
      // Opening or closing a local scope, not considered as label
      return e_NoLabel;
    }
    else
    {
      //
      // Something else (probably a label)
      //
      return e_NewLabel;
    }
  }

  //
  // Check for JMP or JSR and for the following label
  //
  int status = 0;
  tmp=strtok(inpline,gLabelPattern);
  while (tmp != NULL)
  {
    if (status == 1)
      break;

    if (!stricmp(tmp,"JSR"))		status = 1;
    else
    if (!stricmp(tmp,"JMP"))		status = 1;
    else
    if (!stricmp(tmp,"LDA"))		status = 1;
    else
    if (!stricmp(tmp,"STA"))		status = 1;
    else
    if (!stricmp(tmp,"LDX"))		status = 1;
    else
    if (!stricmp(tmp,"STX"))		status = 1;
    else
    if (!stricmp(tmp,"LDY"))		status = 1;
    else
    if (!stricmp(tmp,"STY"))		status = 1;

    //
    // Get next token in same line. This is the way strtok works
    //
    tmp=strtok(NULL,gLabelPattern);
  }
  if (tmp)
  {
    if ((status == 1)  && tmp[0] != '$' && tmp[0] != '(' && tmp[0] != '#' && !isdigit(tmp[0]))
    {
      m_CurrentToken = tmp;
      return e_LabelReference;
    }
    if ((status == 1) && (tmp[0] == '#') )
    {
      if (tmp[1] == 'H' || tmp[1] == 'L')
      {
        //
        // HIGH / LOW syntax
        //
        tmp=strtok(NULL," *+-;:\\\n/\t,()<>");
        if (tmp != NULL && tmp[0] != '$' && tmp[0] != '(' && tmp[0] != '#' && !isdigit(tmp[0]))
        {
          m_CurrentToken=tmp;
          return e_LabelReference;
        }
      }
      else
      if (tmp[1]=='<' || tmp[1]=='>')
      {
        // < / > syntax
        if (tmp[2])
        {
          tmp+=2;
        }
        else
        {
          tmp=strtok(NULL," *+-;:\\\n/\t,()<>");
        }

        if (tmp != NULL && tmp[0] != '$' && tmp[0] != '(' && tmp[0] != '#' && !isdigit(tmp[0]))
        {
          m_CurrentToken=tmp;
          return e_LabelReference;
        }
      }
    }
  }
  return e_NoLabel;
}



bool Linker::ParseFile(const std::string& filename)
{
  std::vector<std::string> textData;
  if (!LoadText(filename.c_str(),textData))
  {
    ShowError("\nCannot open %s \n",filename.c_str());
  }

  if (m_FlagVerbose)
    printf("\nScanning file %s " ,filename.c_str());

  bool parseIncludeFiles=false;
  size_t sizeFileName=filename.size();
  if ( (sizeFileName>=2) && 
       (filename[sizeFileName-2]=='.') &&
       std::tolower(filename[sizeFileName-1]=='s')
     )   // Quick hack, we parse the includes in the assembler files, need proper detection of format
  {
    parseIncludeFiles=true;
  }


  unsigned int i;

  // Scanning the file
  int line_number = 0;
  std::vector<std::string>::const_iterator itText=textData.begin();
  while (itText!=textData.end())
  {
    //  Get line file and parse it
    const std::string& currentLine=*itText;
    ++line_number;

    // test
#if 0
    if (cCurrentLine.find("_califragilistic")!=std::string::npos)
    {
      i=0;
    }
#endif

    std::string filteredLine=FilterLine(currentLine,true/*false*/);  // removing quoted strings unfortunately fails on #include...

    char inpline[MAX_LINE_SIZE+1];
    assert(sizeof(inpline)>filteredLine.size());
    strncpy(inpline,filteredLine.c_str(),MAX_LINE_SIZE);
    inpline[MAX_LINE_SIZE]=0;
    
    char* nexToken=inpline-1;

    while (nexToken)
    {
      char* tokenPtr=nexToken+1;
      nexToken=strchr(tokenPtr,':');
      LabelState state=parseline(tokenPtr,parseIncludeFiles);

      std::string foundLabel;
      if ((state!=e_NoLabel) && m_CurrentToken)
      {
        foundLabel=m_CurrentToken;
      }

      //  Oh, a label defined. Stuff it in storage
      if (state == e_NewLabel)
      {
        std::set<std::string>::iterator cIt=m_DefinedLabelsList.find(foundLabel);
        if (cIt!=m_DefinedLabelsList.end())
        {
          // Found the label in the list.
          // It's a duplicate definition... does not mean it's an error, because XA handles allows local labels !
          //printf("\nError ! Duplicate label : %s\n",label);
          //outall();
          //exit(1);
          //break;
        }
        else
        {
          // Insert new label in the set
          m_DefinedLabelsList.insert(foundLabel);
        }
      }
      else
      if (state == e_LabelReference)
      {
        // A label reference.
        // Store it if not already in list.
        bool undefinedLabel=true;
        for (i=0;i<m_ReferencedLabelsList.size();i++)
        {
          if (m_ReferencedLabelsList[i].label_name == foundLabel)
          {
            ++m_ReferencedLabelsList[i].reference_count;    // One more reference
            undefinedLabel=false;
            break;
          }
        }

        if (undefinedLabel)
        {
          // Allocate memory for label name and store it
          ReferencedLabelEntry labelEntry;
          labelEntry.label_name		 = foundLabel;
          labelEntry.m_IsResolved  = false;
          labelEntry.file_name     = filename;         // Store the filename of the first reference to the label
          labelEntry.line_number   = line_number;      // as well as the line number, to make it easier to locate issue
          labelEntry.reference_count = 1;

          m_ReferencedLabelsList.push_back(labelEntry);
        }
      }
    }
    ++itText;
  }

  return true;
}




bool Linker::LoadLibrary(const std::string& path_library_files)
{
  std::string ndxstr=path_library_files+"library.ndx";

  std::vector<std::string> textData;
  if (!LoadText(ndxstr.c_str(),textData))
  {
    ShowError("Cannot open Index file : %s \n",ndxstr.c_str());
  }

  if (m_FlagVerbose)
    printf("Reading lib index file\n");

  LabelEntry labelEntry;
  labelEntry.file_name	="";
  labelEntry.label_name	="";

  std::vector<std::string>::const_iterator itText=textData.begin();
  while (itText!=textData.end())
  {
    //  Get line file and parse it
    std::string currentLine=StringTrim(*itText);

    // Lines that indicate files start with -
    //if (cCurrentLine[0] < 32)
    //	break;

    if (!currentLine.empty())
    {
      if (currentLine[0] == '-')
      {
        // Found a file indicator. Check if already used, if not start using it in table
        labelEntry.file_name=path_library_files+(currentLine.c_str()+1);
        // check for duplicate
        for (unsigned int i=0;i<m_LibraryReferencesList.size();i++)
        {
          if (labelEntry.file_name==m_LibraryReferencesList[i].file_name)
          {
            ShowError("Duplicate file %s in lib index\n",labelEntry.file_name.c_str());
          }
        }
      }
      else
      {
        // Found a label. Check if already used, if not put it in table
        if (labelEntry.file_name.size()<2)
        {
          ShowError("Error with file line indicator\n");
        }

        labelEntry.label_name=currentLine;

        // Check if label is duplicate
        for (unsigned int i=0;i<m_LibraryReferencesList.size();i++)
        {
          if (labelEntry.label_name==m_LibraryReferencesList[i].label_name)
          {
            ShowError("Duplicate label %s in lib index file\n",labelEntry.label_name.c_str());
          }
        }

        // One more entry in the table
        m_LibraryReferencesList.push_back(labelEntry);
      }
    }
    ++itText;
  }

  return true;
}





int Linker::Main()
{
  while (ProcessNextArgument())
  {
    if (IsSwitch("-q") || IsSwitch("-Q"))
    {
      // Quiet mode.
      m_FlagQuiet=true;
    }
    else
    if (IsSwitch("-l") || IsSwitch("-L"))
    {
      // Print out defined labels (Useful when building lib index files)
      m_FlagLibrarian=true;
    }
    else
    if (IsSwitch("-v") || IsSwitch("-V"))
    {
      // Verbose output.
      m_FlagVerbose=true;
    }
    else
    if (IsSwitch("-d") || IsSwitch("-D"))
    {
      // Directory to find library files.Next arg in line is the dir name. e.g : link65 -d /usr/oric/lib/ test.s
      if (!ProcessNextArgument() || !IsParameter())
      {
        printf(" Must have dir name after -d option\n");
        exit(1);
      }
      m_PathLibraryFiles=GetStringValue();
    }
    else
    if (IsSwitch("-s") || IsSwitch("-S"))
    {
      // Directory to find source files.Next arg in line is the dir name
      if (!ProcessNextArgument() || !IsParameter())
      {
        printf(" Must have dir name after -s option\n");
        exit(1);
      }
      m_PathSourceFiles=GetStringValue();
    }
    else
    if (IsSwitch("-o") || IsSwitch("-O"))
    {
      // Output file. Default is go.s . Next arg in line is the file name. e.g : link65 -o out.s test.s
      if (!ProcessNextArgument() || !IsParameter())
      {
        printf(" Must have file name after -o option\n");
        exit(1);
      }
      m_OutputFileName=GetStringValue();
    }
    else
    if (IsSwitch("-b") || IsSwitch("-B"))
    {
      // Bare linking, does not add "header" and "tail" to the list
      m_FlagIncludeHeader=false;
    }
    else
    if (IsSwitch("-f") || IsSwitch("-F"))
    {
      // Enable the #file directive (require expanded XA assembler)
      m_FlagEnableFileDirective=true;
    }
    else
    if (IsParameter())
    {
      // Not a switch
      FileEntry fileEntry;

      if (m_FlagIncludeHeader && m_InputFileList.empty())
      {
        // header.s is the first file used.
        // So reserve the 0 place in array for after option scanning, to put there the dir name too if needed.
        fileEntry.m_FileName	  =m_PathLibraryFiles;
        fileEntry.m_FileName   +="header.s";
        fileEntry.m_SortPriority=0;
        m_InputFileList.push_back(fileEntry);
      }

      //
      // Then we add the new file
      //
      fileEntry.m_FileName	  =m_PathSourceFiles;
      fileEntry.m_FileName   +=GetStringValue();
      fileEntry.m_SortPriority=1;
      m_InputFileList.push_back(fileEntry);
    }
    else
    if (IsSwitch("-c"))
    {
      //comments: [-c]
      //	0 => remove comments
      // 	1 => keep comments
      m_FlagKeepComments=GetBooleanValue(false);
    }
    else
    {
      // Unknown argument
      printf("Invalid option %s \n",GetRemainingStuff());
      exit(1);
    }
  }

  if (GetParameterCount())
  {
    ShowError(0);
  }


  if (!m_FlagQuiet)
  {
    printf("\nLink65: 6502 Linker, by Vagelis Blathras. Version %d.%3d\n\n",TOOL_VERSION_MAJOR,TOOL_VERSION_MINOR);
  }


  if (m_FlagIncludeHeader)
  {
    // Now put the tail.s .
    // Give it nflist of 2 to put it last in file list after the sort
    FileEntry fileEntry;
    fileEntry.m_FileName	  =m_PathLibraryFiles;
    fileEntry.m_FileName   +="tail.s";
    fileEntry.m_SortPriority=2;
    m_InputFileList.push_back(fileEntry);
  }


  // Open and scan Index file for labels - file pair list
  LoadLibrary(m_PathLibraryFiles);

  int state;
  unsigned int i,j;
  unsigned int k,l;

  // Scanning files loop
  for (k=0;k<m_InputFileList.size();k++)
  {
    // Skip header.s file if gFlagLibrarian option is on
    if (m_FlagLibrarian && k == 0)
    {
      k=1;
    }

    //char filename[255];
    //strcpy(filename,gInputFileList[k].m_cFileName.c_str());
    ParseFile(m_InputFileList[k].m_FileName);

    //
    // Check if used labels are defined inside the files
    //
    std::vector<ReferencedLabelEntry>::iterator itReferenced=m_ReferencedLabelsList.begin();
    while  (itReferenced!=m_ReferencedLabelsList.end())
    {
      ReferencedLabelEntry& labelEntry=*itReferenced;
      std::set<std::string>::iterator it=m_DefinedLabelsList.find(labelEntry.label_name);
      if (it!=m_DefinedLabelsList.end())
      {
        // Found the label in the definition list
        labelEntry.m_IsResolved=true;
      }
      ++itReferenced;
    }

    if (!m_FlagLibrarian)
    {
      // Check for not resolved labels.
      // If defined in lib file index then insert their file right after in the list
      for (i=0;i<m_ReferencedLabelsList.size();i++)
      {
        // Unresolved label and -l option off. If -l option is on don't care
        ReferencedLabelEntry& referencedLabelEntry=m_ReferencedLabelsList[i];
        if (!referencedLabelEntry.m_IsResolved)
        {
          // Act for unresolved label
          for (j=0;j<m_LibraryReferencesList.size();j++)
          {
            LabelEntry& labelEntry=m_LibraryReferencesList[j];
            // If in lib file index, take file and put it in gInputFileList if not already there
            if (referencedLabelEntry.label_name==labelEntry.label_name)
            {
              bool labstate=true;
              for (l=0;l<m_InputFileList.size();l++)
              {
                FileEntry& cFileEntry=m_InputFileList[l];
                if (cFileEntry.m_FileName==labelEntry.file_name)
                {
                  labstate=false;
                  break;
                }
              }

              // Not present : labstate == 1 , insert file in list
              if (labstate)
              {
                FileEntry	newEntry;
                m_InputFileList.push_back(newEntry);

                // NICE TRICK : Insert lib file in file list to be processed immediately.
                // With this labels used by the lib file will be resolved, without the need for multiple passes
                for (l=m_InputFileList.size()-1;l>k+1;l--)
                {
                  m_InputFileList[l]=m_InputFileList[l-1];
                }
                FileEntry& cFileEntry=m_InputFileList[k+1];
                cFileEntry.m_FileName		=labelEntry.file_name;
                cFileEntry.m_SortPriority	=1;
              }
              else
              {
                break;
              }
            }
          }
        }
      }
    }
  }

  if (m_FlagVerbose)
    printf("\nend scanning files \n\n");

  state=0;

  if (m_FlagLibrarian)
  {
    // If -l option just print labels and then exit
    printf("\nDefined Labels : \n");

    std::set<std::string>::iterator it=m_DefinedLabelsList.begin();
    while (it!=m_DefinedLabelsList.end())
    {
      const std::string& cLabelName=*it;
      printf("%s\n",cLabelName.c_str());
      ++it;
    }
    return 0;
  }
  else
  {
    // Check for Unresolved external references.
    // Print them all before exiting
    for (i=0;i<m_ReferencedLabelsList.size();i++)
    {
      ReferencedLabelEntry& referencedLabelEntry=m_ReferencedLabelsList[i];
      if (!referencedLabelEntry.m_IsResolved)
      {
        printf("Unresolved external: %s, first referenced in %s(%d) [referenced %d times]\n",referencedLabelEntry.label_name.c_str(), referencedLabelEntry.file_name.c_str(), referencedLabelEntry.line_number, referencedLabelEntry.reference_count);
        state=1;
      }
    }
  }

  if (state == 1)
  {
    ShowError("Errors durink link.\n");
  }


  // Combine all files in list in a nice big juicy go.s or file selected
  FILE *gofile=fopen(m_OutputFileName.c_str(),"wb");
  if (!gofile)
  {
    ShowError("Cannot open output file for writing\n");
  }

  //
  // Add a simple header to the linked file
  //
  fprintf(gofile,
    "//\r\n"
    "// This file was generated by Link65 version %d.%03d \r\n"
    "// Do not edit by hand\r\n"
    "//\r\n"
    ,TOOL_VERSION_MAJOR,TOOL_VERSION_MINOR);


  // Get lines from all files and put them in go.s
  for (k=0;k<m_InputFileList.size();k++)
  {
    if (m_FlagVerbose)
    {
      printf("Linking %s\n",m_InputFileList[k].m_FileName.c_str());
    }

    //
    // Then insert the name of the included file
    //
    if (m_FlagEnableFileDirective)
    {
      char current_directory[_MAX_PATH+1];
      char filename[_MAX_PATH];
      char dummy[_MAX_PATH];

      getcwd(current_directory,_MAX_PATH);
      _splitpath(m_InputFileList[k].m_FileName.c_str(),dummy,dummy,filename,dummy);

      fprintf(gofile,"#file \"%s\\%s.s\"\r\n",current_directory,filename);
    }

    // Mike: The code should really reuse the previously loaded/parsed files
    std::vector<std::string> textData;
    if (!LoadText(m_InputFileList[k].m_FileName.c_str(),textData))
    {
      ShowError("\nCannot open %s \n",m_InputFileList[k].m_FileName.c_str());
    }

    std::vector<std::string>::const_iterator itText=textData.begin();
    while (itText!=textData.end())
    {
      //  Get line file and parse it
      const std::string& currentLine=*itText;
      if (m_FlagKeepComments)
      {
        fprintf(gofile,"%s\r\n",currentLine.c_str());
      }
      else
      {
        std::string filteredLine=FilterLine(currentLine,true);
        fprintf(gofile,"%s\r\n",filteredLine.c_str());
      }
      ++itText;
    }
  }
  return 0;
}



int main(int argc, char* argv[])
{
  try
  {
    //
    // Some initialization for the common library
    //
    SetApplicationParameters(
      "Link65",
      TOOL_VERSION_MAJOR,
      TOOL_VERSION_MINOR,
      "{ApplicationName} - Version {ApplicationVersion} - This program is a part of the OSDK (http://www.osdk.org)\r\n"
      "\r\n"
      "Author:\r\n"
      "  Vagelis Blathras\r\n"
      "Maintainer:\r\n"
      "  Mickael Pointier (aka Dbug)\r\n"
      "  dbug@defence-force.org\r\n"
      "  http://www.defence-force.org\r\n"
      "\r\n"
      "Purpose:\r\n"
      "  Gluing together a set of 6502 assembly source codes, and solve the external\r\n"
      "  references by looking up missing ones in the library files.\r\n"
      "\r\n"
      "Usage : {ApplicationName} [options] file1 file2 ...\n"
      "Options:\r\n"
      "  -d : Directory to find library files.Next arg in line is the dir name.\r\n"
      "       e.g : link65 -d /usr/oric/lib/ test.s\r\n"
      "  -s : Directory to find source files.Next arg in line is the dir name.\r\n"
      "  -o : Output file. Default is go.s . Next arg in line is the file name.\r\n"
      "       e.g : link65 -o out.s test.s\r\n"
      "  -l : Print out defined labels.Usefull when building lib index files.\r\n"
      "  -v : Verbose output.\r\n"
      "  -q : Quiet mode.\r\n"
      "  -b : Bare linking (don't include header and tail).\r\n"
      "  -f : Insert #file directives (require expanded XA assembler).\r\n"
      "  -cn: Defines if comments should be kept (-c1) or removed (-c0) [Default]. \r\n"
      );

    Linker linker(argc, argv);
    return linker.Main();
  }

  catch (const std::exception& e)
  {
    ShowError("Exception thrown: %s", e.what());
  }
}
