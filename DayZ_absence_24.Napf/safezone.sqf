Private ["_EH_Fired", "_skip", "_ip", "_ct", "_Backpack_AllowFriendlyTaggedAccess", "_if"];

if (isNil "inSafezone") then {
    inSafezone = false;
};

while {true} do {
    waitUntil { inSafeZone };
    titleText [format["Entering Trader Area - God Mode Enabled"],"PLAIN DOWN"]; titleFadeOut 4;

    waitUntil { player == vehicle player };
{
	_x allowDammage false;
} foreach entities "AllVehicles";
    thePlayer = vehicle player;
    _EH_Fired = player addEventHandler ["Fired", {
	    deleteVehicle (_this select 6);
        titleText ["You can not fire your weapon in a Trader City Area","PLAIN DOWN"]; titleFadeOut 4;
        NearestObject [_this select 0,_this select 4] setPos[0,0,0];
    }];

    player_zombieCheck = {};
    fnc_usec_damageHandler = {};
    thePlayer removeAllEventHandlers "handleDamage";
    thePlayer addEventHandler ["handleDamage", {false}];
    thePlayer allowDamage false;
//_Backpack_AllowFriendlyTaggedAccess = true;
//_skip = false;
//if ( _ip ) then {
//						_ctOwnerID = _ct getVariable["CharacterID","0"];
//						_friendlies	= player getVariable ["friendlyTo",[]];
//						if(_ctOwnerID in _friendlies) then {	
//							if ( _Backpack_AllowFriendlyTaggedAccess ) then
//							{
//								_if = true;
//							};
//						};
//					};
//					
//					
//					//Is player friendly?
//					if ( _if ) then { _skip = true; };
//				//};

//if ( _skip && _if ) then {
//systemChat ("This player is tagged friendly, you have access to this players bag");
//};
    waitUntil { !inSafeZone };

    titleText [format["Exiting Trader Area - God Mode Disabled"],"PLAIN DOWN"]; titleFadeOut 4;
    thePlayer removeEventHandler ["Fired", _EH_Fired];
	{
	_x allowDammage true;
} foreach entities "AllVehicles";
    player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
    fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
    player addEventHandler ["handleDamage", {true}];
    player removeAllEventHandlers "handleDamage";
    player allowDamage true;
};

	
