private ["_nul","_result","_pos","_wsDone","_dir","_isOK","_countr","_objWpnTypes","_objWpnQty","_dam","_selection","_totalvehicles","_object","_idKey","_type","_ownerID","_worldspace","_intentory","_hitPoints","_fuel","_damage","_key","_vehLimit","_hiveResponse","_objectCount","_codeCount","_data","_status","_val","_traderid","_retrader","_traderData","_id","_lockable","_debugMarkerPosition","_vehicle_0","_bQty","_vQty","_BuildingQueue","_objectQueue","_superkey","_shutdown","_res","_hiveLoaded"];

dayz_versionNo = 		getText(configFile >> "CfgMods" >> "DayZ" >> "version");
dayz_hiveVersionNo = 	getNumber(configFile >> "CfgMods" >> "DayZ" >> "hiveVersion");

_hiveLoaded = false;

waitUntil{initialized}; //means all the functions are now defined

//####----####----####---- Base Building 1.3 Start ----####----####----####
call build_baseBuilding_arrays; // build BB 1.3 arrays
//####----####----####---- Base Building 1.3 End ----####----####----####


diag_log "HIVE: Starting";

waituntil{isNil "sm_done"}; // prevent server_monitor be called twice (bug during login of the first player)
	
// Custom Configs
if(isnil "MaxVehicleLimit") then {
	MaxVehicleLimit = 50;
};

if(isnil "MaxDynamicDebris") then {
	MaxDynamicDebris = 100;
};
if(isnil "MaxAmmoBoxes") then {
	MaxAmmoBoxes = 3;
};
if(isnil "MaxMineVeins") then {
	MaxMineVeins = 50;
};
// Custon Configs End

