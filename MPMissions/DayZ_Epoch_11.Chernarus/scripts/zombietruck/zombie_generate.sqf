private ["_pos","_tQr9Tj9V","_zombieAmount","_0rSb","_pt2jp","_theZombie","_q5kP","_sEF1E7","_6wsS38","_pos1","_pos2","_VRFqlNm6","_H8u"];
_pos =     _this select 0;
_tQr9Tj9V =     _this select 1;
_zombieAmount =    _this select 2;

_0rSb =     "";
_pt2jp =    [];
_theZombie =    objNull;

if (count _zombieAmount == 0) then {
    _zombieAmount =    []+ getArray (configFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass");
};

_q5kP     = _zombieAmount call BIS_fnc_selectRandom;
_sEF1E7   = 15;
_6wsS38   = "FORM";
_theZombie    = createAgent [_q5kP, _pos, [], _sEF1E7, _6wsS38];

PVDZE_zed_Spawn = [_theZombie];
publicVariableServer "PVDZE_zed_Spawn";

if (_tQr9Tj9V) then {
    _theZombie setDir round(random 180);
    _theZombie setPosATL _pos;
    _theZombie setvelocity [0, 0, 1];
} else {
    _theZombie setVariable ["doLoiter",false,true];
};

dayz_spawnZombies = dayz_spawnZombies + 1;

_pos = getPosATL _theZombie;
if (random 1 > 0.7) then {
    _theZombie setUnitPos "Middle";
};

if (isNull _theZombie) exitWith {
    dayz_spawnZombies = dayz_spawnZombies - 1;
};

_pos1 = getPosATL _theZombie;
_pos2 = getPosATL _theZombie;
_theZombie setVariable ["myDest",_pos1];
_theZombie setVariable ["newDest",_pos2];

_H8u = random 1;
if (_H8u > 0.3) then {
    _VRFqlNm6 =         configFile >> "CfgVehicles" >> _q5kP >> "zombieLoot";
    if (isText _VRFqlNm6) then {
        _pt2jp = []+ getArray (configFile >> "cfgLoot" >> getText(_VRFqlNm6));
        if (count _pt2jp > 0) then {
            _0rSb = _pt2jp call BIS_fnc_selectRandomWeighted;
            if(!isNil "_pt2jp") then {
                _theZombie addMagazine _0rSb;
            };
        };
    };
};

//Start behavior
[_pos,_theZombie] execFSM "\z\AddOns\dayz_code\system\zombie_agent.fsm";