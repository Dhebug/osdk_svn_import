//
// Floppy layout generated by FloppyBuilder 1.1
//

#ifdef ASSEMBLER
//
// Information for the Assembler
//
#ifdef LOADER
FileStartSector .byt 135,137,1,2,131,133,135,141,130,131,132,134,137,140,129,136,15,144,145,132,135,138,140,14,143,135,145,130,139,129,133,137,141,132,141,132,141,130,136,130,11,140,14,15,16,17,1,130,132,134,7,8,10,11,12,13,14,15,144,1,130,131,6,7,8,9,10,11,12,13,142,16,145,132,133,130,135,134,131,142,137,131,143,141,136,129,131,140,140,137,135,141,133,133,140,138,130,138,131,140,133,145,137,132,139,133,141,134,136,129,139,132,9
FileStartTrack .byt 0,3,4,4,4,4,4,4,5,5,5,5,5,5,6,6,6,6,6,7,7,7,7,7,7,8,8,9,9,10,10,10,10,11,11,12,12,13,13,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,16,16,16,16,16,16,18,19,20,21,22,23,23,24,25,25,26,27,28,29,29,30,31,32,32,33,34,34,35,36,36,37,37,38,38,39,40,40,42,42,43,44,45,45,46,46
FileSizeLow .byt <15360,<3167,<173,<90,<550,<539,<1917,<1777,<88,<105,<289,<832,<635,<1608,<2429,<2203,<104,<258,<1103,<905,<883,<378,<603,<26,<3967,<4367,<679,<4571,<2911,<1615,<1663,<1599,<4015,<3775,<3887,<4399,<2655,<2364,<4933,<3871,<155,<293,<93,<79,<84,<117,<124,<313,<381,<108,<68,<312,<147,<76,<187,<139,<68,<150,<457,<87,<145,<580,<92,<82,<89,<173,<84,<101,<250,<126,<376,<53,<9192,<7148,<5165,<11561,<7194,<5449,<4727,<4567,<4438,<4549,<5631,<4391,<3648,<7266,<4331,<6375,<4827,<5087,<2198,<3135,<7949,<2315,<6729,<4531,<3430,<4022,<3789,<4544,<5022,<3613,<4414,<2806,<11582,<2813,<3712,<7845,<3806,<6386,<3584,<1881,<1792
FileSizeHigh .byt >15360,>3167,>173,>90,>550,>539,>1917,>1777,>88,>105,>289,>832,>635,>1608,>2429,>2203,>104,>258,>1103,>905,>883,>378,>603,>26,>3967,>4367,>679,>4571,>2911,>1615,>1663,>1599,>4015,>3775,>3887,>4399,>2655,>2364,>4933,>3871,>155,>293,>93,>79,>84,>117,>124,>313,>381,>108,>68,>312,>147,>76,>187,>139,>68,>150,>457,>87,>145,>580,>92,>82,>89,>173,>84,>101,>250,>126,>376,>53,>9192,>7148,>5165,>11561,>7194,>5449,>4727,>4567,>4438,>4549,>5631,>4391,>3648,>7266,>4331,>6375,>4827,>5087,>2198,>3135,>7949,>2315,>6729,>4531,>3430,>4022,>3789,>4544,>5022,>3613,>4414,>2806,>11582,>2813,>3712,>7845,>3806,>6386,>3584,>1881,>1792
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
#define FLOPPY_TRACK_NUMBER 80    // Number of tracks
#define FLOPPY_SECTOR_PER_TRACK 17   // Number of sectors per track

#define FLOPPY_LOADER_TRACK 0   // Track where the loader is stored
#define FLOPPY_LOADER_SECTOR 4   // Sector where the loader is stored
#define FLOPPY_LOADER_ADDRESS 64768   // Address where the loader is loaded on boot ($fd00)

