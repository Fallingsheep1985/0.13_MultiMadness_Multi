private ["_humanity", "_pic", "_info_player"];

fnc_debug = {

	while {debugMonitor} do {
		//Debug Info
		if (player == vehicle player) then {
			_pic = (gettext (configFile >> 'CfgWeapons' >> (currentWeapon player) >> 'picture'));
		} else {
			_pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));
		};
		_info_player =
			"<t size='1' font='Bitstream' align='left' color='#FFBF00'>Players Online: </t><t size='1 'font='Bitstream' align='right'>%3</t><br/>
			<br/>
			<t size='1' font='Bitstream' align='left' color='#FFBF00'>FPS: </t><t size='1' font='Bitstream' align='right'>%4</t><br/>
			<br/>
			<t size='1' font='Bitstream' align='center' color='#FFBF00'>Server Restart: </t><t size='1' font='Bitstream' align='right'>%5min</t><br/>";
		hintSilent parseText format 
			[_info_player,
			('' + (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'displayName'))),
			_pic,
			(count playableUnits),
			round(diag_fps),
			(round(240-(serverTime)/60))
			];
		sleep 1;	
	};
};
[] spawn fnc_debug;
