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
if(CRAFTINGSCRIPT)then{
	//Machete
	["ItemMachete","Clear Grass","[] execVM 'scripts\crafting\clearbrush.sqf';","true"],
	//Knife
	["ItemKnife","Make Arrows","[] execVM 'scripts\crafting\makearrow.sqf';","true"],
	["ItemKnife","Make Bandage","[] execVM 'scripts\crafting\makebandage.sqf';","true"],
	//Toolbox
	["ItemToolbox","Make Knife","[] execVM 'scripts\crafting\makeknife.sqf';","true"],
	["ItemToolbox","Make Bow","[] execVM 'scripts\crafting\makebow.sqf';","true"],
	["ItemToolbox","Make Hatchet","[] execVM 'scripts\crafting\makehatchet.sqf';","true"],
};
if(WalkAmongstDeadScript)then{
	//Zombieparts
	["ItemZombieParts","Smear Zombie Guts on yourself","[] execVM 'scripts\walkamongstthedead\smear_guts.sqf';","true"],
	//Waterbottle
	["ItemWaterbottle","Wash off zombie gutss","[] execVM 'scripts\walkamongstthedead\usebottle.sqf';","true"],
}; 
if(CarepackageScript)then{  
	//100oz Briefcase
	["ItemBriefcase100oz","Call Carepackage (On Self)","[] execVM 'scripts\Carepackage\carepackage.sqf';","true"],
	["ItemBriefcase100oz","Call Carepackage (On Map)","[] execVM 'scripts\Carepackage2\clickpackage.sqf';","true"],
};
if(HarvestHempScript)then{
	//Hemp
	["ItemKiloHemp","Smoke Weed","[] execVM 'scripts\HarvestHemp\smokeweed.sqf';","true"],
	["ItemKnife","Harvest Weed","[] execVM 'scripts\HarvestHemp\hemp.sqf.sqf';","true"],
};
if(DZGMScript)then{
	//Radio
	["ItemRadio","Group Management","[] execVM 'scripts\dzgm\loadGroupManagement.sqf';","true"],
};
if(EmeraldScript)then{
	//Emerald
	["ItemEmerald","Picture Frame","createDialog 'WGT_INTERIOR1';","true"],
	["ItemEmerald","Chair","createDialog 'WGT_INTERIOR2';","true"],
	["ItemEmerald","Bed","createDialog 'WGT_INTERIOR3';","true"],
	["ItemEmerald","Bathroom","createDialog 'WGT_INTERIOR4';","true"],
	["ItemEmerald","Shelf","createDialog 'WGT_INTERIOR5';","true"],
	["ItemEmerald","Misc","createDialog 'WGT_INTERIOR6';","true"],
	["ItemEmerald","Table","createDialog 'WGT_INTERIOR7';","true"],
	["ItemEmerald","Exterior","createDialog 'WGT_INTERIOR8';","true"],
};
if(SuicideScript)then{
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
};
if(DeployBikeScript)then{
	["ItemToolbox","Deploy Bike","[] execVM 'scripts\spawnbike\deploy_init.sqf';","true"],
};
];                                               