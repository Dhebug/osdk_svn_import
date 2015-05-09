//
// Floppy layout generated by FloppyBuilder 0.16
//

#ifdef ASSEMBLER
//
// Information for the Assembler
//
#ifdef LOADER
FileStartSector .byt 4,8,13,16,1,8,1,7,16,7,17,11,4,16,11,7,6,4,3,13,14,15,14,14,8,10,6,7,7,7
FileStartTrack .byt 0,0,1,1,2,2,3,3,3,4,4,5,6,6,7,8,9,10,11,11,12,13,14,15,16,17,18,19,20,21
FileStoredSizeLow .byt <1024,<5615,<556,<447,<1712,<2469,<1428,<2080,<1958,<2400,<2602,<2559,<2831,<2976,<3322,<4052,<3820,<4032,<2364,<4473,<4486,<3891,<4177,<2644,<4643,<3237,<4395,<4182,<4287,<12998
FileStoredSizeHigh .byt >1024,>5615,>556,>447,>1712,>2469,>1428,>2080,>1958,>2400,>2602,>2559,>2831,>2976,>3322,>4052,>3820,>4032,>2364,>4473,>4486,>3891,>4177,>2644,>4643,>3237,>4395,>4182,>4287,>12998
FileSizeLow .byt <1024,<12032,<760,<576,<8000,<8000,<8000,<5220,<8000,<8000,<8000,<8000,<8000,<8000,<5220,<5220,<5220,<5220,<5220,<5220,<5220,<5220,<5220,<5220,<5220,<5220,<5220,<5220,<5220,<32694
FileSizeHigh .byt >1024,>12032,>760,>576,>8000,>8000,>8000,>5220,>8000,>8000,>8000,>8000,>8000,>8000,>5220,>5220,>5220,>5220,>5220,>5220,>5220,>5220,>5220,>5220,>5220,>5220,>5220,>5220,>5220,>32694
FileLoadAdressLow .byt <64512,<49152,<39168,<40960,<40960,<40960,<40960,<40960,<40960,<40960,<40960,<40960,<40960,<40960,<40960,<40960,<40960,<40960,<40960,<40960,<40960,<40960,<40960,<40960,<40960,<40960,<40960,<40960,<40960,<1024
FileLoadAdressHigh .byt >64512,>49152,>39168,>40960,>40960,>40960,>40960,>40960,>40960,>40960,>40960,>40960,>40960,>40960,>40960,>40960,>40960,>40960,>40960,>40960,>40960,>40960,>40960,>40960,>40960,>40960,>40960,>40960,>40960,>1024
#endif // LOADER
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

