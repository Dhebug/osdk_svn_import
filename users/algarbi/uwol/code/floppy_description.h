//
// Floppy layout generated by FloppyBuilder 0.8
//

#ifdef ASSEMBLER
//
// Information for the Assembler
//
#ifdef LOADER
FileStartSector .byt 4,1,5
FileStartTrack .byt 0,1,6
FileSizeLow .byt <1024,<22554,<8960
FileSizeHigh .byt >1024,>22554,>8960
FileLoadAdressLow .byt <64512,<1280,<40960
FileLoadAdressHigh .byt >64512,>1280,>40960
#endif
#else
//
// Information for the Compiler
//
#endif

//
// Summary for this floppy building session:
#define FLOPPY_SIDE_NUMBER 2    // Number of sides
#define FLOPPY_TRACK_NUMBER 42    // Number of tracks
#define FLOPPY_SECTOR_PER_TRACK 17   // Number of sectors per track
//
// List of files written to the floppy
// - Entry #0 '..\build\files\loader.o ' loads at address 64512 starts on track 0 sector 4 and is 4 sectors long (1024 bytes).
// - Entry #1 '..\data\uwol.tap ' loads at address 1280 starts on track 1 sector 1 and is 89 sectors long (22554 bytes).
// - Entry #2 '..\build\files\uwoloric.hir ' loads at address 40960 starts on track 6 sector 5 and is 35 sectors long (8960 bytes).
//
#define LOADER_SLIDESHOW 1
#define LOADER_FIRST_PICTURE 2
#define LOADER_LAST_PICTURE 3
