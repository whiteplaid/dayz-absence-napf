/*
	FUNCTION COMPILES
*/
//Player only
if (!isDedicated) then {

	// trader menu code
	if (DZE_ConfigTrader) then {
		call compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_traderMenuConfig.sqf";
	}else{
		//call compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_traderMenuHive.sqf";
		call compile preprocessFileLineNumbers "custom\traders_skipAn\player_traderMenuHive.sqf";
	};

};

initialized = true;