
#include "params.h"
#include "game_defines.h"
#include "common.h"


 
 /*
    e_DIRECTION_NORTH = 0,
    e_DIRECTION_SOUTH = 1,
    e_DIRECTION_EAST  = 2,
    e_DIRECTION_WEST  = 3,
    e_DIRECTION_UP    = 4,   // Seldomly used (to go to the house upper floor and basement)
    e_DIRECTION_DOWN  = 5,   // Seldomly used (to go to the house upper floor and basement)
    e_DIRECTION_COUNT_
*/
location gLocations[e_LOCATION_COUNT_] =
{ //  North                          South                          East                           West                           Up                             Down                          Description
    { e_LOCATION_DARKTUNNEL        , e_LOCATION_NONE              , e_LOCATION_DARKALLEY         , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationMarketPlace              ,gDescriptionMarketPlace},       // e_LOCATION_MARKETPLACE    
    { e_LOCATION_MAINSTREET        , e_LOCATION_NONE              , e_LOCATION_ROAD              , e_LOCATION_MARKETPLACE       , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationDarkAlley                ,gDescriptionDarkAlley},         // e_LOCATION_DARKALLEY      
    { e_LOCATION_NARROWPATH        , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_DARKALLEY         , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationRoad                     ,gDescriptionRoad},              // e_LOCATION_ROAD      

    { e_LOCATION_WOODEDAVENUE      , e_LOCATION_MARKETPLACE       , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationDarkTunel                ,gDescriptionDarkTunel},         // e_LOCATION_DARKTUNNEL     
    { e_LOCATION_GRAVELDRIVE       , e_LOCATION_DARKALLEY         , e_LOCATION_NARROWPATH        , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationMainStreet               ,gDescriptionMainStreet},        // e_LOCATION_MAINSTREET     
    { e_LOCATION_TARMACAREA        , e_LOCATION_ROAD              , e_LOCATION_OUTSIDE_PIT       , e_LOCATION_MAINSTREET        , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationNarrowPath               ,gDescriptionNarrowPath},        // e_LOCATION_NARROWPATH     

    { e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationInThePit                 ,gDescriptionInThePit},          // e_LOCATION_INSIDEHOLE
    { e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_WOODEDAVENUE      , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationOldWell                  ,gDescriptionOldWell},           // e_LOCATION_WELL           
    { e_LOCATION_ZENGARDEN         , e_LOCATION_DARKTUNNEL        , e_LOCATION_GRAVELDRIVE       , e_LOCATION_WELL              , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationWoodedAvenue             ,gDescriptionWoodedAvenue},      // e_LOCATION_WOODEDAVENUE   

    { e_LOCATION_LAWN              , e_LOCATION_MAINSTREET        , e_LOCATION_TARMACAREA        , e_LOCATION_WOODEDAVENUE      , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationGravelDrive              ,gDescriptionGravelDrive},       // e_LOCATION_GRAVELDRIVE   
    { e_LOCATION_GREENHOUSE        , e_LOCATION_NARROWPATH        , e_LOCATION_NONE              , e_LOCATION_GRAVELDRIVE       , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationTarmacArea               ,gDescriptionTarmacArea},        // e_LOCATION_TARMACAREA      
    { e_LOCATION_TENNISCOURT       , e_LOCATION_WOODEDAVENUE      , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationZenGarden                ,gDescriptionZenGarden},         // e_LOCATION_ZENGARDEN       

    { e_LOCATION_ENTRANCEHALL      , e_LOCATION_GRAVELDRIVE       , e_LOCATION_GREENHOUSE        , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationFrontLawn                ,gDescriptionFrontLawn},         // e_LOCATION_LAWN  
    { e_LOCATION_VEGSGARDEN        , e_LOCATION_TARMACAREA        , e_LOCATION_NONE              , e_LOCATION_LAWN              , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationGreenHouse               ,gDescriptionGreenHouse},        // e_LOCATION_GREENHOUSE      
    { e_LOCATION_FISHPND           , e_LOCATION_ZENGARDEN         , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationTennisCourt              ,gDescriptionTennisCourt},       // e_LOCATION_TENNISCOURT     

    { e_LOCATION_APPLE_TREES       , e_LOCATION_GREENHOUSE        , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationVegetableGarden          ,gDescriptionVegetableGarden},   // e_LOCATION_VEGSGARDEN   
    { e_LOCATION_NONE              , e_LOCATION_TENNISCOURT       , e_LOCATION_TILEDPATIO        , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationFishPond                 ,gDescriptionFishPond},          // e_LOCATION_FISHPND         
    { e_LOCATION_SUNLOUNGE         , e_LOCATION_SUNLOUNGE         , e_LOCATION_APPLE_TREES       , e_LOCATION_FISHPND           , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationTiledPatio               ,gDescriptionTiledPatio},        // e_LOCATION_TILEDPATIO - and above it is a barred window 

    { e_LOCATION_NONE              , e_LOCATION_VEGSGARDEN        , e_LOCATION_NONE              , e_LOCATION_TILEDPATIO        , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationAppleOrchard             ,gDescriptionAppleOrchard},      // e_LOCATION_APPLE_TREES     
    { e_LOCATION_CELLAR            , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationDarkerCellar             ,gDescriptionDarkerCellar},      // e_LOCATION_DARKCELLARROOM   
    { e_LOCATION_NONE              , e_LOCATION_DARKCELLARROOM    , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NARROWSTAIRCASE   , e_LOCATION_NONE              , gTextLocationCellar                   ,gDescriptionCellar},            // e_LOCATION_CELLAR           

    { e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_KITCHEN           , e_LOCATION_CELLAR            , gTextLocationNarrowStaircase          ,gDescriptionNarrowStaircase},   // e_LOCATION_NARROWSTAIRCASE  
    { e_LOCATION_DININGROOM        , e_LOCATION_NONE              , e_LOCATION_ENTRANCEHALL      , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationEntranceLounge           ,gDescriptionEntranceLounge},    // e_LOCATION_LOUNGE     
    { e_LOCATION_NARROWPASSAGE     , e_LOCATION_LAWN              , e_LOCATION_NONE              , e_LOCATION_LOUNGE            , e_LOCATION_LARGE_STAIRCASE   , e_LOCATION_NONE              , gTextLocationEntranceHall             ,gDescriptionEntranceHall},      // e_LOCATION_ENTRANCEHALL    

    { e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NARROWPASSAGE     , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationLibrary                  ,gDescriptionLibrary},           // e_LOCATION_LIBRARY         
    { e_LOCATION_GAMESROOM         , e_LOCATION_LOUNGE            , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationDiningRoom               ,gDescriptionDiningRoom},        // e_LOCATION_DININGROOM      
    { e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_UP_STAIRS         , e_LOCATION_ENTRANCEHALL      , gTextLocationStaircase                ,gDescriptionStaircase},         // e_LOCATION_LARGE_STAIRCASE 

    { e_LOCATION_NONE              , e_LOCATION_DININGROOM        , e_LOCATION_SUNLOUNGE         , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationGamesRoom                ,gDescriptionGamesRoom},         // e_LOCATION_GAMESROOM        
    { e_LOCATION_TILEDPATIO        , e_LOCATION_NARROWPASSAGE     , e_LOCATION_KITCHEN           , e_LOCATION_GAMESROOM         , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationSunLounge                ,gDescriptionSunLounge},         // e_LOCATION_SUNLOUNGE        
    { e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_SUNLOUNGE         , e_LOCATION_NONE              , e_LOCATION_NARROWSTAIRCASE   , gTextLocationKitchen                  ,gDescriptionKitchen},           // e_LOCATION_KITCHEN    

    { e_LOCATION_SUNLOUNGE         , e_LOCATION_ENTRANCEHALL      , e_LOCATION_LIBRARY           , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationNarrowPassage            ,gDescriptionNarrowPassage},     // e_LOCATION_NARROWPASSAGE   
    { e_LOCATION_WESTGALLERY       , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_SHOWERROOM        , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationGuestBedroom             ,gDescriptionGuestBedroom},      // e_LOCATION_GUESTBEDROOM     
    { e_LOCATION_EASTGALLERY       , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationChildBedroom             ,gDescriptionChildBedroom},      // e_LOCATION_CHILDBEDROOM     

    { e_LOCATION_TINY_WC           , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_EASTGALLERY       , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationMasterBedRoom            ,gDescriptionMasterBedRoom},     // e_LOCATION_MASTERBEDROOM    
    { e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_GUESTBEDROOM      , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationShowerRoom               ,gDescriptionShowerRoom},        // e_LOCATION_SHOWERROOM       
    { e_LOCATION_NONE              , e_LOCATION_MASTERBEDROOM     , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationTinyToilet               ,gDescriptionTinyToilet},        // e_LOCATION_TINY_WC          

    { e_LOCATION_CLASSY_BATHROOM   , e_LOCATION_CHILDBEDROOM      , e_LOCATION_MASTERBEDROOM     , e_LOCATION_UP_STAIRS         , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationEastGallery              ,gDescriptionEastGallery},       // e_LOCATION_EASTGALLERY      
    { e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_WESTGALLERY       , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationBoxRoom                  ,gDescriptionBoxRoom},           // e_LOCATION_BOXROOM          
    { e_LOCATION_NONE              , e_LOCATION_WESTGALLERY       , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationPadlockedRoom            ,gDescriptionPadlockedRoom},     // e_LOCATION_PADLOCKED_ROOM   

    { e_LOCATION_NONE              , e_LOCATION_EASTGALLERY       , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationClassyBathRoom           ,gDescriptionClassyBathRoom},    // e_LOCATION_CLASSY_BATHROOM  
    { e_LOCATION_PADLOCKED_ROOM    , e_LOCATION_GUESTBEDROOM      , e_LOCATION_UP_STAIRS         , e_LOCATION_BOXROOM           , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationWestGallery              ,gDescriptionWestGallery},       // e_LOCATION_WESTGALLERY      
    { e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_EASTGALLERY       , e_LOCATION_WESTGALLERY       , e_LOCATION_NONE              , e_LOCATION_LARGE_STAIRCASE   , gTextLocationMainLanding              ,gDescriptionMainLanding},       // e_LOCATION_UP_STAIRS        

    { e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NARROWPATH        , e_LOCATION_NONE              , e_LOCATION_INSIDEHOLE        , gTextLocationOutsidePit               ,gDescriptionOutsidePit},        // e_LOCATION_OUTSIDE_PIT

    { e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , e_LOCATION_NONE              , gTextLocationGirlRoomOpenned          ,0},                             // e_LOCATION_GIRLROOM (technically this room cannot be accessed, so do not need description)        
};