//
// List of files written to the floppy
//
// Entry #0 '..\build\final.out'
// - Starts on  track 0 sector 7 and is 53 sectors long (13431 compressed bytes: 87% of 15360 bytes).
// Entry #1 '..\build\files\tables.o'
// - Starts on  track 3 sector 9 and is 9 sectors long (2274 compressed bytes: 71% of 3167 bytes).
// Entry #2 '..\build\files\script_0.o'
// - Starts on  track 4 sector 1 and is 1 sectors long (173 bytes).
// Entry #3 '..\build\files\script_1.o'
// - Starts on  track 4 sector 2 and is 1 sectors long (90 bytes).
// Entry #4 '..\build\files\script_2.o'
// - Starts on  track 4 sector 3 and is 2 sectors long (374 compressed bytes: 68% of 550 bytes).
// Entry #5 '..\build\files\script_3.o'
// - Starts on  track 4 sector 5 and is 2 sectors long (433 compressed bytes: 80% of 539 bytes).
// Entry #6 '..\build\files\script_4.o'
// - Starts on  track 4 sector 7 and is 6 sectors long (1447 compressed bytes: 75% of 1917 bytes).
// Entry #7 '..\build\files\script_5.o'
// - Starts on  track 4 sector 13 and is 6 sectors long (1415 compressed bytes: 79% of 1777 bytes).
// Entry #8 '..\build\files\script_6.o'
// - Starts on  track 5 sector 2 and is 1 sectors long (80 compressed bytes: 90% of 88 bytes).
// Entry #9 '..\build\files\script_7.o'
// - Starts on  track 5 sector 3 and is 1 sectors long (93 compressed bytes: 88% of 105 bytes).
// Entry #10 '..\build\files\script_8.o'
// - Starts on  track 5 sector 4 and is 2 sectors long (287 compressed bytes: 99% of 289 bytes).
// Entry #11 '..\build\files\script_9.o'
// - Starts on  track 5 sector 6 and is 3 sectors long (704 compressed bytes: 84% of 832 bytes).
// Entry #12 '..\build\files\script_10.o'
// - Starts on  track 5 sector 9 and is 3 sectors long (566 compressed bytes: 89% of 635 bytes).
// Entry #13 '..\build\files\script_11.o'
// - Starts on  track 5 sector 12 and is 6 sectors long (1329 compressed bytes: 82% of 1608 bytes).
// Entry #14 '..\build\files\script_15.o'
// - Starts on  track 6 sector 1 and is 7 sectors long (1743 compressed bytes: 71% of 2429 bytes).
// Entry #15 '..\build\files\script_16.o'
// - Starts on  track 6 sector 8 and is 7 sectors long (1662 compressed bytes: 75% of 2203 bytes).
// Entry #16 '..\build\files\script_17.o'
// - Starts on  track 6 sector 15 and is 1 sectors long (104 bytes).
// Entry #17 '..\build\files\string_main.o'
// - Starts on  track 6 sector 16 and is 1 sectors long (238 compressed bytes: 92% of 258 bytes).
// Entry #18 '..\build\files\string_introsvila.o'
// - Starts on  track 6 sector 17 and is 4 sectors long (898 compressed bytes: 81% of 1103 bytes).
// Entry #19 '..\build\files\string_londonplan.o'
// - Starts on  track 7 sector 4 and is 3 sectors long (734 compressed bytes: 81% of 905 bytes).
// Entry #20 '..\build\files\string_londondlg.o'
// - Starts on  track 7 sector 7 and is 3 sectors long (759 compressed bytes: 85% of 883 bytes).
// Entry #21 '..\build\files\obj_blake.o'
// - Starts on  track 7 sector 10 and is 2 sectors long (281 compressed bytes: 74% of 378 bytes).
// Entry #22 '..\build\files\obj_ep2.o'
// - Starts on  track 7 sector 12 and is 2 sectors long (465 compressed bytes: 77% of 603 bytes).
// Entry #23 '..\build\files\obj_ep3.o'
// - Starts on  track 7 sector 14 and is 1 sectors long (26 bytes).
// Entry #24 '..\build\files\cos_blake.o'
// - Starts on  track 7 sector 15 and is 9 sectors long (2148 compressed bytes: 54% of 3967 bytes).
// Entry #25 '..\build\files\cos_jenna.o'
// - Starts on  track 8 sector 7 and is 10 sectors long (2317 compressed bytes: 53% of 4367 bytes).
// Entry #26 '..\build\files\cos_camera.o'
// - Starts on  track 8 sector 17 and is 2 sectors long (468 compressed bytes: 68% of 679 bytes).
// Entry #27 '..\build\files\cos_guard.o'
// - Starts on  track 9 sector 2 and is 9 sectors long (2173 compressed bytes: 47% of 4571 bytes).
// Entry #28 '..\build\files\cos_techcam.o'
// - Starts on  track 9 sector 11 and is 7 sectors long (1542 compressed bytes: 52% of 2911 bytes).
// Entry #29 '..\build\files\cos_man.o'
// - Starts on  track 10 sector 1 and is 4 sectors long (792 compressed bytes: 49% of 1615 bytes).
// Entry #30 '..\build\files\cos_man2.o'
// - Starts on  track 10 sector 5 and is 4 sectors long (917 compressed bytes: 55% of 1663 bytes).
// Entry #31 '..\build\files\cos_travis.o'
// - Starts on  track 10 sector 9 and is 4 sectors long (802 compressed bytes: 50% of 1599 bytes).
// Entry #32 '..\build\files\cos_servalan.o'
// - Starts on  track 10 sector 13 and is 8 sectors long (2005 compressed bytes: 49% of 4015 bytes).
// Entry #33 '..\build\files\cos_vila.o'
// - Starts on  track 11 sector 4 and is 9 sectors long (2066 compressed bytes: 54% of 3775 bytes).
// Entry #34 '..\build\files\cos_avon.o'
// - Starts on  track 11 sector 13 and is 8 sectors long (1885 compressed bytes: 48% of 3887 bytes).
// Entry #35 '..\build\files\cos_gan.o'
// - Starts on  track 12 sector 4 and is 9 sectors long (2155 compressed bytes: 48% of 4399 bytes).
// Entry #36 '..\build\files\cos_bextras.o'
// - Starts on  track 12 sector 13 and is 6 sectors long (1439 compressed bytes: 54% of 2655 bytes).
// Entry #37 '..\build\files\cos_ball.o'
// - Starts on  track 13 sector 2 and is 6 sectors long (1313 compressed bytes: 55% of 2364 bytes).
// Entry #38 '..\build\files\cos_vargas.o'
// - Starts on  track 13 sector 8 and is 11 sectors long (2564 compressed bytes: 51% of 4933 bytes).
// Entry #39 '..\build\files\cos_monk.o'
// - Starts on  track 14 sector 2 and is 9 sectors long (2161 compressed bytes: 55% of 3871 bytes).
// Entry #40 '..\build\files\ocode_guard.o'
// - Starts on  track 14 sector 11 and is 1 sectors long (155 bytes).
// Entry #41 '..\build\files\ocode_sandwich.o'
// - Starts on  track 14 sector 12 and is 2 sectors long (291 compressed bytes: 99% of 293 bytes).
// Entry #42 '..\build\files\ocode_mug.o'
// - Starts on  track 14 sector 14 and is 1 sectors long (93 bytes).
// Entry #43 '..\build\files\ocode_key.o'
// - Starts on  track 14 sector 15 and is 1 sectors long (79 bytes).
// Entry #44 '..\build\files\ocode_laxative.o'
// - Starts on  track 14 sector 16 and is 1 sectors long (84 bytes).
// Entry #45 '..\build\files\ocode_coin.o'
// - Starts on  track 14 sector 17 and is 1 sectors long (117 bytes).
// Entry #46 '..\build\files\ocode_decaf.o'
// - Starts on  track 15 sector 1 and is 1 sectors long (124 bytes).
// Entry #47 '..\build\files\ocode_map.o'
// - Starts on  track 15 sector 2 and is 2 sectors long (279 compressed bytes: 89% of 313 bytes).
// Entry #48 '..\build\files\ocode_techcam.o'
// - Starts on  track 15 sector 4 and is 2 sectors long (348 compressed bytes: 91% of 381 bytes).
// Entry #49 '..\build\files\ocode_man.o'
// - Starts on  track 15 sector 6 and is 1 sectors long (105 compressed bytes: 97% of 108 bytes).
// Entry #50 '..\build\files\ocode_vila.o'
// - Starts on  track 15 sector 7 and is 1 sectors long (68 bytes).
// Entry #51 '..\build\files\ocode_jenna.o'
// - Starts on  track 15 sector 8 and is 2 sectors long (312 bytes).
// Entry #52 '..\build\files\ocode_avon.o'
// - Starts on  track 15 sector 10 and is 1 sectors long (147 bytes).
// Entry #53 '..\build\files\ocode_gan.o'
// - Starts on  track 15 sector 11 and is 1 sectors long (76 bytes).
// Entry #54 '..\build\files\ocode_ypipe.o'
// - Starts on  track 15 sector 12 and is 1 sectors long (187 bytes).
// Entry #55 '..\build\files\ocode_bearing.o'
// - Starts on  track 15 sector 13 and is 1 sectors long (139 bytes).
// Entry #56 '..\build\files\ocode_cinch.o'
// - Starts on  track 15 sector 14 and is 1 sectors long (68 bytes).
// Entry #57 '..\build\files\ocode_catpult.o'
// - Starts on  track 15 sector 15 and is 1 sectors long (150 bytes).
// Entry #58 '..\build\files\ocode_bracelet.o'
// - Starts on  track 15 sector 16 and is 2 sectors long (382 compressed bytes: 83% of 457 bytes).
// Entry #59 '..\build\files\ocode_gun.o'
// - Starts on  track 16 sector 1 and is 1 sectors long (87 bytes).
// Entry #60 '..\build\files\ocode_bracelets.o'
// - Starts on  track 16 sector 2 and is 1 sectors long (133 compressed bytes: 91% of 145 bytes).
// Entry #61 '..\build\files\ocode_ballrobot.o'
// - Starts on  track 16 sector 3 and is 3 sectors long (517 compressed bytes: 89% of 580 bytes).
// Entry #62 '..\build\files\ocode_pliers.o'
// - Starts on  track 16 sector 6 and is 1 sectors long (92 bytes).
// Entry #63 '..\build\files\ocode_scissors.o'
// - Starts on  track 16 sector 7 and is 1 sectors long (82 bytes).
// Entry #64 '..\build\files\ocode_wrench.o'
// - Starts on  track 16 sector 8 and is 1 sectors long (89 bytes).
// Entry #65 '..\build\files\ocode_spray.o'
// - Starts on  track 16 sector 9 and is 1 sectors long (173 bytes).
// Entry #66 '..\build\files\ocode_rope.o'
// - Starts on  track 16 sector 10 and is 1 sectors long (84 bytes).
// Entry #67 '..\build\files\ocode_lamp.o'
// - Starts on  track 16 sector 11 and is 1 sectors long (101 bytes).
// Entry #68 '..\build\files\ocode_vargas.o'
// - Starts on  track 16 sector 12 and is 1 sectors long (250 bytes).
// Entry #69 '..\build\files\ocode_log.o'
// - Starts on  track 16 sector 13 and is 1 sectors long (126 bytes).
// Entry #70 '..\build\files\main_theme.o'
// - Starts on  track 16 sector 14 and is 2 sectors long (350 compressed bytes: 93% of 376 bytes).
// Entry #71 '..\build\files\endep_theme.o'
// - Starts on  track 16 sector 16 and is 1 sectors long (53 bytes).
// Entry #72 '..\build\files\room_intro.o'
// - Starts on  track 16 sector 17 and is 21 sectors long (5253 compressed bytes: 57% of 9192 bytes).
// Entry #73 '..\build\files\room_episode1.o'
// - Starts on  track 18 sector 4 and is 18 sectors long (4480 compressed bytes: 62% of 7148 bytes).
// Entry #74 '..\build\files\room_blakesroom.o'
// - Starts on  track 19 sector 5 and is 14 sectors long (3365 compressed bytes: 65% of 5165 bytes).
// Entry #75 '..\build\files\room_dchallway.o'
// - Starts on  track 20 sector 2 and is 22 sectors long (5469 compressed bytes: 47% of 11561 bytes).
// Entry #76 '..\build\files\room_foyerA.o'
// - Starts on  track 21 sector 7 and is 16 sectors long (3852 compressed bytes: 53% of 7194 bytes).
// Entry #77 '..\build\files\room_maproom.o'
// - Starts on  track 22 sector 6 and is 14 sectors long (3498 compressed bytes: 64% of 5449 bytes).
// Entry #78 '..\build\files\room_infoarea.o'
// - Starts on  track 23 sector 3 and is 11 sectors long (2695 compressed bytes: 57% of 4727 bytes).
// Entry #79 '..\build\files\room_servicecorr.o'
// - Starts on  track 23 sector 14 and is 12 sectors long (2896 compressed bytes: 63% of 4567 bytes).
// Entry #80 '..\build\files\room_serviceexit.o'
// - Starts on  track 24 sector 9 and is 11 sectors long (2666 compressed bytes: 60% of 4438 bytes).
// Entry #81 '..\build\files\room_nursery.o'
// - Starts on  track 25 sector 3 and is 12 sectors long (3051 compressed bytes: 67% of 4549 bytes).
// Entry #82 '..\build\files\room_camcontrol.o'
// - Starts on  track 25 sector 15 and is 15 sectors long (3788 compressed bytes: 67% of 5631 bytes).
// Entry #83 '..\build\files\room_exterior.o'
// - Starts on  track 26 sector 13 and is 12 sectors long (2854 compressed bytes: 64% of 4391 bytes).
// Entry #84 '..\build\files\room_guilty.o'
// - Starts on  track 27 sector 8 and is 10 sectors long (2526 compressed bytes: 69% of 3648 bytes).
// Entry #85 '..\build\files\room_locker.o'
// - Starts on  track 28 sector 1 and is 19 sectors long (4684 compressed bytes: 64% of 7266 bytes).
// Entry #86 '..\build\files\room_episode2.o'
// - Starts on  track 29 sector 3 and is 9 sectors long (2229 compressed bytes: 51% of 4331 bytes).
// Entry #87 '..\build\files\room_londoncell.o'
// - Starts on  track 29 sector 12 and is 17 sectors long (4292 compressed bytes: 67% of 6375 bytes).
// Entry #88 '..\build\files\room_londoncomp.o'
// - Starts on  track 30 sector 12 and is 14 sectors long (3426 compressed bytes: 70% of 4827 bytes).
// Entry #89 '..\build\files\room_londondeck.o'
// - Starts on  track 31 sector 9 and is 15 sectors long (3657 compressed bytes: 71% of 5087 bytes).
// Entry #90 '..\build\files\room_liberatorpass.o'
// - Starts on  track 32 sector 7 and is 6 sectors long (1488 compressed bytes: 67% of 2198 bytes).
// Entry #91 '..\build\files\room_liberatorworkshop.o'
// - Starts on  track 32 sector 13 and is 9 sectors long (2212 compressed bytes: 70% of 3135 bytes).
// Entry #92 '..\build\files\room_liberatordeck.o'
// - Starts on  track 33 sector 5 and is 17 sectors long (4119 compressed bytes: 51% of 7949 bytes).
// Entry #93 '..\build\files\room_liberatorzen.o'
// - Starts on  track 34 sector 5 and is 7 sectors long (1614 compressed bytes: 69% of 2315 bytes).
// Entry #94 '..\build\files\room_liberatorteleport.o'
// - Starts on  track 34 sector 12 and is 15 sectors long (3818 compressed bytes: 56% of 6729 bytes).
// Entry #95 '..\build\files\room_liberatorcargo.o'
// - Starts on  track 35 sector 10 and is 9 sectors long (2082 compressed bytes: 45% of 4531 bytes).
// Entry #96 '..\build\files\room_caexterior.o'
// - Starts on  track 36 sector 2 and is 8 sectors long (2034 compressed bytes: 59% of 3430 bytes).
// Entry #97 '..\build\files\room_capit.o'
// - Starts on  track 36 sector 10 and is 10 sectors long (2395 compressed bytes: 59% of 4022 bytes).
// Entry #98 '..\build\files\room_cacaveentry.o'
// - Starts on  track 37 sector 3 and is 9 sectors long (2178 compressed bytes: 57% of 3789 bytes).
// Entry #99 '..\build\files\room_cacave.o'
// - Starts on  track 37 sector 12 and is 10 sectors long (2466 compressed bytes: 54% of 4544 bytes).
// Entry #100 '..\build\files\room_cabackentry.o'
// - Starts on  track 38 sector 5 and is 12 sectors long (2903 compressed bytes: 57% of 5022 bytes).
// Entry #101 '..\build\files\room_cahall.o'
// - Starts on  track 38 sector 17 and is 9 sectors long (2181 compressed bytes: 60% of 3613 bytes).
// Entry #102 '..\build\files\room_cabuilding.o'
// - Starts on  track 39 sector 9 and is 12 sectors long (2932 compressed bytes: 66% of 4414 bytes).
// Entry #103 '..\build\files\room_cacells.o'
// - Starts on  track 40 sector 4 and is 7 sectors long (1598 compressed bytes: 56% of 2806 bytes).
// Entry #104 '..\build\files\room_episode3.o'
// - Starts on  track 40 sector 11 and is 28 sectors long (7061 compressed bytes: 60% of 11582 bytes).
// Entry #105 '..\build\files\room_forest.o'
// - Starts on  track 42 sector 5 and is 8 sectors long (2000 compressed bytes: 71% of 2813 bytes).
// Entry #106 '..\build\files\room_swamp.o'
// - Starts on  track 42 sector 13 and is 10 sectors long (2506 compressed bytes: 67% of 3712 bytes).
// Entry #107 '..\build\files\room_hideout.o'
// - Starts on  track 43 sector 6 and is 19 sectors long (4683 compressed bytes: 59% of 7845 bytes).
// Entry #108 '..\build\files\room_tunnel.o'
// - Starts on  track 44 sector 8 and is 10 sectors long (2449 compressed bytes: 64% of 3806 bytes).
// Entry #109 '..\build\files\room_corridor.o'
// - Starts on  track 45 sector 1 and is 10 sectors long (2478 compressed bytes: 38% of 6386 bytes).
// Entry #110 '..\build\files\room_toilet.o'
// - Starts on  track 45 sector 11 and is 10 sectors long (2406 compressed bytes: 67% of 3584 bytes).
// Entry #111 '..\build\files\room_common.o'
// - Starts on  track 46 sector 4 and is 5 sectors long (1164 compressed bytes: 61% of 1881 bytes).
// Entry #112 'Reserved sectors'
// - Starts on  track 46 sector 9 and is 7 sectors long (1792 bytes).
//
// 797 sectors used, out of 2720. (29% of the total disk size used)
//
#define LOADER_SECTOR_BUFFER $200
#define LOADER_BASE_ZERO_PAGE $F2
#define LOADER_GAME_PROGRAM 0
#define LOADER_GAME_PROGRAM_ADDRESS $c000
#define LOADER_GAME_PROGRAM_TRACK 0
#define LOADER_GAME_PROGRAM_SECTOR 135
#define LOADER_GAME_PROGRAM_SIZE 15360
#define LOADER_GAME_PROGRAM_SIZE_COMPRESSED 13431
#define LOADER_TABLES 1
#define LOADER_SCRIPT0 2
#define LOADER_SCRIPT1 3
#define LOADER_SCRIPT2 4
#define LOADER_SCRIPT3 5
#define LOADER_SCRIPT4 6
#define LOADER_SCRIPT5 7
#define LOADER_SCRIPT6 8
#define LOADER_SCRIPT7 9
#define LOADER_SCRIPT8 10
#define LOADER_SCRIPT9 11
#define LOADER_SCRIPT10 12
#define LOADER_SCRIPT11 13
#define LOADER_SCRIPT15 14
#define LOADER_SCRIPT16 15
#define LOADER_SCRIPT17 16
#define LOADER_STRINGS 17
#define LOADER_STRINGSINTROSVILA 18
#define LOADER_STRINGSLONDONPLAN 19
#define LOADER_STRINGSLONDONDLG 20
#define LOADER_OBJBLAKE 21
#define LOADER_OBJEP2 22
#define LOADER_OBJEP3 23
#define LOADER_COSBLAKE 24
#define LOADER_COSJENNA 25
#define LOADER_COSCAMERA 26
#define LOADER_COSGUARD 27
#define LOADER_COSTECHCAM 28
#define LOADER_COSMAN 29
#define LOADER_COSMAN2 30
#define LOADER_COSTRAVIS 31
#define LOADER_COSSERVALAN 32
#define LOADER_COSVILA 33
#define LOADER_COSAVON 34
#define LOADER_COSGAN 35
#define LOADER_COSBEXTRAS 36
#define LOADER_COSBALL 37
#define LOADER_COSVARGAS 38
#define LOADER_COSMONK 39
#define LOADER_OCODEGUARD 40
#define LOADER_OCODESANDWICH 41
#define LOADER_OCODEMUG 42
#define LOADER_OCODEKEY 43
#define LOADER_OCODELAXATIVE 44
#define LOADER_OCODECOIN 45
#define LOADER_OCODEDECAF 46
#define LOADER_OCODEMAP 47
#define LOADER_OCODETECHCAM 48
#define LOADER_OCODEMAN 49
#define LOADER_OCODEVILA 50
#define LOADER_OCODEJENNA 51
#define LOADER_OCODEAVON 52
#define LOADER_OCODEGAN 53
#define LOADER_OCODEYPIPE 54
#define LOADER_OCODEBEARING 55
#define LOADER_OCODECINCH 56
#define LOADER_OCODECATPULT 57
#define LOADER_OCODEBRACELET 58
#define LOADER_OCODEGUN 59
#define LOADER_OCODEBRACELETS 60
#define LOADER_OCODEBALLROBOT 61
#define LOADER_OCODEPLIERS 62
#define LOADER_OCODESCISSORS 63
#define LOADER_OCODEWRENCH 64
#define LOADER_OCODESPRAY 65
#define LOADER_OCODEROPE 66
#define LOADER_OCODELAMP 67
#define LOADER_OCODEVARGAS 68
#define LOADER_OCODELOG 69
#define LOADER_MAINTHEME 70
#define LOADER_ENDEPTHEME 71
#define LOADER_ROOM0 72
#define LOADER_ROOM1 73
#define LOADER_ROOM2 74
#define LOADER_ROOM3 75
#define LOADER_ROOM4 76
#define LOADER_ROOM5 77
#define LOADER_ROOM6 78
#define LOADER_ROOM7 79
#define LOADER_ROOM8 80
#define LOADER_ROOM9 81
#define LOADER_ROOM10 82
#define LOADER_ROOM11 83
#define LOADER_ROOM12 84
#define LOADER_ROOM13 85
#define LOADER_ROOM14 86
#define LOADER_ROOM15 87
#define LOADER_ROOM17 88
#define LOADER_ROOM18 89
#define LOADER_ROOM20 90
#define LOADER_ROOM21 91
#define LOADER_ROOM22 92
#define LOADER_ROOM23 93
#define LOADER_ROOM24 94
#define LOADER_ROOM25 95
#define LOADER_ROOM30 96
#define LOADER_ROOM31 97
#define LOADER_ROOM32 98
#define LOADER_ROOM33 99
#define LOADER_ROOM34 100
#define LOADER_ROOM35 101
#define LOADER_ROOM36 102
#define LOADER_ROOM37 103
#define LOADER_ROOM40 104
#define LOADER_ROOM41 105
#define LOADER_ROOM42 106
#define LOADER_ROOM43 107
#define LOADER_ROOM44 108
#define LOADER_ROOM45 109
#define LOADER_ROOM50 110
#define LOADER_ROOM51 111
#define LOADER_SAVESPACE 112

//
// Metadata
//
#ifdef METADATA_STORAGE

#endif // METADATA_STORAGE