if (isServer && isNil "sm_done") then {

	serverVehicleCounter = [];
	_hiveResponse = [];

	for "_i" from 1 to 5 do {
		diag_log "HIVE: trying to get objects";
		_key = format["CHILD:302:%1:", dayZ_instance];
		_hiveResponse = _key call server_hiveReadWrite;  
		if ((((isnil "_hiveResponse") || {(typeName _hiveResponse != "ARRAY")}) || {((typeName (_hiveResponse select 1)) != "SCALAR")})) then {
			if ((_hiveResponse select 1) == "Instance already initialized") then {
				_superkey = profileNamespace getVariable "SUPERKEY";
				_shutdown = format["CHILD:400:%1:", _superkey];
				_res = _shutdown call server_hiveReadWrite;
				diag_log ("HIVE: attempt to kill.. HiveExt response:"+str(_res));
			} else {
				diag_log ("HIVE: connection problem... HiveExt response:"+str(_hiveResponse));
			
			};
			_hiveResponse = ["",0];
		} 
		else {
			diag_log ("HIVE: found "+str(_hiveResponse select 1)+" objects" );
			_i = 99; // break
		};
	};
	
	_BuildingQueue = [];
	_objectQueue = [];
	
	if ((_hiveResponse select 0) == "ObjectStreamStart") then {
	
		// save superkey
		profileNamespace setVariable ["SUPERKEY",(_hiveResponse select 2)];
		
		_hiveLoaded = true;
	
		diag_log ("HIVE: Commence Object Streaming...");
		_key = format["CHILD:302:%1:", dayZ_instance];
		_objectCount = _hiveResponse select 1;
		_bQty = 0;
		_vQty = 0;
		for "_i" from 1 to _objectCount do {
			_hiveResponse = _key call server_hiveReadWriteLarge;
			//diag_log (format["HIVE dbg %1 %2", typeName _hiveResponse, _hiveResponse]);
			if ((_hiveResponse select 2) isKindOf "ModularItems") then {
				_BuildingQueue set [_bQty,_hiveResponse];
				_bQty = _bQty + 1;
			} else {
				_objectQueue set [_vQty,_hiveResponse];
				_vQty = _vQty + 1;
			};
		};
		diag_log ("HIVE: got " + str(_bQty) + " Epoch Objects and " + str(_vQty) + " Vehicles");
	};
	
	// # NOW SPAWN OBJECTS #
	_totalvehicles = 0;
	{
		_idKey = 		_x select 1;
		_type =			_x select 2;
		_ownerID = 		_x select 3;

		_worldspace = 	_x select 4;
		_intentory =	_x select 5;
		_hitPoints =	_x select 6;
		_fuel =			_x select 7;
		_damage = 		_x select 8;
		
		_dir = 0;
		_pos = [0,0,0];
		_wsDone = false;
		if (count _worldspace >= 2) then
		{
			_dir = _worldspace select 0;
			if (count (_worldspace select 1) == 3) then {
				_pos = _worldspace select 1;
				_wsDone = true;
			}
		};			
		
		if (!_wsDone) then {
			if (count _worldspace >= 1) then { _dir = _worldspace select 0; };
			_pos = [getMarkerPos "center",0,4000,10,0,2000,0] call BIS_fnc_findSafePos;
			if (count _pos < 3) then { _pos = [_pos select 0,_pos select 1,0]; };
			diag_log ("MOVED OBJ: " + str(_idKey) + " of class " + _type + " to pos: " + str(_pos));
		};
		
		// Realign characterID to OwnerPUID - need to force save though.
		if (count _worldspace < 3) then
		{
			_worldspace set [count _worldspace, "0"];
		};		
		_ownerPUID = _worldspace select 2;
		if (_damage < 1) then {
			//diag_log format["OBJ: %1 - %2", _idKey,_type];
			
			//Create it
			_object = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
			_object setVariable ["lastUpdate",time];
			_object setVariable ["ObjectID", _idKey, true];
			_object setVariable ["OwnerPUID", _ownerPUID, true];

			_lockable = 0;
			if(isNumber (configFile >> "CfgVehicles" >> _type >> "lockable")) then {
				_lockable = getNumber(configFile >> "CfgVehicles" >> _type >> "lockable");
			};

			// fix for leading zero issues on safe codes after restart
			if (_lockable == 4) then {
				_codeCount = (count (toArray _ownerID));
				if(_codeCount == 3) then {
					_ownerID = format["0%1", _ownerID];
				};
				if(_codeCount == 2) then {
					_ownerID = format["00%1", _ownerID];
				};
				if(_codeCount == 1) then {
					_ownerID = format["000%1", _ownerID];
				};
			};

			if (_lockable == 3) then {
				_codeCount = (count (toArray _ownerID));
				if(_codeCount == 2) then {
					_ownerID = format["0%1", _ownerID];
				};
				if(_codeCount == 1) then {
					_ownerID = format["00%1", _ownerID];
				};
			};

			_object setVariable ["CharacterID", _ownerID, true];
			
			clearWeaponCargoGlobal  _object;
			clearMagazineCargoGlobal  _object;
			// _object setVehicleAmmo DZE_vehicleAmmo;
			
			_object setdir _dir;
			_object setposATL _pos;
			_object setDamage _damage;
			
			//####----####----####---- Base Building 1.3 Start ----####----####----####
				//Check to make sure all current flags match the set flag type, if not then change them
				if ((typeOf(_object) in BBAllFlagTypes) && (typeOf(_object) != BBTypeOfFlag)) then {
				deleteVehicle _object;
				_object = createVehicle [BBTypeOfFlag, _pos, [], 0, "CAN_COLLIDE"];
				_object setVariable ["CharacterID", _ownerID, true];
				};
				
				//Check to make sure all current shield generators match the set shield generator type, if not then change them
				if ((typeOf(_object) in BBAllZShieldTypes) && (typeOf(_object) != BBTypeOfZShield)) then {
				deleteVehicle _object;
				_object = createVehicle [BBTypeOfZShield, _pos, [], 0, "CAN_COLLIDE"];
				_object setVariable ["CharacterID", _ownerID, true];
				};
				
				// Give objects all custom UID
				if (typeOf(_object) in allbuildables_class) then {
				_object setVariable ["AuthorizedUID", _intentory, true]; //Sets the AuthorizedUID for build objects
				_object setVariable ["ObjectUID", ((_intentory select 0) select 0), true]; //Sets Object UID using array value
				};

				//Handle Traps (Graves)
				if (typeOf(_object) == "Grave") then {
					_object setVariable ["isBomb", 1, true];//this will be known as a bomb instead of checking with classnames in player_bomb
					_object setpos [(getposATL _object select 0),(getposATL _object select 1), -0.12];
					_object addEventHandler ["HandleDamage", {false}];
				};
				
				//Restore extendable objects to whatever their position is supposed to be
				if (typeOf(_object) in allExtendables && typeOf(_object) != "Grave") then {
					_object setposATL [(getposATL _object select 0),(getposATL _object select 1), (getposATL _object select 2)];
				};
				
				//Restore non extendable objects and make sure they follow the land contours
				if (typeOf(_object) in allbuildables_class) then {
					_object setpos [(getposATL _object select 0),(getposATL _object select 1), 0];
				};
				//Set Variable
				_codePanels = ["Infostand_2_EP1", "Fence_corrugated_plate", BBTypeOfFlag];
				if (typeOf(_object) in _codePanels && (typeOf(_object) != "Infostand_1_EP1")) then {
					_object addEventHandler ["HandleDamage", {false}];
				};
				
				/*******************************************This Section Handles Objects Which Move Excessively During the Build Process***********************************************/
				/*******************************If added build objects move excessively, you can add a condition for them here and adjust as needed!***********************************/
				if (typeOf(_object) == "Land_sara_hasic_zbroj") then {
					_object setPosATL [((getPosATL _object select 0)+5.5),((getPosATL _object select 1)-1),(getPosATL _object select 2)];
				};
				if (typeOf(_object) == "Fence_Ind_long") then {
					_object setPosATL [((getPosATL _object select 0)-3.5),((getPosATL _object select 1)-0),(getPosATL _object select 2)];
				};
				if (typeOf(_object) == "Fort_RazorWire" || typeOf(_object) == "Land_Shed_wooden") then {
					_object setPosATL [((getPosATL _object select 0)-1.5),((getPosATL _object select 1)-0.5),(getPosATL _object select 2)];
				};
				if (typeOf(_object) == "Land_vez") then {
					_object setPosATL [((getPosATL _object select 0)-3.5),((getPosATL _object select 1)+1.5),(getPosATL _object select 2)];
				};
				if (typeOf(_object) == "Land_Misc_Scaffolding") then {
					_object setPosATL [((getPosATL _object select 0)-0.5),((getPosATL _object select 1)+3),(getPosATL _object select 2)];
				};
				/**************************************************************End of Excessive Movement Section***********************************************************************/

				// Set whether or not buildable is destructable
				if (typeOf(_object) in allbuildables_class) then {
					diag_log ("SERVER: in allbuildables_class:" + typeOf(_object) + "!");
					for "_i" from 0 to ((count allbuildables) - 1) do
					{
						_classname = (allbuildables select _i) select _i - _i + 1;
						_result = [_classname,typeOf(_object)] call BIS_fnc_areEqual;
						if (_result) exitWith {
							_requirements = (allbuildables select _i) select _i - _i + 2;
							_isDestructable = _requirements select 13;
							diag_log ("SERVER: " + typeOf(_object) + " _isDestructable = " + str(_isDestructable));
							if (!_isDestructable) then {
								diag_log("Spawned: " + typeOf(_object) + " Handle Damage False");
								_object addEventHandler ["HandleDamage", {false}];
							};
						};
					};
				};
				//####----####----####---- Base Building 1.3 End ----####----####----####

			
			if ((typeOf _object) in dayz_allowedObjects) then {
				if (DZE_GodModeBase) then {
					_object addEventHandler ["HandleDamage", {false}];
				} else {
					_object addMPEventHandler ["MPKilled",{_this call object_handleServerKilled;}];
				};
				// Test disabling simulation server side on buildables only.
				_object enableSimulation false;
				// used for inplace upgrades && lock/unlock of safe
				_object setVariable ["OEMPos", _pos, true];
				
			};

			if ((count _intentory > 0) && !(typeOf(_object) in allbuildables_class) && !(typeOf(_object) in BBAllFlagTypes) && !(typeOf(_object) in BBAllZShieldTypes)) then {
				if (_type in DZE_LockedStorage) then {
					// Fill variables with loot
					_object setVariable ["WeaponCargo", (_intentory select 0),true];
					_object setVariable ["MagazineCargo", (_intentory select 1),true];
					_object setVariable ["BackpackCargo", (_intentory select 2),true];
				} else {

					//Add weapons
					_objWpnTypes = (_intentory select 0) select 0;
					_objWpnQty = (_intentory select 0) select 1;
					_countr = 0;					
					{
						if(_x in (DZE_REPLACE_WEAPONS select 0)) then {
							_x = (DZE_REPLACE_WEAPONS select 1) select ((DZE_REPLACE_WEAPONS select 0) find _x);
						};
						_isOK = 	isClass(configFile >> "CfgWeapons" >> _x);
						if (_isOK) then {
							_object addWeaponCargoGlobal [_x,(_objWpnQty select _countr)];
						};
						_countr = _countr + 1;
					} count _objWpnTypes; 
				
					//Add Magazines
					_objWpnTypes = (_intentory select 1) select 0;
					_objWpnQty = (_intentory select 1) select 1;
					_countr = 0;
					{
						if (_x == "BoltSteel") then { _x = "WoodenArrow" }; // Convert BoltSteel to WoodenArrow
						if (_x == "ItemTent") then { _x = "ItemTentOld" };
						_isOK = 	isClass(configFile >> "CfgMagazines" >> _x);
						if (_isOK) then {
							_object addMagazineCargoGlobal [_x,(_objWpnQty select _countr)];
						};
						_countr = _countr + 1;
					} count _objWpnTypes;

					//Add Backpacks
					_objWpnTypes = (_intentory select 2) select 0;
					_objWpnQty = (_intentory select 2) select 1;
					_countr = 0;
					{
						_isOK = 	isClass(configFile >> "CfgVehicles" >> _x);
						if (_isOK) then {
							_object addBackpackCargoGlobal [_x,(_objWpnQty select _countr)];
						};
						_countr = _countr + 1;
					} count _objWpnTypes;
				};
			};	
			
			if (_object isKindOf "AllVehicles") then {
				{
					_selection = _x select 0;
					_dam = _x select 1;
					if (_selection in dayZ_explosiveParts && _dam > 0.8) then {_dam = 0.8};
					[_object,_selection,_dam] call object_setFixServer;
				} count _hitpoints;

				_object setFuel _fuel;

				if (!((typeOf _object) in dayz_allowedObjects)) then {
					
					//_object setvelocity [0,0,1];
					_object call fnc_veh_ResetEH;		
					
					if(_ownerID != "0" && !(_object isKindOf "Bicycle")) then {
						_object setvehiclelock "locked";
						_object setVariable ["MF_Tow_Cannot_Tow",true,true];
						_object setVariable ["BTC_Cannot_Lift",true,true];
					};
					
					_totalvehicles = _totalvehicles + 1;

					// total each vehicle
					serverVehicleCounter set [count serverVehicleCounter,_type];
				};
			};

			//Monitor the object
			PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_object];
		};
	} count (_BuildingQueue + _objectQueue);
	// # END SPAWN OBJECTS #

	// preload server traders menu data into cache
	if !(DZE_ConfigTrader) then {
		{
			// get tids
			_traderData = call compile format["menu_%1;",_x];
			if(!isNil "_traderData") then {
				{
					_traderid = _x select 1;

					_retrader = [];

					_key = format["CHILD:399:%1:",_traderid];
					_data = "HiveEXT" callExtension _key;

					//diag_log "HIVE: Request sent";
			
					//Process result
					_result = call compile format ["%1",_data];
					_status = _result select 0;
			
					if (_status == "ObjectStreamStart") then {
						_val = _result select 1;
						//Stream Objects
						//diag_log ("HIVE: Commence Menu Streaming...");
						call compile format["ServerTcache_%1 = [];",_traderid];
						for "_i" from 1 to _val do {
							_data = "HiveEXT" callExtension _key;
							_result = call compile format ["%1",_data];
							call compile format["ServerTcache_%1 set [count ServerTcache_%1,%2]",_traderid,_result];
							_retrader set [count _retrader,_result];
						};
						//diag_log ("HIVE: Streamed " + str(_val) + " objects");
					};

				} forEach (_traderData select 0);
			};
		} forEach serverTraders;
	};

	if (_hiveLoaded) then {
		//  spawn_vehicles
		_vehLimit = MaxVehicleLimit - _totalvehicles;
		if(_vehLimit > 0) then {
			diag_log ("HIVE: Spawning # of Vehicles: " + str(_vehLimit));
			for "_x" from 1 to _vehLimit do {
				[] spawn spawn_vehicles;
			};
		} else {
			diag_log "HIVE: Vehicle Spawn limit reached!";
		};
	};
	
	//  spawn_roadblocks
	diag_log ("HIVE: Spawning # of Debris: " + str(MaxDynamicDebris));
	for "_x" from 1 to MaxDynamicDebris do {
		[] spawn spawn_roadblocks;
	};
	//  spawn_ammosupply at server start 1% of roadblocks
	diag_log ("HIVE: Spawning # of Ammo Boxes: " + str(MaxAmmoBoxes));
	for "_x" from 1 to MaxAmmoBoxes do {
		[] spawn spawn_ammosupply;
	};
	// call spawning mining veins
	diag_log ("HIVE: Spawning # of Veins: " + str(MaxMineVeins));
	for "_x" from 1 to MaxMineVeins do {
		[] spawn spawn_mineveins;
	};

	if(isnil "dayz_MapArea") then {
		dayz_MapArea = 10000;
	};
	if(isnil "HeliCrashArea") then {
		HeliCrashArea = dayz_MapArea / 2;
	};
	if(isnil "OldHeliCrash") then {
		OldHeliCrash = false;
	};

	// [_guaranteedLoot, _randomizedLoot, _frequency, _variance, _spawnChance, _spawnMarker, _spawnRadius, _spawnFire, _fadeFire]
	if(OldHeliCrash) then {
		_nul = [3, 4, (50 * 60), (15 * 60), 0.75, 'center', HeliCrashArea, true, false] spawn server_spawnCrashSite;
	};
	//Animated AN2 crashes loot
	nul = [7, 5, 700, 0, 0.99, 'center', 4000, true, false, false, 5, 1]spawn server_spawnAN2CrashSite;
	//AN2 Carpackages
	nul = [6, 3, (50*60), (15*60), 0.75, 'center', 8000, true, false, 2, 3, 1] spawn server_spawnAN2;
	//Air Raid
	nul = [] spawn server_airRaid;
	if (isDedicated) then {
		// Epoch Events
		_id = [] spawn server_spawnEvents;
		// server cleanup
		[] spawn {
			private ["_id"];
			sleep 200; //Sleep Lootcleanup, don't need directly cleanup on startup + fix some performance issues on serverstart
			waitUntil {!isNil "server_spawnCleanAnimals"};
			_id = [] execFSM "\z\addons\dayz_server\system\server_cleanup.fsm";
		};

		// spawn debug box
		_debugMarkerPosition = getMarkerPos "respawn_west";
		_debugMarkerPosition = [(_debugMarkerPosition select 0),(_debugMarkerPosition select 1),1];
		_vehicle_0 = createVehicle ["DebugBox_DZ", _debugMarkerPosition, [], 0, "CAN_COLLIDE"];
		_vehicle_0 setPos _debugMarkerPosition;
		_vehicle_0 setVariable ["ObjectID","1",true];

		// max number of spawn markers
		if(isnil "spawnMarkerCount") then {
			spawnMarkerCount = 10;
		};
		actualSpawnMarkerCount = 0;
		// count valid spawn marker positions
		for "_i" from 0 to spawnMarkerCount do {
			if (!([(getMarkerPos format["spawn%1", _i]), [0,0,0]] call BIS_fnc_areEqual)) then {
				actualSpawnMarkerCount = actualSpawnMarkerCount + 1;
			} else {
				// exit since we did not find any further markers
				_i = spawnMarkerCount + 99;
			};
			
		};
		diag_log format["Total Number of spawn locations %1", actualSpawnMarkerCount];
		
		endLoadingScreen;
	};

	if(WAIScript)then{
	[] ExecVM "\z\addons\dayz_server\WAI\init.sqf";
	};
	if(DZAIScript)then{
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\init\dzai_initserver.sqf";
	};
	if(DZMSScript)then{
		[] ExecVM "\z\addons\dayz_server\DZMS\DZMSInit.sqf";
	};
	allowConnection = true;
	//Spawn camps
	dayz_Campspawner = [] spawn {
		// quantity, marker, radius, min distance between 2 camps
		Server_InfectedCamps = [3, "center", dayz_MapArea, 2500] call fn_bases;
		dayzInfectedCamps = Server_InfectedCamps;
		publicVariable "dayzInfectedCamps";
	};	
	sm_done = true;
	publicVariable "sm_done";
};
