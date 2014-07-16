disableSerialization;
sleep 1;
player setvariable ["brake",0];
_display = (findDisplay 46);
_display displayAddEventHandler ["KeyDown","if ((_this select 1) == 31) then {player setvariable ['brake',1]} else {player setvariable ['brake',0]}"];

while {true} do {
	sleep 0.001;
	if !(hasNOSitems) then {
		cutText ["You need 1 Jerrycan and 1 Redbull to use NOS!", "PLAIN DOWN"]; 
		exitwith{};	
	};

	if (vehicle player != player) then {
	player removeMagazine "ItemJerrycan";
	player removeMagazine "ItemSodaRbull";
		_veh = vehicle player;
		_max = 200;
            if (!isOnRoad (position player)) then {_speedX = 0.2} else {_speedX = 0.1};; 
		if (speed _veh > 20 and speed _veh < _max and (player getvariable "brake" == 0)) then {
		
			_vel = velocity _veh;
			_dir = getdir _veh;
			_veh setvelocity [
				(_vel select 0) + _speedX * (sin _dir),
				(_vel select 1) + _speedX * (cos _dir),
				(_vel select 2) - _speedX
			];
		};
			
	};
};