//
// List of files written to the floppy
//
// Entry #0 '..\build\files\loader.o'
// - Loads at address 64512 starts on track 0 sector 4 and is 4 sectors long (1024 bytes).
// Entry #1 '..\build\files\game.o'
// - Loads at address 49152 starts on track 0 sector 8 and is 22 sectors long (5615 compressed bytes: 46% of 12032 bytes).
// Entry #2 '..\build\files\Font6x8.hir'
// - Loads at address 39168 starts on track 1 sector 13 and is 3 sectors long (556 compressed bytes: 73% of 760 bytes).
// Entry #3 '..\build\files\Font6x6.hir'
// - Loads at address 40960 starts on track 1 sector 16 and is 2 sectors long (447 compressed bytes: 77% of 576 bytes).
// Entry #4 '..\build\files\funcom_logo_240x200.hir'
// - Loads at address 40960 starts on track 2 sector 1 and is 7 sectors long (1712 compressed bytes: 21% of 8000 bytes).
// Entry #5 '..\build\files\GlobalGameJamOslo.hir'
// - Loads at address 40960 starts on track 2 sector 8 and is 10 sectors long (2469 compressed bytes: 30% of 8000 bytes).
// Entry #6 '..\build\files\valp_outline.hir'
// - Loads at address 40960 starts on track 3 sector 1 and is 6 sectors long (1428 compressed bytes: 17% of 8000 bytes).
// Entry #7 '..\build\files\oslo_map.hir'
// - Loads at address 40960 starts on track 3 sector 7 and is 9 sectors long (2080 compressed bytes: 39% of 5220 bytes).
// - Associated metadata: description='Where do you want to go now?' name='Map of Oslo' 
// Entry #8 '..\build\files\title_screen.hir'
// - Loads at address 40960 starts on track 3 sector 16 and is 8 sectors long (1958 compressed bytes: 24% of 8000 bytes).
// Entry #9 '..\build\files\ending_giveup.hir'
// - Loads at address 40960 starts on track 4 sector 7 and is 10 sectors long (2400 compressed bytes: 30% of 8000 bytes).
// Entry #10 '..\build\files\ending_out_of_money.hir'
// - Loads at address 40960 starts on track 4 sector 17 and is 11 sectors long (2602 compressed bytes: 32% of 8000 bytes).
// Entry #11 '..\build\files\ending_out_of_time.hir'
// - Loads at address 40960 starts on track 5 sector 11 and is 10 sectors long (2559 compressed bytes: 31% of 8000 bytes).
// Entry #12 '..\build\files\ending_victory.hir'
// - Loads at address 40960 starts on track 6 sector 4 and is 12 sectors long (2831 compressed bytes: 35% of 8000 bytes).
// Entry #13 '..\build\files\how_to_play.hir'
// - Loads at address 40960 starts on track 6 sector 16 and is 12 sectors long (2976 compressed bytes: 37% of 8000 bytes).
// Entry #14 '..\build\files\location_vigeland.hir'
// - Loads at address 40960 starts on track 7 sector 11 and is 13 sectors long (3322 compressed bytes: 63% of 5220 bytes).
// - Associated metadata: description='The Vigeland Park is the worlds largestsculpture park made by a single artist one of Norway most popular attractions' name='Vigeland Park' 
// Entry #15 '..\build\files\location_opera.hir'
// - Loads at address 40960 starts on track 8 sector 7 and is 16 sectors long (4052 compressed bytes: 77% of 5220 bytes).
// - Associated metadata: description='The Opera is a weirdly shaped thing in the Oslo harbor' name='Oslo Opera' 
// Entry #16 '..\build\files\location_holmenkolen.hir'
// - Loads at address 40960 starts on track 9 sector 6 and is 15 sectors long (3820 compressed bytes: 73% of 5220 bytes).
// - Associated metadata: description='See the famous ski jump' name='Holmenkolen' 
// Entry #17 '..\build\files\location_jernbanetorget.hir'
// - Loads at address 40960 starts on track 10 sector 4 and is 16 sectors long (4032 compressed bytes: 77% of 5220 bytes).
// - Associated metadata: description='The Oslo train station is really the    city hub' name='Oslo Sentralstajon' 
// Entry #18 '..\build\files\location_akerbrygge.hir'
// - Loads at address 40960 starts on track 11 sector 3 and is 10 sectors long (2364 compressed bytes: 45% of 5220 bytes).
// - Associated metadata: description='Boats, shopping malls, and expensive restaurants' name='Aker Brygge' 
// Entry #19 '..\build\files\location_kingscastle.hir'
// - Loads at address 40960 starts on track 11 sector 13 and is 18 sectors long (4473 compressed bytes: 85% of 5220 bytes).
// - Associated metadata: description='Where the royal familly lives' name='The Royal Palace' 
// Entry #20 '..\build\files\location_sognsvann.hir'
// - Loads at address 40960 starts on track 12 sector 14 and is 18 sectors long (4486 compressed bytes: 85% of 5220 bytes).
// - Associated metadata: description='A nice lake, you can swim and take a walk' name='Sognsvann' 
// Entry #21 '..\build\files\location_vikingship_museum.hir'
// - Loads at address 40960 starts on track 13 sector 15 and is 16 sectors long (3891 compressed bytes: 74% of 5220 bytes).
// - Associated metadata: description='Hosts three nice viking ships' name='Viking Ship Museum' 
// Entry #22 '..\build\files\location_munch_museum.hir'
// - Loads at address 40960 starts on track 14 sector 14 and is 17 sectors long (4177 compressed bytes: 80% of 5220 bytes).
// - Associated metadata: description='The Scream is there, among many other paintings' name='Munch Museum' 
// Entry #23 '..\build\files\location_ibsen_museum.hir'
// - Loads at address 40960 starts on track 15 sector 14 and is 11 sectors long (2644 compressed bytes: 50% of 5220 bytes).
// - Associated metadata: description='Ibsen, famous Norwegian writter' name='Ibsen Museum' 
// Entry #24 '..\build\files\location_norwegian_folk_museum.hir'
// - Loads at address 40960 starts on track 16 sector 8 and is 19 sectors long (4643 compressed bytes: 88% of 5220 bytes).
// - Associated metadata: description='Many interesting things to see there,   including a beautiful stave church builtin the early 13th century' name='Norwegian Folk Museum' 
// Entry #25 '..\build\files\location_kon_tiki_museum.hir'
// - Loads at address 40960 starts on track 17 sector 10 and is 13 sectors long (3237 compressed bytes: 62% of 5220 bytes).
// - Associated metadata: description='Learn about Thor Heyerdahl's expedition' name='Kon-Tiki museum' 
// Entry #26 '..\build\files\location_akershus_fortress.hir'
// - Loads at address 40960 starts on track 18 sector 6 and is 18 sectors long (4395 compressed bytes: 84% of 5220 bytes).
// - Associated metadata: description='The Oslo fortress, protecting from invaders comming by boat' name='Akershus Fortress' 
// Entry #27 '..\build\files\location_national_gallery.hir'
// - Loads at address 40960 starts on track 19 sector 7 and is 17 sectors long (4182 compressed bytes: 80% of 5220 bytes).
// - Associated metadata: description='The other place where you can see the Scream. For free' name='National Gallery' 
// Entry #28 '..\build\files\location_natural_history_museum.hir'
// - Loads at address 40960 starts on track 20 sector 7 and is 17 sectors long (4287 compressed bytes: 82% of 5220 bytes).
// - Associated metadata: description='Dinosaurs and old stuff :)' name='Natural History Museum' 
// Entry #29 '..\build\files\FuncomJingle.raw'
// - Loads at address 1024 starts on track 21 sector 7 and is 51 sectors long (12998 compressed bytes: 39% of 32694 bytes).
//
// 414 sectors used, out of 1428. (28% of the total disk size used)
//
#define LOADER_SLIDESHOW 1
#define LOADER_FONT_6x8 2
#define LOADER_FONT_6x6 3
#define LOADER_FUNCOM_LOGO 4
#define LOADER_GAMEJAM_LOGO 5
#define LOADER_VALP_OUTLINE 6
#define LOADER_OSLO_MAP 7
#define LOADER_TITLE_SCREEN 8
#define LOADER_ENDING_GIVEUP 9
#define LOADER_ENDING_OUT_OF_MONEY 10
#define LOADER_ENDING_OUT_OF_TIME 11
#define LOADER_ENDING_VICTORY 12
#define LOADER_HOW_TO_PLAY 13
#define LOADER_LOCATION_FIRST 14
#define LOADER_LOCATION_VIGELAND 14
#define LOADER_LOCATION_OPERA 15
#define LOADER_LOCATION_HOLMENKOLEN 16
#define LOADER_LOCATION_OSLOS 17
#define LOADER_LOCATION_AKERBRYGGE 18
#define LOADER_LOCATION_KINGCASTLE 19
#define LOADER_LOCATION_SOGNSVANN 20
#define LOADER_LOCATION_VIKINGSHIP 21
#define LOADER_LOCATION_MUNCHMUSEUM 22
#define LOADER_LOCATION_IBSENMUSEUM 23
#define LOADER_LOCATION_NORWEGIANFOLK 24
#define LOADER_LOCATION_KONTIKI 25
#define LOADER_LOCATION_AKERSHUS 26
#define LOADER_LOCATION_NATIONALGALLERY 27
#define LOADER_LOCATION_NATURALHISTORY 28
#define LOADER_LOCATION_LAST 29
#define LOADER_FUNCOM_JINGLE 29