//
// These macros can be used to generate the list of containers that can be 
// used with a specific item: You can't get powder in a net, neither can you
// store water in a cardboard box (or at least not for very long)
//
#define CONTAINER_MASK1(a)          (1<<(a))
#define CONTAINER_MASK2(a,b)        (CONTAINER_MASK1(a)+(1<<(b)))
#define CONTAINER_MASK3(a,b,c)      (CONTAINER_MASK2(a,b)+(1<<(c)))
#define CONTAINER_MASK4(a,b,c,d)    (CONTAINER_MASK3(a,b,c)+(1<<(d)))


// The flags and usable containers are copied from the BASIC version.
// The final version will contain actual bit-masks
item gItems[e_ITEM_COUNT_] =
{   //   Item                             World                       Associated     Generic                    Containers usable
    //   description                      location                    item           flags                      with this specific item
    // Containers
    { gTextItemTobaccoTin                ,e_LOCATION_LOUNGE          ,255           ,ITEM_FLAG_IS_CONTAINER    ,0},                                            // e_ITEM_TobaccoTin           
    { gTextItemBucket                    ,e_LOCATION_WELL            ,255           ,ITEM_FLAG_IS_CONTAINER    ,0},                                            // e_ITEM_Bucket               
    { gTextItemCardboardBox              ,e_LOCATION_GREENHOUSE      ,255           ,ITEM_FLAG_IS_CONTAINER    ,0},                                            // e_ITEM_CardboardBox         
    { gTextItemFishingNet                ,e_LOCATION_FISHPND         ,255           ,ITEM_FLAG_IS_CONTAINER    ,0},                                            // e_ITEM_FishingNet           
    { gTextItemPlasticBag                ,e_LOCATION_MARKETPLACE     ,255           ,ITEM_FLAG_IS_CONTAINER    ,0},                                            // e_ITEM_PlasticBag           
    { gTextItemSmallBottle               ,e_LOCATION_NONE            ,255           ,ITEM_FLAG_IS_CONTAINER    ,0},                                            // e_ITEM_SmallBottle          

    // Items requiring containers
    { gTextItemBlackDust                 ,e_LOCATION_DARKTUNNEL      ,255           ,ITEM_FLAG_DEFAULT         ,CONTAINER_MASK4(e_ITEM_Bucket,e_ITEM_PlasticBag,e_ITEM_TobaccoTin,e_ITEM_CardboardBox)},                            // e_ITEM_BlackDust            
    { gTextItemYellowPowder              ,e_LOCATION_INSIDEHOLE      ,255           ,ITEM_FLAG_DEFAULT         ,CONTAINER_MASK4(e_ITEM_Bucket,e_ITEM_PlasticBag,e_ITEM_TobaccoTin,e_ITEM_CardboardBox)},                            // e_ITEM_YellowPowder         
    { gTextItemPetrol                    ,e_LOCATION_NONE            ,255           ,ITEM_FLAG_EVAPORATES      ,CONTAINER_MASK3(e_ITEM_Bucket,e_ITEM_PlasticBag,e_ITEM_TobaccoTin)},                                // e_ITEM_Petrol               
    { gTextItemWater                     ,e_LOCATION_WELL            ,255           ,ITEM_FLAG_EVAPORATES      ,CONTAINER_MASK3(e_ITEM_Bucket,e_ITEM_PlasticBag,e_ITEM_TobaccoTin)},                                // e_ITEM_Water                

    // Normal items
    { gTextItemLockedPanel               ,e_LOCATION_DARKCELLARROOM  ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_LockedPanel          
    { gTextItemOpenPanel                 ,e_LOCATION_NONE            ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_OpenPanel            
    { gTextItemSmallHoleInDoor           ,e_LOCATION_NONE            ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_SmallHoleInDoor      
    { gTextItemBrokenWindow              ,e_LOCATION_NONE            ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_BrokenWindow         
    { gTextItemLargeDove                 ,e_LOCATION_WOODEDAVENUE    ,255           ,ITEM_FLAG_DEFAULT         ,CONTAINER_MASK3(e_ITEM_Bucket,e_ITEM_CardboardBox,e_ITEM_FishingNet)},                                // e_ITEM_LargeDove            
    { gTextItemTwine                     ,e_LOCATION_GREENHOUSE      ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_Twine                
    { gTextItemSilverKnife               ,e_LOCATION_VEGSGARDEN      ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_SilverKnife          
    { gTextItemLadder                    ,e_LOCATION_APPLE_TREES     ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_Ladder               
    { gTextItemAbandonedCar              ,e_LOCATION_TARMACAREA      ,255           ,ITEM_FLAG_HEAVY           ,0},                                            // e_ITEM_AbandonedCar         
    { gTextItemAlsatianDog               ,e_LOCATION_ENTRANCEHALL    ,255           ,ITEM_FLAG_HEAVY           ,0},                                            // e_ITEM_AlsatianDog          
    { gTextItemMeat                      ,e_LOCATION_DININGROOM      ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_Meat                 
    { gTextItemBread                     ,e_LOCATION_DININGROOM      ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_Bread                
    { gTextItemRollOfTape                ,e_LOCATION_BOXROOM         ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_RollOfTape           
    { gTextItemChemistryBook             ,e_LOCATION_LIBRARY         ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_ChemistryBook        
    { gTextItemBoxOfMatches              ,e_LOCATION_KITCHEN         ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_BoxOfMatches         
    { gTextItemSnookerCue                ,e_LOCATION_GAMESROOM       ,255           ,ITEM_FLAG_DEFAULT         ,ITEM_FLAG_DEFAULT },                           // e_ITEM_SnookerCue           
    { gTextItemThug                      ,e_LOCATION_MASTERBEDROOM   ,255           ,ITEM_FLAG_HEAVY           ,0},                                            // e_ITEM_Thug                 
    { gTextItemHeavySafe                 ,e_LOCATION_CELLAR          ,255           ,ITEM_FLAG_HEAVY           ,0},                                            // e_ITEM_HeavySafe            
    { gTextItemHandWrittenNote           ,e_LOCATION_BOXROOM         ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_HandWrittenNote          
    { gTextItemRope                      ,e_LOCATION_WELL            ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_Rope                 
    { gTextItemRopeHangingFromWindow     ,e_LOCATION_NONE            ,e_ITEM_Rope   ,ITEM_FLAG_ALIAS_ITEM         ,0},                                            // e_ITEM_RopeHangingFromWindow
    { gTextItemRollOfToiletPaper         ,e_LOCATION_TINY_WC         ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_RollOfToiletPaper    
    { gTextItemHosePipe                  ,e_LOCATION_ZENGARDEN       ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_HosePipe             
    { gTextItemOpenSafe                  ,e_LOCATION_NONE            ,255           ,ITEM_FLAG_HEAVY           ,0},                                            // e_ITEM_OpenSafe             
    { gTextItemBrokenGlass               ,e_LOCATION_NONE            ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_BrokenGlass          
    { gTextItemAcidBurn                  ,e_LOCATION_NONE            ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_AcidBurn             
    { gTextItemYoungGirl                 ,e_LOCATION_NONE            ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_YoungGirl        
    { gTextItemFuse                      ,e_LOCATION_NONE            ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_Fuse                 
    { gTextItemGunPowder                 ,e_LOCATION_NONE            ,255           ,ITEM_FLAG_DEFAULT         ,CONTAINER_MASK4(e_ITEM_Bucket,e_ITEM_PlasticBag,e_ITEM_TobaccoTin,e_ITEM_CardboardBox)},                            // e_ITEM_GunPowder            
    { gTextItemKeys                      ,e_LOCATION_MAINSTREET      ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_Keys                 
    { gTextItemNewspaper                 ,e_LOCATION_INVENTORY       ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_Newspaper            
    { gTextItemBomb                      ,e_LOCATION_NONE            ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_Bomb                 
    { gTextItemPistol                    ,e_LOCATION_NONE            ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_Pistol               
    { gTextItemBullets                   ,e_LOCATION_DARKCELLARROOM  ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_Bullets              
    { gTextItemYoungGirlOnFloor          ,e_LOCATION_GIRLROOM        ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_YoungGirlOnFloor     
    { gTextItemChemistryRecipes          ,e_LOCATION_NONE            ,255           ,ITEM_FLAG_DEFAULT         ,0},                                            // e_ITEM_ChemistryRecipes     
    { gTextItemUnitedKingdomMap          ,e_LOCATION_LIBRARY         ,255           ,ITEM_FLAG_HEAVY           ,0},                                            // e_ITEM_UnitedKingdomMap   
    { gTextItemLadderInTheHole           ,e_LOCATION_NONE            ,e_ITEM_Ladder ,ITEM_FLAG_ALIAS_ITEM      ,0},                                            // e_ITEM_LadderInTheHole               
    { gTextItemeRopeAttachedToATree      ,e_LOCATION_NONE            ,e_ITEM_Rope   ,ITEM_FLAG_ALIAS_ITEM      ,0},                                            // e_ITEM_RopeAttachedToATree
};


keyword gWordsArray[] =
{
    // Containers
#ifdef LANGUAGE_FR    
    { "TABATIERE" ,e_ITEM_TobaccoTin           },  // e_ITEM_TobaccoTin            
    { "SEAU"    ,e_ITEM_Bucket               },  // e_ITEM_Bucket                
    { "BOITE"   ,e_ITEM_CardboardBox         },  // e_ITEM_CardboardBox          
    { "FILET"   ,e_ITEM_FishingNet           },  // e_ITEM_FishingNet            
    { "SAC"     ,e_ITEM_PlasticBag           },  // e_ITEM_PlasticBag            
#else
    { "TIN",    e_ITEM_TobaccoTin           },  // e_ITEM_TobaccoTin            
    { "BUCKET", e_ITEM_Bucket               },  // e_ITEM_Bucket                
    { "BOX",    e_ITEM_CardboardBox         },  // e_ITEM_CardboardBox          
    { "NET",    e_ITEM_FishingNet           },  // e_ITEM_FishingNet            
    { "BAG",    e_ITEM_PlasticBag           },  // e_ITEM_PlasticBag            
#endif    

    // Then normal items
    { "GIRL",   e_ITEM_YoungGirl            },  // e_ITEM_YoungGirl         
    //{ "GIRL",e_ITEM_YoungGirlOnFloor     },  // e_ITEM_YoungGirlOnFloor - Girl, girl on the floor, etc... should be the same item, but with flags
    { "WINDOW", e_ITEM_BrokenWindow         },  // e_ITEM_BrokenWindow          
    //{ "SAFE",   e_ITEM_OpenSafe             },  // e_ITEM_OpenSafe  - Open and locked safe should be the same item, but with flags            
    { "DUST",   e_ITEM_BlackDust            },  // e_ITEM_BlackDust             
    { "PANEL",  e_ITEM_OpenPanel            },  // e_ITEM_OpenPanel             
    //{ "PANEL",e_ITEM_LockedPanel          },  // e_ITEM_LockedPanel  - Open and Locked panels should be the same item, but with flags
    { "POWDER", e_ITEM_YellowPowder         },  // e_ITEM_YellowPowder          
    //{ "...",e_ITEM_SmallHoleInDoor      },  // e_ITEM_SmallHoleInDoor       
    { "WATER",  e_ITEM_Water                },  // e_ITEM_Water                 
    { "DOVE",   e_ITEM_LargeDove            },  // e_ITEM_LargeDove             
    { "TWINE",  e_ITEM_Twine                },  // e_ITEM_Twine                 
    { "KNIFE",  e_ITEM_SilverKnife          },  // e_ITEM_SilverKnife       
    { "LADDER", e_ITEM_Ladder               },  // e_ITEM_Ladder                
    { "CAR",    e_ITEM_AbandonedCar         },  // e_ITEM_AbandonedCar          
    { "DOG",    e_ITEM_AlsatianDog          },  // e_ITEM_AlsatianDog       
    { "MEAT",   e_ITEM_Meat                 },  // e_ITEM_Meat                  
    { "BREAD",  e_ITEM_Bread                },  // e_ITEM_Bread                 
    { "TAPE",   e_ITEM_RollOfTape           },  // e_ITEM_RollOfTape            
    { "BOOK",   e_ITEM_ChemistryBook        },  // e_ITEM_ChemistryBook         
    { "MATCHES",e_ITEM_BoxOfMatches         },  // e_ITEM_BoxOfMatches          
    { "CUE",    e_ITEM_SnookerCue           },  // e_ITEM_SnookerCue            
    { "THUG",   e_ITEM_Thug                 },  // e_ITEM_Thug                  
    { "SAFE",   e_ITEM_HeavySafe            },  // e_ITEM_HeavySafe             
    { "NOTE",   e_ITEM_HandWrittenNote      },  // e_ITEM_HandWrittenNote       
    { "ROPE",   e_ITEM_Rope                 },  // e_ITEM_Rope                  
    //{ "...",e_ITEM_RopeHangingFromWindow},  // e_ITEM_RopeHangingFromWindow
    { "TISSUE", e_ITEM_RollOfToiletPaper    },  // e_ITEM_RollOfToiletPaper     
    { "HOSE",   e_ITEM_HosePipe             },  // e_ITEM_HosePipe              
    { "PETROL", e_ITEM_Petrol               },  // e_ITEM_Petrol                
    { "GLASS",  e_ITEM_BrokenGlass          },  // e_ITEM_BrokenGlass       
    //{ "...",e_ITEM_AcidBurn             },  // e_ITEM_AcidBurn              
    { "BOTTLE", e_ITEM_SmallBottle          },  // e_ITEM_SmallBottle       
    { "FUSE",   e_ITEM_Fuse                 },  // e_ITEM_Fuse                  
    { "GUN",    e_ITEM_GunPowder            },  // e_ITEM_GunPowder             
    { "KEYS",   e_ITEM_Keys                 },  // e_ITEM_Keys                  
    { "NEWSPAPER",e_ITEM_Newspaper            },  // e_ITEM_Newspaper             
    { "BOMB",   e_ITEM_Bomb                 },  // e_ITEM_Bomb                  
    { "PISTOL", e_ITEM_Pistol               },  // e_ITEM_Pistol                
    { "BULLETS",e_ITEM_Bullets              },  // e_ITEM_Bullets           
    { "RECIPES",e_ITEM_ChemistryRecipes     },
    { "MAP"    ,e_ITEM_UnitedKingdomMap     },
    

    // Directions
#ifdef LANGUAGE_FR    
    { "N", e_WORD_NORTH },
    { "S", e_WORD_SOUTH },
    { "E", e_WORD_EAST  },
    { "O", e_WORD_WEST  },
    { "M", e_WORD_UP    },
    { "D", e_WORD_DOWN  },

    { "NORD", e_WORD_NORTH },
    { "SUD", e_WORD_SOUTH },
    { "EST", e_WORD_EAST  },
    { "OUEST", e_WORD_WEST  },
    { "MONTE", e_WORD_UP    },
    { "DESCEND", e_WORD_DOWN  },
#else
    { "N", e_WORD_NORTH },
    { "S", e_WORD_SOUTH },
    { "E", e_WORD_EAST  },
    { "W", e_WORD_WEST  },
    { "U", e_WORD_UP    },
    { "D", e_WORD_DOWN  },

    { "NORTH", e_WORD_NORTH },
    { "SOUTH", e_WORD_SOUTH },
    { "EAST", e_WORD_EAST  },
    { "WEST", e_WORD_WEST  },
    { "UP", e_WORD_UP    },
    { "DOWN", e_WORD_DOWN  },
#endif    

    // Misc instructions
#ifdef LANGUAGE_FR    
    { "PREND"   , e_WORD_TAKE },
    { "RAMASSE" , e_WORD_TAKE },
    { "TUE"     , e_WORD_KILL },
    { "FOUILLE" , e_WORD_FRISK },
    { "CHERCHE" , e_WORD_SEARCH },

    { "LACHE"   , e_WORD_DROP },
    { "POSE"    , e_WORD_DROP },

    { "UTILISE" , e_WORD_USE },

    { "GRIMPE"  , e_WORD_CLIMB },

    { "LIT"     , e_WORD_READ },

    { "REGARDE" , e_WORD_LOOK },
    { "EXAMINE" , e_WORD_LOOK },
    { "INSPECTE", e_WORD_LOOK },
#else
    { "TAKE"    , e_WORD_TAKE },
    { "GET"     , e_WORD_TAKE },
    { "KILL"    , e_WORD_KILL },
    { "FRISK"   , e_WORD_FRISK },
    { "SEARCH"  , e_WORD_SEARCH },

    { "DROP", e_WORD_DROP },
    { "PUT" , e_WORD_DROP },

    { "USE" , e_WORD_USE },

    { "CLIMB", e_WORD_CLIMB },

    { "READ" , e_WORD_READ },

    { "LOOK"    , e_WORD_LOOK },
    { "EXAMINE" , e_WORD_LOOK },
    { "INSPECT" , e_WORD_LOOK },
#endif

#ifdef ENABLE_CHEATS
    { "REVIVE", e_WORD_REVIVE },
    { "TICKLE", e_WORD_TICKLE },
#endif    

    // Last instruction
    { "QUIT", e_WORD_QUIT },

    // Sentinelle
    { 0,  e_WORD_COUNT_ }
};
