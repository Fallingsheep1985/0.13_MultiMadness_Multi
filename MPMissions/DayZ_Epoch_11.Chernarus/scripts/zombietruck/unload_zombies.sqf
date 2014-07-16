private ["_7Wyb71M2zPX","_d4jqlLFV0y9sA","_ohZeMCzjvzWK1ro","_fnxULEDg","_LuX","_BObivnn"];
player removeAction s_player_unload_zombies;
_7Wyb71M2zPX = _this select 3;
_fnxULEDg    = getPos _7Wyb71M2zPX;
_LuX         = getDir _7Wyb71M2zPX;
player playActionNow "Medic";
sleep DZ_ZOMBIE_TRUCK_LOAD_TIME;

_LuX = _LuX + 45;
if (_LuX > 360) then { _LuX = _LuX - 360; };
_BObivnn = floor(_LuX / 90);

switch (_BObivnn) do {
    case 0: {
        diag_log text "ZOMBIE TRUCK: facing north";
        _fnxULEDg = [_fnxULEDg select 0,( _fnxULEDg select 1) - 8, _fnxULEDg select 2];
    };
    case 1: {
        diag_log text "ZOMBIE TRUCK: facing east";
        _fnxULEDg = [(_fnxULEDg select 0) - 8, _fnxULEDg select 1, _fnxULEDg select 2];
    };
    case 2: {
        diag_log text "ZOMBIE TRUCK: facing south";
        _fnxULEDg = [_fnxULEDg select 0, (_fnxULEDg select 1) + 8, _fnxULEDg select 2];
    };
    case 3: {
        diag_log text "ZOMBIE TRUCK: facing west";
        _fnxULEDg = [(_fnxULEDg select 0) + 8, _fnxULEDg select 1, _fnxULEDg select 2];
    };
};

_d4jqlLFV0y9sA = _7Wyb71M2zPX getVariable["LoadedZombies",0];
if (_d4jqlLFV0y9sA > 0) then {
    _ohZeMCzjvzWK1ro = 0;
    while {_ohZeMCzjvzWK1ro < _d4jqlLFV0y9sA} do {
        [_fnxULEDg,true,DZ_ZOMBIE_TRUCK_ZOMBIE_CLASSES] call unload_zombie_generate;
        _ohZeMCzjvzWK1ro = _ohZeMCzjvzWK1ro + 1;
    };
    _7Wyb71M2zPX setVariable["LoadedZombies",0];
    cutText["You unleash the zombies!","PLAIN DOWN"];
} else {
    cutText["There are no zombies in the truck!","PLAIN DOWN"];
};