//
// Metadata
//
#ifdef METADATA_STORAGE
metadata_description_A_nice_lake__you_can_swim_and_take_a_walk .byt "A nice lake, you can swim and take a walk",0
metadata_description_Boats__shopping_malls__and_expensive_restaurants .byt "Boats, shopping malls, and expensive restaurants",0
metadata_description_Dinosaurs_and_old_stuff___ .byt "Dinosaurs and old stuff :)",0
metadata_description_Hosts_three_nice_viking_ships .byt "Hosts three nice viking ships",0
metadata_description_Ibsen__famous_Norwegian_writter .byt "Ibsen, famous Norwegian writter",0
metadata_description_Learn_about_Thor_Heyerdahl_s_expedition .byt "Learn about Thor Heyerdahl's expedition",0
metadata_description_Many_interesting_things_to_see_there____including_a_beautiful_stave_church_builtin_the_early_13th_century .byt "Many interesting things to see there,   including a beautiful stave church builtin the early 13th century",0
metadata_description_See_the_famous_ski_jump .byt "See the famous ski jump",0
metadata_description_The_Opera_is_a_weirdly_shaped_thing_in_the_Oslo_harbor .byt "The Opera is a weirdly shaped thing in the Oslo harbor",0
metadata_description_The_Oslo_fortress__protecting_from_invaders_comming_by_boat .byt "The Oslo fortress, protecting from invaders comming by boat",0
metadata_description_The_Oslo_train_station_is_really_the____city_hub .byt "The Oslo train station is really the    city hub",0
metadata_description_The_Scream_is_there__among_many_other_paintings .byt "The Scream is there, among many other paintings",0
metadata_description_The_Vigeland_Park_is_the_worlds_largestsculpture_park_made_by_a_single_artist_one_of_Norway_most_popular_attractions .byt "The Vigeland Park is the worlds largestsculpture park made by a single artist one of Norway most popular attractions",0
metadata_description_The_other_place_where_you_can_see_the_Scream__For_free .byt "The other place where you can see the Scream. For free",0
metadata_description_Where_do_you_want_to_go_now_ .byt "Where do you want to go now?",0
metadata_description_Where_the_royal_familly_lives .byt "Where the royal familly lives",0
metadata_name_Aker_Brygge .byt "Aker Brygge",0
metadata_name_Akershus_Fortress .byt "Akershus Fortress",0
metadata_name_Holmenkolen .byt "Holmenkolen",0
metadata_name_Ibsen_Museum .byt "Ibsen Museum",0
metadata_name_Kon_Tiki_museum .byt "Kon-Tiki museum",0
metadata_name_Map_of_Oslo .byt "Map of Oslo",0
metadata_name_Munch_Museum .byt "Munch Museum",0
metadata_name_National_Gallery .byt "National Gallery",0
metadata_name_Natural_History_Museum .byt "Natural History Museum",0
metadata_name_Norwegian_Folk_Museum .byt "Norwegian Folk Museum",0
metadata_name_Oslo_Opera .byt "Oslo Opera",0
metadata_name_Oslo_Sentralstajon .byt "Oslo Sentralstajon",0
metadata_name_Sognsvann .byt "Sognsvann",0
metadata_name_The_Royal_Palace .byt "The Royal Palace",0
metadata_name_Vigeland_Park .byt "Vigeland Park",0
metadata_name_Viking_Ship_Museum .byt "Viking Ship Museum",0
metadata_none .byt "",0

