//
// Floppy layout generated by FloppyBuilder 1.1
//

#ifdef ASSEMBLER
//
// Information for the Assembler
//
#ifdef LOADER
FileStartSector .byt 134,142,145,131,145
FileStartTrack .byt 0,0,0,1,1
FileSizeLow .byt <3840,<760,<1536,<8000,<8000
FileSizeHigh .byt >3840,>760,>1536,>8000,>8000
#undef LOADER
#endif // LOADER
#undef ASSEMBLER
#else
//
// Information for the Compiler
//
#endif

//
// Summary for this floppy building session:
//
#define FLOPPY_SIDE_NUMBER 2    // Number of sides
#define FLOPPY_TRACK_NUMBER 42    // Number of tracks
#define FLOPPY_SECTOR_PER_TRACK 17   // Number of sectors per track

#define FLOPPY_LOADER_TRACK 0   // Track where the loader is stored
#define FLOPPY_LOADER_SECTOR 4   // Sector where the loader is stored
#define FLOPPY_LOADER_ADDRESS 65024   // Address where the loader is loaded on boot ($fe00)

//
// List of files written to the floppy
//
// Entry #0 '..\build\files\game.o'
// - Starts on  track 0 sector 6 and is 8 sectors long (1921 compressed bytes: 50% of 3840 bytes).
// Entry #1 '..\build\files\Font6x8.hir'
// - Starts on  track 0 sector 14 and is 3 sectors long (556 compressed bytes: 73% of 760 bytes).
// Entry #2 '..\build\files\Font6x6.hir'
// - Starts on  track 0 sector 17 and is 3 sectors long (554 compressed bytes: 36% of 1536 bytes).
// Entry #3 '..\build\files\GlobalGameJamOslo.hir'
// - Starts on  track 1 sector 3 and is 14 sectors long (3337 compressed bytes: 41% of 8000 bytes).
// Entry #4 '..\build\files\title_screen.hir'
// - Starts on  track 1 sector 17 and is 12 sectors long (2977 compressed bytes: 37% of 8000 bytes).
//
// 45 sectors used, out of 1428. (3% of the total disk size used)
//
#define LOADER_SECTOR_BUFFER $200
#define LOADER_BASE_ZERO_PAGE $00
#define LOADER_GAME_PROGRAM 0
#define LOADER_GAME_PROGRAM_ADDRESS $c000
#define LOADER_GAME_PROGRAM_TRACK 0
#define LOADER_GAME_PROGRAM_SECTOR 134
#define LOADER_GAME_PROGRAM_SIZE 3840
#define LOADER_GAME_PROGRAM_SIZE_COMPRESSED 1921
#define LOADER_FONT_6x8 1
#define LOADER_FONT_6x6 2
#define LOADER_FONT_6x6_SIZE 1536
#define LOADER_GAMEJAM_LOGO 3
#define LOADER_TITLE_SCREEN 4

//
// Metadata
//
#ifdef METADATA_STORAGE

#endif // METADATA_STORAGE

