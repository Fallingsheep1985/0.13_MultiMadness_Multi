//  DZE_CLICK_ACTIONS
//      This is where you register your right-click actions
//  FORMAT -- (no comma after last array entry)
//      [_classname,_text,_execute,_condition],
//  PARAMETERS
//  _classname  : the name of the class to click on 
//                  (example = "ItemBloodbag")
//  _text       : the text for the option that is displayed when right clicking on the item 
//                  (example = "Self Transfuse")
//  _execute    : compiled code to execute when the option is selected 
//                  (example = "execVM 'my\scripts\self_transfuse.sqf';")
//  _condition  : compiled code evaluated to determine whether or not the option is displayed
//                  (example = {true})
//  EXAMPLE -- see below for some simple examples
DZE_CLICK_ACTIONS = [
   // ["ItemGPS","Scan Nearby","if(isNil 'DZE_CLICK_ACTIONS_GPS_RANGE') then {DZE_CLICK_ACTIONS_GPS_RANGE = 1500;};DZE_CLICK_ACTIONS_ZOMBIE_COUNT = count ((position player) nearEntities ['zZombie_Base',DZE_CLICK_ACTIONS_GPS_RANGE]); DZE_CLICK_ACTIONS_MAN_COUNT = count ((position player) nearEntities ['CAManBase',DZE_CLICK_ACTIONS_GPS_RANGE]);cutText[format['Within %1 Meters: %2 AI/players, %3 zombies, %4 vehicles',DZE_CLICK_ACTIONS_GPS_RANGE,DZE_CLICK_ACTIONS_MAN_COUNT - DZE_CLICK_ACTIONS_ZOMBIE_COUNT,count ((position player) nearEntities ['zZombie_Base',DZE_CLICK_ACTIONS_GPS_RANGE]),count ((position player) nearEntities ['allVehicles',DZE_CLICK_ACTIONS_GPS_RANGE]) - DZE_CLICK_ACTIONS_MAN_COUNT],'PLAIN DOWN'];","true"],
   // ["ItemGPS","Range Up"   ,"if(isNil 'DZE_CLICK_ACTIONS_GPS_RANGE') then {DZE_CLICK_ACTIONS_GPS_RANGE = 1500;};DZE_CLICK_ACTIONS_GPS_RANGE = (DZE_CLICK_ACTIONS_GPS_RANGE + 100) min 2500; cutText[format['GPS RANGE: %1',DZE_CLICK_ACTIONS_GPS_RANGE],'PLAIN DOWN'];","true"],
   // ["ItemGPS","Range Down" ,"if(isNil 'DZE_CLICK_ACTIONS_GPS_RANGE') then {DZE_CLICK_ACTIONS_GPS_RANGE = 1500;};DZE_CLICK_ACTIONS_GPS_RANGE = (DZE_CLICK_ACTIONS_GPS_RANGE - 100) max 1000;  cutText[format['GPS RANGE: %1',DZE_CLICK_ACTIONS_GPS_RANGE],'PLAIN DOWN'];","true"],
   // ["ItemGPS","Toggle Map Marker","execVM 'overwrites\click_actions\examples\marker.sqf';","true"],
   // ["ItemMap","Toggle Map Marker","execVM 'overwrites\click_actions\examples\marker.sqf';","true"]
   //Machete
   ["ItemMachete","Clear Grass","[] execVM 'scripts\crafting\clearbrush.sqf';","true"],
   //Knife
   ["ItemKnife","Make Arrows","[] execVM 'scripts\crafting\makearrow.sqf';","true"],
   ["ItemKnife","Make Bandage","[] execVM 'scripts\crafting\makebandage.sqf';","true"],
   ["ItemKnife","Harvest Weed","[] execVM 'scripts\HarvestHemp\hemp.sqf.sqf';","true"],
   //Toolbox
   ["ItemToolbox","Make Knife","[] execVM 'scripts\crafting\makeknife.sqf';","true"],
   ["ItemToolbox","Make Bow","[] execVM 'scripts\crafting\makebow.sqf';","true"],
   ["ItemToolbox","Make Hatchet","[] execVM 'scripts\crafting\makehatchet.sqf';","true"],
   ["ItemToolbox","Deploy Bike","[] execVM 'scripts\spawnbike\deploy_init.sqf';","true"],
   //Zombieparts
   ["ItemZombieParts","Smear Zombie Guts on yourself","[] execVM 'scripts\walkamongstthedead\smear_guts.sqf';","true"],
   //Waterbottle
   ["ItemWaterbottle","Wash off zombie gutss","[] execVM 'scripts\walkamongstthedead\usebottle.sqf';","true"],
   //100oz Briefcase
   ["ItemBriefcase100oz","Call Carepackage (On Self)","[] execVM 'scripts\Carepackage\carepackage.sqf';","true"],
   ["ItemBriefcase100oz","Call Carepackage (On Map)","[] execVM 'scripts\Carepackage2\clickpackage.sqf';","true"],
   //Hemp
   ["ItemKiloHemp","Smoke Weed","[] execVM 'scripts\HarvestHemp\smokeweed.sqf';","true"],
   //Radio
   ["ItemRadio","Group Management","[] execVM 'scripts\dzgm\loadGroupManagement.sqf';","true"],
   //Emerald
   ["ItemRadio","Picture Frame","createDialog 'WGT_INTERIOR1';","true"],
   ["ItemRadio","Chair","createDialog 'WGT_INTERIOR2';","true"],
   ["ItemRadio","Bed","createDialog 'WGT_INTERIOR3';","true"],
   ["ItemRadio","Bathroom","createDialog 'WGT_INTERIOR4';","true"],
   ["ItemRadio","Shelf","createDialog 'WGT_INTERIOR5';","true"],
   ["ItemRadio","Misc","createDialog 'WGT_INTERIOR6';","true"],
   ["ItemRadio","Table","createDialog 'WGT_INTERIOR7';","true"],
   ["ItemRadio","Exterior","createDialog 'WGT_INTERIOR8';","true"],
   //Pistols
   ["glock17_EP1","Suicide","[] execVM 'scripts\suicide\suicide_init.sqf';","true"],
   ["M9","Suicide","[] execVM 'scripts\suicide\suicide_init.sqf';","true"],
   ["M9SD","Suicide","[] execVM 'scripts\suicide\suicide_init.sqf';","true"],
   ["Makarov","Suicide","[] execVM 'scripts\suicide\suicide_init.sqf';","true"],
   ["MakarovSD","Suicide","[] execVM 'scripts\suicide\suicide_init.sqf';","true"],
   ["revolver_EP1","Suicide","[] execVM 'scripts\suicide\suicide_init.sqf';","true"],
   ["UZI_EP1","Suicide","[] execVM 'scripts\suicide\suicide_init.sqf';","true"],
   ["SA61_EP1","Suicide","[] execVM 'scripts\suicide\suicide_init.sqf';","true"],
   ["Colt1911_EP1","Suicide","[] execVM 'scripts\suicide\suicide_init.sqf';","true"]
];                                               