AllAllowedSkins = [
		"Skin_Survivor2_DZ","Skin_SurvivorWcombat_DZ","Skin_SurvivorWdesert_DZ",
		"Skin_SurvivorWurban_DZ","Skin_SurvivorWsequishaD_DZ","Skin_SurvivorWsequisha_DZ",
		"Skin_SurvivorWpink_DZ","Skin_SurvivorW3_DZ","Skin_SurvivorW2_DZ",
		"Skin_Bandit1_DZ","Skin_Bandit2_DZ","Skin_BanditW1_DZ",
		"Skin_BanditW2_DZ","Skin_Soldier_Crew_PMC","Skin_Sniper1_DZ",
		"Skin_Camo1_DZ","Skin_Soldier1_DZ","Skin_Rocket_DZ",
		"Skin_Rocker1_DZ","Skin_Rocker2_DZ","Skin_Rocker3_DZ",
		"Skin_Rocker4_DZ","Skin_Priest_DZ","Skin_Functionary1_EP1_DZ",
		"Skin_GUE_Commander_DZ","Skin_Ins_Soldier_GL_DZ","Skin_Haris_Press_EP1_DZ",
		"Skin_Pilot_EP1_DZ","Skin_RU_Policeman_DZ","Skin_Soldier_TL_PMC_DZ",
		"Skin_Soldier_Sniper_PMC_DZ","Skin_Soldier_Bodyguard_AA12_PMC_DZ","Skin_Drake_Light_DZ",
		"Skin_CZ_Special_Forces_GL_DES_EP1_DZ","Skin_TK_INS_Soldier_EP1_DZ","Skin_TK_INS_Warlord_EP1_DZ",
		"Skin_FR_OHara_DZ","Skin_FR_Rodriguez_DZ","Skin_CZ_Soldier_Sniper_EP1_DZ",
		"Skin_GUE_Soldier_MG_DZ","Skin_GUE_Soldier_Sniper_DZ","Skin_GUE_Soldier_Crew_DZ",
		"Skin_GUE_Soldier_CO_DZ","Skin_GUE_Soldier_2_DZ","Skin_TK_Special_Forces_MG_EP1_DZ",
		"Skin_TK_Soldier_Sniper_EP1_DZ","Skin_TK_Commander_EP1_DZ","Skin_RU_Soldier_Crew_DZ",
		"Skin_INS_Lopotev_DZ","Skin_INS_Soldier_AR_DZ","Skin_INS_Soldier_CO_DZ",
		"Skin_INS_Bardak_DZ","Skin_INS_Worker2_DZ"
	];
	VASP_VehiclePreview = true;
	VASP_SkinPreview = true;
	ON_fnc_VehiclePreview = {
		private ["_item","_date","_tempDate","_msgCnt","_vehicleSpawnPos","_vehicleType","_vehicleName","_vehicleSpeed","_vehicleSeats","_vehicleWeapons","_vehicleMagazines","_vehicleBackpacks","_vehicleArmor","_vehicleFuel","_VehicleInfoText","_TraderMenuCategory","_TraderMenuItem","_pvp1","_pvp2","_pvp3","_pvp4","_pvp5","_pvp6","_pvp7","_pvp8","_pvp9","_pvp10","_pvp11","_pvp12","_pvp13","_pvp14","_pvp15","_pvp16","_pvp17","_pvp18","_pvp19","_pvp20","_pvp21","_pvp22","_pvp23","_pvp24","_pvp25","_pvp26","_pvp27","_pvp28","_pvp29","_pvp30","_pvp31","_pvp32","_pvp33","_pvp34","_pvp35","_pvp36"];
		
		/* Getting Data from the Tradermenu */
		_item = _this select 0;
		_TraderMenuCategory = _this select 1;
		_TraderMenuItem = _this select 2;
		cutText["~~ Preparing the Preview ~~\n~~ Please wait a moment ~~","PLAIN DOWN",0];
		0 cutText ["~~ Preparing the Preview ~~\n~~ Please wait a moment ~~","BLACK OUT",1];
		closeDialog 0;
		sleep 1.5;
		_date = date;
		_tempDate = [(_date select 0),(_date select 1),(_date select 2),12,0];
		setDate _tempDate;
		player setVariable["Preview",true,true];
		if (isNil "previewVehicle") then {
			previewVehicle = objNull;
		};
		if (!isNull previewVehicle) then {
			deleteVehicle previewVehicle;
		};
		waitUntil {sleep 0.01; isNull previewVehicle};
		_pvp1 = "MetalFloor_DZ" createVehicleLocal [79.096,82.321,2500];
		_pvp2 = "MetalFloor_DZ" createVehicleLocal [84.346,82.321,2500];
		_pvp3 = "MetalFloor_DZ" createVehicleLocal [84.346,77.071,2500];
		_pvp4 = "MetalFloor_DZ" createVehicleLocal [84.345,71.821,2500];
		_pvp5 = "MetalFloor_DZ" createVehicleLocal [79.095,71.822,2500];
		_pvp6 = "MetalFloor_DZ" createVehicleLocal [73.845,71.822,2500];
		_pvp7 = "MetalFloor_DZ" createVehicleLocal [73.846,77.072,2500];
		_pvp8 = "MetalFloor_DZ" createVehicleLocal [79.096,77.072,2500];
		_pvp9 = "MetalFloor_DZ" createVehicleLocal [73.846,82.322,2500];
		_pvp10 = "MetalFloor_DZ" createVehicleLocal [68.596,82.322,2500];
		_pvp11 = "MetalFloor_DZ" createVehicleLocal [68.596,77.072,2500];
		_pvp12 = "MetalFloor_DZ" createVehicleLocal [68.595,71.822,2500];
		_pvp13 = "MetalFloor_DZ" createVehicleLocal [63.345,71.823,2500];
		_pvp14 = "MetalFloor_DZ" createVehicleLocal [63.346,77.073,2500];
		_pvp15 = "MetalFloor_DZ" createVehicleLocal [68.596,87.572,2500];
		_pvp16 = "MetalFloor_DZ" createVehicleLocal [63.346,82.323,2500];
		_pvp17 = "MetalFloor_DZ" createVehicleLocal [63.346,87.573,2500];
		_pvp18 = "MetalFloor_DZ" createVehicleLocal [73.846,87.572,2500];
		_pvp19 = "MetalFloor_DZ" createVehicleLocal [79.096,87.572,2500];
		_pvp20 = "MetalFloor_DZ" createVehicleLocal [84.346,87.571,2500];
		_pvp21 = "MetalFloor_DZ" createVehicleLocal [84.347,92.821,2500];
		_pvp22 = "MetalFloor_DZ" createVehicleLocal [79.097,92.822,2500];
		_pvp23 = "MetalFloor_DZ" createVehicleLocal [73.847,92.822,2500];
		_pvp24 = "MetalFloor_DZ" createVehicleLocal [68.597,92.822,2500];
		_pvp25 = "MetalFloor_DZ" createVehicleLocal [63.347,92.823,2500];
		_pvp26 = "MetalFloor_DZ" createVehicleLocal [84.347,98.071,2500];
		_pvp27 = "MetalFloor_DZ" createVehicleLocal [79.097,98.072,2500];
		_pvp28 = "MetalFloor_DZ" createVehicleLocal [73.847,98.072,2500];
		_pvp29 = "MetalFloor_DZ" createVehicleLocal [68.597,98.072,2500];
		_pvp30 = "MetalFloor_DZ" createVehicleLocal [63.347,98.073,2500];
		_pvp31 = "MetalFloor_DZ" createVehicleLocal [58.097,98.073,2500];
		_pvp32 = "MetalFloor_DZ" createVehicleLocal [58.097,92.823,2500];
		_pvp33 = "MetalFloor_DZ" createVehicleLocal [58.096,87.573,2500];
		_pvp34 = "MetalFloor_DZ" createVehicleLocal [58.096,82.323,2500];
		_pvp35 = "MetalFloor_DZ" createVehicleLocal [58.096,77.073,2500];
		_pvp36 = "MetalFloor_DZ" createVehicleLocal [58.095,71.823,2500];
		_pvp1 setPosASL [79.096,82.321,2500];
		_pvp2 setPosASL [84.346,82.321,2500];
		_pvp3 setPosASL [84.346,77.071,2500];
		_pvp4 setPosASL [84.345,71.821,2500];
		_pvp5 setPosASL [79.095,71.822,2500];
		_pvp6 setPosASL [73.845,71.822,2500];
		_pvp7 setPosASL [73.846,77.072,2500];
		_pvp8 setPosASL [79.096,77.072,2500];
		_pvp9 setPosASL [73.846,82.322,2500];
		_pvp10 setPosASL [68.596,82.322,2500];
		_pvp11 setPosASL [68.596,77.072,2500];
		_pvp12 setPosASL [68.595,71.822,2500];
		_pvp13 setPosASL [63.345,71.823,2500];
		_pvp14 setPosASL [63.346,77.073,2500];
		_pvp15 setPosASL [68.596,87.572,2500];
		_pvp16 setPosASL [63.346,82.323,2500];
		_pvp17 setPosASL [63.346,87.573,2500];
		_pvp18 setPosASL [73.846,87.572,2500];
		_pvp19 setPosASL [79.096,87.572,2500];
		_pvp20 setPosASL [84.346,87.571,2500];
		_pvp21 setPosASL [84.347,92.821,2500];
		_pvp22 setPosASL [79.097,92.822,2500];
		_pvp23 setPosASL [73.847,92.822,2500];
		_pvp24 setPosASL [68.597,92.822,2500];
		_pvp25 setPosASL [63.347,92.823,2500];
		_pvp26 setPosASL [84.347,98.071,2500];
		_pvp27 setPosASL [79.097,98.072,2500];
		_pvp28 setPosASL [73.847,98.072,2500];
		_pvp29 setPosASL [68.597,98.072,2500];
		_pvp30 setPosASL [63.347,98.073,2500];
		_pvp31 setPosASL [58.097,98.073,2500];
		_pvp32 setPosASL [58.097,92.823,2500];
		_pvp33 setPosASL [58.096,87.573,2500];
		_pvp34 setPosASL [58.096,82.323,2500];
		_pvp35 setPosASL [58.096,77.073,2500];
		_pvp36 setPosASL [58.095,71.823,2500];
		_pvp1 setDir 270;
		_pvp2 setDir 270;
		_pvp3 setDir 270;
		_pvp4 setDir 270;
		_pvp5 setDir 270;
		_pvp6 setDir 270;
		_pvp7 setDir 270;
		_pvp8 setDir 270;
		_pvp9 setDir 270;
		_pvp10 setDir 270;
		_pvp11 setDir 270;
		_pvp12 setDir 270;
		_pvp13 setDir 270;
		_pvp14 setDir 270;
		_pvp15 setDir 270;
		_pvp16 setDir 270;
		_pvp17 setDir 270;
		_pvp18 setDir 270;
		_pvp19 setDir 270;
		_pvp20 setDir 270;
		_pvp21 setDir 270;
		_pvp22 setDir 270;
		_pvp23 setDir 270;
		_pvp24 setDir 270;
		_pvp25 setDir 270;
		_pvp26 setDir 270;
		_pvp27 setDir 270;
		_pvp28 setDir 270;
		_pvp29 setDir 270;
		_pvp30 setDir 270;
		_pvp31 setDir 270;
		_pvp32 setDir 270;
		_pvp33 setDir 270;
		_pvp34 setDir 270;
		_pvp35 setDir 270;
		_pvp36 setDir 270;
		_vehicleSpawnPos = [71.266,84.902,2500.1];
		previewVehicle = (_item select 0) createVehicleLocal _vehicleSpawnPos;
		previewVehicle setPosASL _vehicleSpawnPos;
		previewVehicle setDir 0;
		sleep 0.5;
		previewVehicle setVelocity [0,0,0];
		VehiclePreview_Camera = "camera" camCreate [(_vehicleSpawnPos select 0), (_vehicleSpawnPos select 1) - 30,2505];
		VehiclePreview_Camera cameraEffect ["internal","back"];
		VehiclePreview_Camera camSetTarget previewVehicle;
		VehiclePreview_Camera camSetRelPos [0,30,5];
		VehiclePreview_Camera camCommit 0;
		waitUntil {camCommitted VehiclePreview_Camera};
		waitUntil{sleep 1;((((velocity previewVehicle) select 0) < 1) && (((velocity previewVehicle) select 1) < 1) && (((velocity previewVehicle) select 2) < 1))};
		CamDistanceY = 30;
		CamDistanceZ = 5;
		PreviewLoop = true;
		PreviewAbortHotkey = (findDisplay 46) displayAddEventHandler ["KeyDown", "
			if ((_this select 1) == 0x3F) then {
				PreviewLoop = false;
				(findDisplay 46) displayRemoveEventHandler ['KeyDown', PreviewAbortHotkey];
				(findDisplay 46) displayRemoveEventHandler ['KeyDown', PreviewRotateHotkey];
				(findDisplay 46) displayRemoveEventHandler ['KeyDown', PreviewZoomHotkey];
			};
		"];
		
		/* Assign the Rotation Hotkeys */
		PreviewRotateHotkey = (findDisplay 46) displayAddEventHandler ["KeyDown", "
			if ((_this select 1) == 0xCB) then {
				_dir = getDir previewVehicle;
				if (_dir == 0) then {
					previewVehicle setDir 359.5;
				};
				previewVehicle setDir (_dir - 0.5);
			};
			if ((_this select 1) == 0xCD) then {
				_dir = getDir previewVehicle;
				if (_dir == 359.5) then {
					previewVehicle setDir 0;
				};
				previewVehicle setDir (_dir + 0.5);
			};
		"];
		
		/* Assign the Zoom Hotkeys */
		PreviewZoomHotkey = (findDisplay 46) displayAddEventHandler ["KeyDown", "
			if ((_this select 1) == 0xC8) then {
				if (CamDistanceY > 5) then {
					CamDistanceY = CamDistanceY - 0.1;
					VehiclePreview_Camera camSetRelPos [0,CamDistanceY,5];
					VehiclePreview_Camera camCommit 0;
				};
			};
			if ((_this select 1) == 0xD0) then {
				if (CamDistanceY < 35) then {
					CamDistanceY = CamDistanceY + 0.1;
					VehiclePreview_Camera camSetRelPos [0,CamDistanceY,5];
					VehiclePreview_Camera camCommit 0;
				};
			};
		"];
		
		/* Fade in the View again */
		0 cutText ["","BLACK IN",1];
		sleep 1.1;

		/* Message coutn variable reset */
		_msgCnt = 0;

		/* Getting vehicle Information from config */
		_vehicleType = (_item select 0);
		_vehicleName = getText (configFile >> "CfgVehicles" >> _vehicleType >> "displayName");
		_vehicleSpeed = getNumber (configFile >> "CfgVehicles" >> _vehicleType >> "maxSpeed");
		_vehicleSeats = getNumber (configFile >> "CfgVehicles" >> _vehicleType >> "transportSoldier");
		_vehicleWeapons = getNumber (configFile >> "CfgVehicles" >> _vehicleType >> "transportMaxWeapons");
		_vehicleMagazines = getNumber (configFile >> "CfgVehicles" >> _vehicleType >> "transportMaxMagazines");
		_vehicleBackpacks = getNumber (configFile >> "CfgVehicles" >> _vehicleType >> "transportMaxBackpacks");
		_vehicleArmor = getNumber (configFile >> "CfgVehicles" >> _vehicleType >> "armor");
		_vehicleFuel = getNumber (configFile >> "CfgVehicles" >> _vehicleType >> "fuelCapacity");

		/* Generating the Text */
		_VehicleInfoText = format ["
			<t size='0.7'		align='center' 	color='#5882FA'>%1</t>				<br/>
			<t></t><br/>
			<t size='0.5'		align='left' 	color='#FFBF00'>Max Speed:</t>		<t size='0.5'color='#FFFFFF'align='right'>%2 Km/H</t><br/>
			<t size='0.5'		align='left' 	color='#FFBF00'>Max Seats:</t>		<t size='0.5'color='#FFFFFF'align='right'>%3</t><br/>
			<t size='0.5'		align='left' 	color='#FFBF00'>Max Weapons:</t>	<t size='0.5'color='#FFFFFF'align='right'>%4</t><br/>
			<t size='0.5'		align='left' 	color='#FFBF00'>Max Magazines:</t>	<t size='0.5'color='#FFFFFF'align='right'>%5</t><br/>
			<t size='0.5'		align='left' 	color='#FFBF00'>Max Backpacks:</t>	<t size='0.5'color='#FFFFFF'align='right'>%6</t><br/>
			<t size='0.5'		align='left' 	color='#FFBF00'>Max Fuel:</t>		<t size='0.5'color='#FFFFFF'align='right'>%7 l</t><br/>
			<t size='0.5'		align='left' 	color='#FFBF00'>Max Armor:</t>		<t size='0.5'color='#FFFFFF'align='right'>%8</t>",
			_vehicleName,_vehicleSpeed,(_vehicleSeats + 1),_vehicleWeapons,_vehicleMagazines,_vehicleBackpacks,_vehicleFuel,_vehicleArmor
		];

		/* Hotkey Message and action check */
		cutText["~~ To quit the Preview press F5 ~~","PLAIN DOWN"];
		while {PreviewLoop} do {
			if (_msgCnt == 5) then {
				cutText["~~ To rotate the Vehicle press LEFFT or RIGHT ~~\n~~ To zoom in/out press  UP/DOWN ~~","PLAIN DOWN"];
				[_VehicleInfoText, [safezoneX + safezoneW - 0.8,0.50], [safezoneY + safezoneH - 0.8,0.7], 6, 0] spawn BIS_fnc_dynamicText;
			};
			if (_msgCnt == 10) then {
				cutText["~~ To quit the Preview press F5 ~~","PLAIN DOWN"];
				[_VehicleInfoText, [safezoneX + safezoneW - 0.8,0.50], [safezoneY + safezoneH - 0.8,0.7], 6, 0] spawn BIS_fnc_dynamicText;
				_msgCnt = 0;
			};
			_msgCnt = _msgCnt + 1;
			sleep 1;
		};
		
		/* Preview closed fade out the view */
		0 cutText ["","BLACK OUT",1];
		
		sleep 1.5;
		
		/* Set Date back to previous value */
		setDate _date;
		player setVariable["Preview",false,true];
		
		/* Delete all spawned Objects */
		deleteVehicle _pvp1;
		deleteVehicle _pvp2;
		deleteVehicle _pvp3;
		deleteVehicle _pvp4;
		deleteVehicle _pvp5;
		deleteVehicle _pvp6;
		deleteVehicle _pvp7;
		deleteVehicle _pvp8;
		deleteVehicle _pvp9;
		deleteVehicle _pvp10;
		deleteVehicle _pvp11;
		deleteVehicle _pvp12;
		deleteVehicle _pvp13;
		deleteVehicle _pvp14;
		deleteVehicle _pvp15;
		deleteVehicle _pvp16;
		deleteVehicle _pvp17;
		deleteVehicle _pvp18;
		deleteVehicle _pvp19;
		deleteVehicle _pvp20;
		deleteVehicle _pvp21;
		deleteVehicle _pvp22;
		deleteVehicle _pvp23;
		deleteVehicle _pvp24;
		deleteVehicle _pvp25;
		deleteVehicle _pvp26;
		deleteVehicle _pvp27;
		deleteVehicle _pvp28;
		deleteVehicle _pvp29;
		deleteVehicle _pvp30;
		deleteVehicle _pvp31;
		deleteVehicle _pvp32;
		deleteVehicle _pvp33;
		deleteVehicle _pvp34;
		deleteVehicle _pvp35;
		deleteVehicle _pvp36;
		if (!isNull previewVehicle) then {
			deleteVehicle previewVehicle;
		};
		
		/* Wait until all is deleted */
		waitUntil {sleep 0.01; isNull previewVehicle};
		
		/* Destroy the Cam */
		VehiclePreview_Camera cameraEffect ["terminate","back"];
		camDestroy VehiclePreview_Camera;

		/* Fade in the view */
		0 cutText ["","BLACK IN",1];
		
		sleep 1.1;
		
		/* Reopen the Tradermenu on the same position we left */
		TraderCategoryLoadFinished = false;
		[nil,nil,nil,LastTraderMenu] execVM "\z\addons\dayz_code\actions\show_dialog.sqf";
		waitUntil {dialog};
		lbSetCurSel [12000, _TraderMenuCategory];
		[_TraderMenuCategory] spawn TraderDialogLoadItemList;
		waitUntil{TraderCategoryLoadFinished};
		sleep 0.5;
		lbSetCurSel [12001, _TraderMenuItem];
		[_TraderMenuItem] spawn TraderDialogShowPrices;
	};

	/* Preview Skins */
	ON_fnc_SkinPreview = {
		private ["_item","_date","_tempDate","_msgCnt","_SkinInfoText","_TraderMenuCategory","_TraderMenuItem","_unitSpawnPos","_model","_skinType","_skinName","_skinDesc","_pvp1","_initUnit"];
		
		_item = _this select 0;
		_TraderMenuCategory = _this select 1;
		_TraderMenuItem = _this select 2;

		cutText["~~ Preparing the Preview ~~\n~~ Please wait a moment ~~","PLAIN DOWN",0];
		0 cutText ["~~ Preparing the Preview ~~\n~~ Please wait a moment ~~","BLACK OUT",1];
		closeDialog 0;
		sleep 1.5;
		
		_date = date;
		_tempDate = [(_date select 0),(_date select 1),(_date select 2),12,0];
		setDate _tempDate;
		player setVariable["Preview",true,true];

		if (isNil "previewUnit") then {
			previewUnit = objNull;
		};

		if (!isNull previewUnit) then {
			deleteVehicle previewUnit;
		};
		waitUntil {sleep 0.01; isNull previewUnit};

		_pvp1 = "MetalFloor_DZ" createVehicleLocal [79.096,82.321,2500];
		_pvp1 setPosASL [79.096,82.321,2500];
		
		_unitSpawnPos = [79.096,82.321,2500.1];
		_model = getText (configFile >> "CfgSurvival" >> "Skins" >> (_item select 0) >> "playerModel");

		previewUnit = createAgent [format["%1",_model], _unitSpawnPos, [], 0, "CAN_COLLIDE"];
		previewUnit setDir 180;
		previewUnit setPosASL _unitSpawnPos;
		previewUnit allowDammage false; previewUnit disableAI 'FSM'; previewUnit disableAI 'AUTOTARGET'; previewUnit disableAI 'TARGET'; previewUnit forceSpeed 0;
		_initUnit = format["{ if ((getPlayerUID _x) != '%1') then { _x hideObject %2; }; } forEach playableUnits;", (getPlayerUID player), previewUnit];

		SkinPreview_Camera = "camera" camCreate [(_unitSpawnPos select 0), (_unitSpawnPos select 1) - 10,2502];
		SkinPreview_Camera cameraEffect ["internal","back"];
		SkinPreview_Camera camSetTarget previewUnit;
		SkinPreview_Camera camSetRelPos [0,10,2];
		SkinPreview_Camera camCommit 0;
		
		CamDistanceY = 10;
		
		PreviewLoop = true;
		PreviewAbortHotkey = (findDisplay 46) displayAddEventHandler ["KeyDown", "
			if ((_this select 1) == 0x3F) then {
				PreviewLoop = false;
				(findDisplay 46) displayRemoveEventHandler ['KeyDown', PreviewAbortHotkey];
				(findDisplay 46) displayRemoveEventHandler ['KeyDown', PreviewRotateHotkey];
				(findDisplay 46) displayRemoveEventHandler ['KeyDown', PreviewZoomHotkey];
			};
		"];
		PreviewRotateHotkey = (findDisplay 46) displayAddEventHandler ["KeyDown", "
			if ((_this select 1) == 0xCB) then {
				_dir = getDir previewUnit;
				if (_dir == 0) then {
					previewUnit setDir 359;
				};
				previewUnit setDir (_dir - 1);
			};
			if ((_this select 1) == 0xCD) then {
				_dir = getDir previewUnit;
				if (_dir == 359) then {
					previewUnit setDir 0;
				};
				previewUnit setDir (_dir + 1);
			};
		"];
		PreviewZoomHotkey = (findDisplay 46) displayAddEventHandler ["KeyDown", "
			if ((_this select 1) == 0xC8) then {
				if (CamDistanceY > 1) then {
					CamDistanceY = CamDistanceY - 0.1;
					SkinPreview_Camera camSetRelPos [0,CamDistanceY,2];
					SkinPreview_Camera camCommit 0;
				};
			};
			if ((_this select 1) == 0xD0) then {
				if (CamDistanceY < 20) then {
					CamDistanceY = CamDistanceY + 0.1;
					SkinPreview_Camera camSetRelPos [0,CamDistanceY,2];
					SkinPreview_Camera camCommit 0;
				};
			};
		"];
		
		0 cutText ["","BLACK IN",1];
		sleep 1.1;

		_msgCnt = 0;

		_skinType = (_item select 0);
		_skinName = getText (configFile >> "CfgMagazines" >> _skinType >> "displayName");
		_skinDesc = getText (configFile >> "CfgMagazines" >> _skinType >> "descriptionShort");

		if (_skinName == _skinDesc) then {
			_SkinInfoText = format ["
				<t size='0.7'		align='center' 	color='#5882FA'>%1</t>				<br/>",
				_skinName
			];
		} else {
			_SkinInfoText = format ["
				<t size='0.7'		align='center' 	color='#5882FA'>%1</t>				<br/>
				<t></t><br/>
				<t size='0.5'		align='center' 	color='#5882FA'>%2</t>				<br/>",
				_skinName,_skinDesc
			];
		};

		cutText["~~ To quit the Preview press F5 ~~","PLAIN DOWN"];
		while {PreviewLoop} do {
			if (_msgCnt == 5) then {
				cutText["~~ To rotate the Unit press LEFFT or RIGHT ~~\n~~ To zoom in/out press  UP/DOWN ~~","PLAIN DOWN"];
				[_SkinInfoText, [safezoneX + safezoneW - 0.8,0.50], [safezoneY + safezoneH - 0.8,0.7], 6, 0] spawn BIS_fnc_dynamicText;
			};
			if (_msgCnt == 10) then {
				cutText["~~ To quit the Preview press F5 ~~","PLAIN DOWN"];
				[_SkinInfoText, [safezoneX + safezoneW - 0.8,0.50], [safezoneY + safezoneH - 0.8,0.7], 6, 0] spawn BIS_fnc_dynamicText;
				_msgCnt = 0;
			};
			_msgCnt = _msgCnt + 1;
			sleep 1;
		};
		
		0 cutText ["","BLACK OUT",1];
		
		sleep 1.5;
		
		setDate _date;
		player setVariable["Preview",false,true];

		if (!isNull previewUnit) then {
			deleteVehicle previewUnit;
		};
		waitUntil {sleep 0.01; isNull previewUnit};
		deleteVehicle _pvp1;
		
		SkinPreview_Camera cameraEffect ["terminate","back"];
		camDestroy SkinPreview_Camera;
		
		0 cutText ["","BLACK IN",1];
		
		sleep 1.1;
		TraderCategoryLoadFinished = false;
		[nil,nil,nil,LastTraderMenu] execVM "\z\addons\dayz_code\actions\show_dialog.sqf";
		waitUntil {dialog};
		lbSetCurSel [12000, _TraderMenuCategory];
		[_TraderMenuCategory] spawn TraderDialogLoadItemList;
		waitUntil{TraderCategoryLoadFinished};
		sleep 0.5;
		lbSetCurSel [12001, _TraderMenuItem];
		[_TraderMenuItem] spawn TraderDialogShowPrices;
		
		SkinPreviewCount = SkinPreviewCount - 1;
		publicVariable "SkinPreviewCount";
	};
