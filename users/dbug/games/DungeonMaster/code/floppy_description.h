//
// Floppy layout generated by FloppyBuilder 1.2
//

#ifdef ASSEMBLER
//
// Information for the Assembler
//
#ifdef LOADER
FileStartSector .byt 134,136,138,141
FileStartTrack .byt 0,2,2,2
FileSizeLow .byt <28961,<519,<768,<8000
FileSizeHigh .byt >28961,>519,>768,>8000
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
// Entry #0 '..\build\files\IntroProgram.o'
// - Starts on  track 0 sector 6 and is 36 sectors long (9042 compressed bytes: 31% of 28961 bytes).
// Entry #1 '..\build\files\GameProgram.o'
// - Starts on  track 2 sector 8 and is 2 sectors long (301 compressed bytes: 57% of 519 bytes).
// Entry #2 '..\build\files\font_6x8_mystery.fnt'
// - Starts on  track 2 sector 10 and is 3 sectors long (546 compressed bytes: 71% of 768 bytes).
// Entry #3 '..\build\files\scroll_credits.hir'
// - Starts on  track 2 sector 13 and is 11 sectors long (2669 compressed bytes: 33% of 8000 bytes).
//
// 57 sectors used, out of 1428. (3% of the total disk size used)
//
#define LOADER_SECTOR_BUFFER $200
#define LOADER_BASE_ZERO_PAGE $F2
#define LOADER_INTRO_PROGRAM 0
#define LOADER_INTRO_PROGRAM_ADDRESS $400
#define LOADER_INTRO_PROGRAM_TRACK 0
#define LOADER_INTRO_PROGRAM_SECTOR 134
#define LOADER_INTRO_PROGRAM_SIZE 28961
#define LOADER_INTRO_PROGRAM_SIZE_COMPRESSED 9042
#define LOADER_PROGRAM_SECOND 1
#define LOADER_PROGRAM_SECOND_SIZE 519
#define LOADER_PROGRAM_SECOND_SIZE_COMPRESSED 301
#define LOADER_FONT_6x8 2
#define LOADER_SCROLL_CREDITS 3

//
// Metadata
//
#ifdef METADATA_STORAGE

#endif // METADATA_STORAGE

