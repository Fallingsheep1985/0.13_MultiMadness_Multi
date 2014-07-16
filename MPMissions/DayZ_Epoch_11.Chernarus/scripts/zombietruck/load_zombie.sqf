private ["_8NT31bAOVzOuD","_AHsoThPSnba","_Fw9mkr9tYzYYK"];
player removeAction s_player_load_zombie;
_8NT31bAOVzOuD = _this select 3 select 0;
_AHsoThPSnba   = _this select 3 select 1;
player playActionNow "Medic";
sleep DZ_ZOMBIE_TRUCK_LOAD_TIME;
if (alive _8NT31bAOVzOuD) then {
    {
        _8NT31bAOVzOuD removeAllEventHandlers _x;
    } forEach ["fired","firednear","dammaged","hit","killed","mphit","mpkilled"];
    _8NT31bAOVzOuD setDamage 1;
    deleteVehicle _8NT31bAOVzOuD;
    _Fw9mkr9tYzYYK = _AHsoThPSnba getVariable["LoadedZombies",0];
    _Fw9mkr9tYzYYK = _Fw9mkr9tYzYYK + 1;
    _AHsoThPSnba setVariable["LoadedZombies",_Fw9mkr9tYzYYK];
    cutText[format["This truck is now holding %1 zombies!",_Fw9mkr9tYzYYK],"PLAIN DOWN"];
} else {
    cutText["The zombie must be alive to load it!","PLAIN DOWN"];
};