_MetaData_description_High .byt >metadata_none,>metadata_none,>metadata_none,>metadata_none,>metadata_none,>metadata_none,>metadata_none,>metadata_description_Where_do_you_want_to_go_now_,>metadata_none,>metadata_none,>metadata_none,>metadata_none,>metadata_none,>metadata_none,>metadata_description_The_Vigeland_Park_is_the_worlds_largestsculpture_park_made_by_a_single_artist_one_of_Norway_most_popular_attractions,>metadata_description_The_Opera_is_a_weirdly_shaped_thing_in_the_Oslo_harbor,>metadata_description_See_the_famous_ski_jump,>metadata_description_The_Oslo_train_station_is_really_the____city_hub,>metadata_description_Boats__shopping_malls__and_expensive_restaurants,>metadata_description_Where_the_royal_familly_lives,>metadata_description_A_nice_lake__you_can_swim_and_take_a_walk,>metadata_description_Hosts_three_nice_viking_ships,>metadata_description_The_Scream_is_there__among_many_other_paintings,>metadata_description_Ibsen__famous_Norwegian_writter,>metadata_description_Many_interesting_things_to_see_there____including_a_beautiful_stave_church_builtin_the_early_13th_century,>metadata_description_Learn_about_Thor_Heyerdahl_s_expedition,>metadata_description_The_Oslo_fortress__protecting_from_invaders_comming_by_boat,>metadata_description_The_other_place_where_you_can_see_the_Scream__For_free,>metadata_description_Dinosaurs_and_old_stuff___
_MetaData_description_Low .byt <metadata_none,<metadata_none,<metadata_none,<metadata_none,<metadata_none,<metadata_none,<metadata_none,<metadata_description_Where_do_you_want_to_go_now_,<metadata_none,<metadata_none,<metadata_none,<metadata_none,<metadata_none,<metadata_none,<metadata_description_The_Vigeland_Park_is_the_worlds_largestsculpture_park_made_by_a_single_artist_one_of_Norway_most_popular_attractions,<metadata_description_The_Opera_is_a_weirdly_shaped_thing_in_the_Oslo_harbor,<metadata_description_See_the_famous_ski_jump,<metadata_description_The_Oslo_train_station_is_really_the____city_hub,<metadata_description_Boats__shopping_malls__and_expensive_restaurants,<metadata_description_Where_the_royal_familly_lives,<metadata_description_A_nice_lake__you_can_swim_and_take_a_walk,<metadata_description_Hosts_three_nice_viking_ships,<metadata_description_The_Scream_is_there__among_many_other_paintings,<metadata_description_Ibsen__famous_Norwegian_writter,<metadata_description_Many_interesting_things_to_see_there____including_a_beautiful_stave_church_builtin_the_early_13th_century,<metadata_description_Learn_about_Thor_Heyerdahl_s_expedition,<metadata_description_The_Oslo_fortress__protecting_from_invaders_comming_by_boat,<metadata_description_The_other_place_where_you_can_see_the_Scream__For_free,<metadata_description_Dinosaurs_and_old_stuff___
_MetaData_name_High .byt >metadata_none,>metadata_none,>metadata_none,>metadata_none,>metadata_none,>metadata_none,>metadata_none,>metadata_name_Map_of_Oslo,>metadata_none,>metadata_none,>metadata_none,>metadata_none,>metadata_none,>metadata_none,>metadata_name_Vigeland_Park,>metadata_name_Oslo_Opera,>metadata_name_Holmenkolen,>metadata_name_Oslo_Sentralstajon,>metadata_name_Aker_Brygge,>metadata_name_The_Royal_Palace,>metadata_name_Sognsvann,>metadata_name_Viking_Ship_Museum,>metadata_name_Munch_Museum,>metadata_name_Ibsen_Museum,>metadata_name_Norwegian_Folk_Museum,>metadata_name_Kon_Tiki_museum,>metadata_name_Akershus_Fortress,>metadata_name_National_Gallery,>metadata_name_Natural_History_Museum
_MetaData_name_Low .byt <metadata_none,<metadata_none,<metadata_none,<metadata_none,<metadata_none,<metadata_none,<metadata_none,<metadata_name_Map_of_Oslo,<metadata_none,<metadata_none,<metadata_none,<metadata_none,<metadata_none,<metadata_none,<metadata_name_Vigeland_Park,<metadata_name_Oslo_Opera,<metadata_name_Holmenkolen,<metadata_name_Oslo_Sentralstajon,<metadata_name_Aker_Brygge,<metadata_name_The_Royal_Palace,<metadata_name_Sognsvann,<metadata_name_Viking_Ship_Museum,<metadata_name_Munch_Museum,<metadata_name_Ibsen_Museum,<metadata_name_Norwegian_Folk_Museum,<metadata_name_Kon_Tiki_museum,<metadata_name_Akershus_Fortress,<metadata_name_National_Gallery,<metadata_name_Natural_History_Museum
#endif // METADATA_STORAGE
