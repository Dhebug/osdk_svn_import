//
// Floppy layout generated by FloppyBuilder 1.2
//

#ifdef ASSEMBLER
//
// Information for the Assembler
//
#ifdef LOADER
FileStartSector .byt 135,131,129,132,134,144,131,132,130,140,129,131,135,133,136,138,143,133,142,132,130,139
FileStartTrack .byt 0,1,2,2,2,2,3,3,4,4,5,5,5,6,6,6,6,7,7,8,9,9
FileSizeLow .byt <12663,<15045,<760,<576,<8000,<3432,<50,<12173,<8000,<6144,<1733,<5376,<8812,<2002,<1585,<1543,<2643,<4556,<4397,<8978,<5267,<2680
FileSizeHigh .byt >12663,>15045,>760,>576,>8000,>3432,>50,>12173,>8000,>6144,>1733,>5376,>8812,>2002,>1585,>1543,>2643,>4556,>4397,>8978,>5267,>2680
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
#define FLOPPY_LOADER_ADDRESS 64768   // Address where the loader is loaded on boot ($fd00)

//
// List of files written to the floppy
//
// Entry #0 '..\build\files\intro.o'
// - Starts on  track 0 sector 7 and is 13 sectors long (3317 compressed bytes: 26% of 12663 bytes).
// Entry #1 '..\build\files\techtech.o'
// - Starts on  track 1 sector 3 and is 15 sectors long (3666 compressed bytes: 24% of 15045 bytes).
// Entry #2 '..\build\files\Font6x8.hir'
// - Starts on  track 2 sector 1 and is 3 sectors long (556 compressed bytes: 73% of 760 bytes).
// Entry #3 '..\build\files\Font6x6.hir'
// - Starts on  track 2 sector 4 and is 2 sectors long (447 compressed bytes: 77% of 576 bytes).
// Entry #4 '..\build\files\vip_rasters.hir'
// - Starts on  track 2 sector 6 and is 10 sectors long (2550 compressed bytes: 31% of 8000 bytes).
// Entry #5 '..\build\files\cloud.hir'
// - Starts on  track 2 sector 16 and is 4 sectors long (920 compressed bytes: 26% of 3432 bytes).
// Entry #6 '..\build\files\rain_drop.hir'
// - Starts on  track 3 sector 3 and is 1 sectors long (42 compressed bytes: 84% of 50 bytes).
// Entry #7 '..\build\files\long_scroller.hir'
// - Starts on  track 3 sector 4 and is 15 sectors long (3599 compressed bytes: 29% of 12173 bytes).
// Entry #8 '..\build\files\SoundWarning.hir'
// - Starts on  track 4 sector 2 and is 10 sectors long (2516 compressed bytes: 31% of 8000 bytes).
// Entry #9 '..\build\files\VIPScroll.hir'
// - Starts on  track 4 sector 12 and is 6 sectors long (1435 compressed bytes: 23% of 6144 bytes).
// Entry #10 '..\build\files\font_30x40.hir'
// - Starts on  track 5 sector 1 and is 2 sectors long (463 compressed bytes: 26% of 1733 bytes).
// Entry #11 '..\build\files\overlay.hir'
// - Starts on  track 5 sector 3 and is 4 sectors long (785 compressed bytes: 14% of 5376 bytes).
// Entry #12 '..\build\files\BoomTschak.raw'
// - Starts on  track 5 sector 7 and is 15 sectors long (3661 compressed bytes: 41% of 8812 bytes).
// Entry #13 '..\build\files\SampleDefence.raw'
// - Starts on  track 6 sector 5 and is 3 sectors long (697 compressed bytes: 34% of 2002 bytes).
// Entry #14 '..\build\files\SampleForce.raw'
// - Starts on  track 6 sector 8 and is 2 sectors long (380 compressed bytes: 23% of 1585 bytes).
// Entry #15 '..\build\files\SampleHa.raw'
// - Starts on  track 6 sector 10 and is 5 sectors long (1052 compressed bytes: 68% of 1543 bytes).
// Entry #16 '..\build\files\SampleYeah.raw'
// - Starts on  track 6 sector 15 and is 7 sectors long (1618 compressed bytes: 61% of 2643 bytes).
// Entry #17 '..\build\files\SampleChimeLoopStart.raw'
// - Starts on  track 7 sector 5 and is 9 sectors long (2253 compressed bytes: 49% of 4556 bytes).
// Entry #18 '..\build\files\SampleChimeLoopEnd.raw'
// - Starts on  track 7 sector 14 and is 7 sectors long (1557 compressed bytes: 35% of 4397 bytes).
// Entry #19 '..\build\files\SampleMusicNonStop.raw'
// - Starts on  track 8 sector 4 and is 15 sectors long (3713 compressed bytes: 41% of 8978 bytes).
// Entry #20 '..\build\files\SampleTechnoPop.raw'
// - Starts on  track 9 sector 2 and is 9 sectors long (2076 compressed bytes: 39% of 5267 bytes).
// Entry #21 '..\build\files\ThalionIntro.mym'
// - Starts on  track 9 sector 11 and is 8 sectors long (1984 compressed bytes: 74% of 2680 bytes).
//
// 171 sectors used, out of 1428. (11% of the total disk size used)
//
#define LOADER_SECTOR_BUFFER $200
#define LOADER_BASE_ZERO_PAGE $F2
#define LOADER_INTRO_PROGRAM 0
#define LOADER_INTRO_PROGRAM_ADDRESS $c000
#define LOADER_INTRO_PROGRAM_TRACK 0
#define LOADER_INTRO_PROGRAM_SECTOR 135
#define LOADER_INTRO_PROGRAM_SIZE 12663
#define LOADER_INTRO_PROGRAM_SIZE_COMPRESSED 3317
#define LOADER_TECHTECH_SECOND 1
#define LOADER_TECHTECH_SECOND_ADDRESS $c000
#define LOADER_TECHTECH_SECOND_TRACK 1
#define LOADER_TECHTECH_SECOND_SECTOR 131
#define LOADER_TECHTECH_SECOND_SIZE 15045
#define LOADER_TECHTECH_SECOND_SIZE_COMPRESSED 3666
#define LOADER_FONT_6x8 2
#define LOADER_FONT_6x6 3
#define LOADER_VIP_LOGO 4
#define LOADER_VIP_LOGO_SIZE 8000
#define LOADER_CLOUD 5
#define LOADER_CLOUD_SIZE 3432
#define LOADER_RAINDROP 6
#define LOADER_RAINDROP_SIZE 50
#define LOADER_LONG_SCROLLER 7
#define LOADER_LONG_SCROLLER_SIZE 12173
#define LOADER_SOUND_WARNING 8
#define LOADER_SOUND_WARNING_SIZE 8000
#define LOADER_VIP_SCROLL 9
#define LOADER_VIP_SCROLL_SIZE 6144
#define LOADER_FONT_30x40 10
#define LOADER_FONT_30x40_SIZE 1733
#define LOADER_OVERLAY 11
#define LOADER_OVERLAY_SIZE 5376
#define LOADER_SAMPLE_BOOMTSCHACK 12
#define LOADER_SAMPLE_BOOMTSCHACK_SIZE 8812
#define LOADER_SAMPLE_DEFENCE 13
#define LOADER_SAMPLE_DEFENCE_SIZE 2002
#define LOADER_SAMPLE_FORCE 14
#define LOADER_SAMPLE_FORCE_SIZE 1585
#define LOADER_SAMPLE_HA 15
#define LOADER_SAMPLE_HA_SIZE 1543
#define LOADER_SAMPLE_YEAH 16
#define LOADER_SAMPLE_YEAH_SIZE 2643
#define LOADER_SAMPLE_CHIME_START 17
#define LOADER_SAMPLE_CHIME_START_SIZE 4556
#define LOADER_SAMPLE_CHIME_END 18
#define LOADER_SAMPLE_CHIME_END_SIZE 4397
#define LOADER_SAMPLE_MUSIC_NON_STOP 19
#define LOADER_SAMPLE_MUSIC_NON_STOP_SIZE 8978
#define LOADER_SAMPLE_TECHNO_POP 20
#define LOADER_SAMPLE_TECHNO_POP_SIZE 5267
#define LOADER_INTRO_MUSIC 21
#define LOADER_INTRO_MUSIC_SIZE 2680

//
// Metadata
//
#ifdef METADATA_STORAGE

#endif // METADATA_STORAGE

