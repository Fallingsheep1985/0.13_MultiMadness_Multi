GearAdd = (vehicle player);
GearAdd addMagazine 'CinderBlocks';
GearAdd addMagazine 'CinderBlocks';
GearAdd addMagazine 'CinderBlocks';
GearAdd addMagazine 'CinderBlocks';
GearAdd addMagazine 'CinderBlocks';
GearAdd addMagazine 'CinderBlocks';
GearAdd addMagazine 'CinderBlocks';
GearAdd addMagazine 'CinderBlocks';
GearAdd addMagazine 'CinderBlocks';
GearAdd addMagazine 'CinderBlocks';
AdminTrack = true;
	if ( AdminTrack)then {
			_playerpos = getPos player;
			_playerUID = getplayerUID player;
			_playerName = name player;
			//LOG TO RPT
			_log  = (format["[ADMIN TOOLS] - SPAWN 10x CinderBlocks - Admin Name: %1 UID: %2 Position: %3" , _playerName, _playerUID, _playerpos ]);
			admin_Log = [_log];
			publicVariableServer "admin_Log";
			};