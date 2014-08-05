/*	
	For DayZ Epoch
	Addons Credits: Jetski Yanahui by Kol9yN, Zakat, Gerasimow9, YuraPetrov, zGuba, A.Karagod, IceBreakr, Sahbazz
*/
startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];
private ["_a","_b"];

GL4_Path = "\z\addons\dayz_code\modules\GL4_System\";

[] spawn
{
	waitUntil { !(isNil "GL4_Core") };
	call compile preProcessFile "\z\addons\dayz_code\modules\GL4_Settings\GL4_Core.sqf";

	waitUntil { !(isNil "GL4_Global") };
	call compile preProcessFile "\z\addons\dayz_code\modules\GL4_Settings\GL4_Global.sqf";

	waitUntil { !(isNil "GL4_Local") };
	call compile preProcessFile "\z\addons\dayz_code\modules\GL4_Settings\GL4_Local.sqf";
};

if (isServer) then
{
	_a = allUnits;

	{if ( { (isPlayer _x) } count (units _x) > 0) exitWith {_b = (vehicle _x) } } forEach _a;

	[_b] execVM (GL4_Path+"GL4_System.sqf");
}
else
{
	waitUntil { (player == player) };

	if (player == player) then
	{
		_a = allUnits;

		{if ( { (isPlayer _x) } count (units _x) > 0) exitWith {_b = (vehicle _x) } } forEach _a;

		[_b] execVM (GL4_Path+"GL4_System.sqf");
	};
};

if !(isDedicated) then {
	_nul = [] execVM "\z\addons\dayz_code\scripts\menuSetup.sqf";
};	
//REALLY IMPORTANT VALUES
dayZ_instance =	24;				//The instance
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;
dayZ_serverName = "AAS";
//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
//disable radio messages to be heard and shown in the left lower corner of the screen
enableRadio false;
// May prevent "how are you civillian?" messages from NPC
enableSentences false;

// DayZ Epochconfig
spawnShoremode = 1; // Default = 1 (on shore)
spawnArea= 1500; // Default = 1500
// 
MaxVehicleLimit = 300; // Default = 50
MaxDynamicDebris = 500; // Default = 100
dayz_MapArea = 18000; // Default = 10000

dayz_minpos = -1000; 
dayz_maxpos = 26000;

dayz_paraSpawn = true;

dayz_sellDistance_vehicle = 10;
dayz_sellDistance_boat = 30;
dayz_sellDistance_air = 40;

dayz_maxAnimals = 5; // Default: 8
dayz_tameDogs = true;
DynamicVehicleDamageLow = 0; // Default: 0
DynamicVehicleDamageHigh = 100; // Default: 100
DefaultMagazines = ["ItemBandage","ItemPainkiller","HandRoadFlare"]; 
DefaultWeapons = []; 
DefaultBackpack = ""; 
DefaultBackpackWeapon = "";

DZE_BuildOnRoads = true; // Default: False

EpochEvents = [["any","any","any","any",30,"crash_spawner"],["any","any","any","any",0,"crash_spawner"],["any","any","any","any",15,"supply_drop"]];
dayz_fullMoonNights = true;

//Load in compiled functions
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";				//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\randomloot.sqf";
call compile preprocessFileLineNumbers "\z\addons\dayz_code\randommilbases.sqf";
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";				//Compile regular functions
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\server_traders.sqf";				//Compile trader configs
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
	//Compile vehicle configs
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_24.Napf\dynamic_vehicle.sqf";				
	// Add trader citys
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_24.Napf\mission.sqf";

	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};

if (!isDedicated) then {
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";	
	
	if (!isNil "dayZ_serverName") then {
	[] spawn {
		waitUntil {(!isNull Player) and (alive Player) and (player == player)};
		waituntil {!(isNull (findDisplay 46))};
		5 cutRsc ["wm_disp","PLAIN"];
		((uiNamespace getVariable "wm_disp") displayCtrl 1) ctrlSetText dayZ_serverName;
	};
};
	
	//anti Hack
	if (!isserver) then {
	[] execVM "admintools\AdminList.sqf";
	adminlist = ["76561197992234387","4897670","2677764"];
	modlist = ["76561197992234387","4897670","2677764"];
if ( !((getPlayerUID player) in AdminList) && !((getPlayerUID player) in ModList) && !((getPlayerUID player) in tempList)) then 
{
    [] execVM "\z\addons\dayz_code\system\antihack.sqf";
};
};
/*SET BULLET WIND CONDITIONS*/
waitUntil {(!isNull player)};
	script = [] execVM "\z\addons\dayz_code\ACE\bwind.sqf";

/*---------
| STAMINA | - Stamina Debug & Modifier scripts added by OG
---------*/
/*
waitUntil {(!isNull player)};
	script = [] execVM "ACE\stamina\stamina.sqf";
Private["_actionIndex"];
if (isNil "ACE_SYS_STAMINA_DEBUG") then {ACE_SYS_STAMINA_DEBUG = True};
_actionIndex = [["Toggle Stamina Debug Display", "ACE\stamina\StaminaDebug.sqf"]] call CBA_fnc_addPlayerAction;
*/

/*----------------------
| ACE FUNCTION DISABLE | - Disable names and weapon storing for aircraft -- MaC
----------------------*/

if (isServer) then {
ace_sys_tracking_markers_enabled = false;
publicVariable "ace_sys_tracking_markers_enabled"
}; 

if (isServer) then {
ace_sys_eject_fnc_weaponcheck = false;
publicVariable "ace_sys_eject_fnc_weaponcheck"
}; 

if (isServer) then {
ACE_NO_RECOGNIZE = true; 
publicVariable "ACE_NO_RECOGNIZE"
};

if (isServer) then {
ace_sys_wind_deflection_force_drift_on = true;
publicVariable "ace_sys_wind_deflection_force_drift_on"
}; 
if (!isDedicated) then {
	[] execVM "admintools\Activate.sqf";
[] execVM "playerstats\j0k3r5_stats.sqf";
_nul = [] execVM "DZAI_Client\dzai_initclient.sqf";
};
// Mission System Markers [thx to inkko]
if (!isServer) then {
	
    If (!isnil ("Ccoords")) then {
    [] execVM "debug\addmarkers.sqf";
    };
If (!isnil ("MCoords")) then {
    [] execVM "debug\addmarkers75.sqf";
    };
    };
	//Lights
	//[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
};
#include "\z\addons\dayz_code\system\REsec.sqf"
//Start Dynamic Weather
execVM "\z\addons\dayz_code\external\DynamicWeatherEffects.sqf";
[] execVM "\z\addons\dayz_code\scripts\track.gooncorp.sqf";
[] execVM "\z\addons\dayz_code\particles\particle2.gooncorp.sqf";
#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"

[] execVM "safezone.sqf";
private ["_display","_btnRespawn","_btnAbort","_timeOut","_timeMax","_btnAbortText"];
disableSerialization;
waitUntil {!(isNull (finddisplay 49))};
_btnRespawn = _display displayCtrl 1010;
_btnAbort = ((findDisplay 49) displayCtrl 104);
_btnRespawn ctrlEnable false;
_btnAbort ctrlEnable false;
_btnAbortText = ctrlText ((findDisplay 49) displayCtrl 104);
_timeOut = 0;
_timeMax = diag_tickTime+10;
dayz_lastCheckBit = time;
		
// if(r_player_dead) exitWith {_btnAbort ctrlEnable true;};
if(r_fracture_legs && !r_player_dead) then {_btnRespawn ctrlEnable true;};
		
//force gear save
if (!r_player_dead and time - dayz_lastCheckBit > 10) then {
	call dayz_forceSave;
};			
		
_sleep = 1;
		


while {true} do {
	waitUntil {!(isNull (findDisplay 49))};
//				((findDisplay 49) displayCtrl 104) ctrlEnable true;
//			((findDisplay 49) displayCtrl 104) ctrlSetText _btnAbortText;
//			cutText ["", "PLAIN DOWN"];	
//			_sleep = 1;
	if (!(isnull (finddisplay 49))) then {
		if (!r_player_dead and {isPlayer _x} count (player nearEntities ["AllVehicles", 12]) > 1) then {
			((findDisplay 49) displayCtrl 104) ctrlEnable false;
			cutText [localize "str_abort_playerclose", "PLAIN DOWN"];
			_sleep = 1;
		};
		if(!r_player_dead and !canbuild) then {
			((findDisplay 49) displayCtrl 104) ctrlEnable false;
			cutText [(localize "str_epoch_player_12"), "PLAIN DOWN"];
			_sleep = 1;
		};
		if (!r_player_dead and player getVariable["combattimeout", 0] >= time) then {
			((findDisplay 49) displayCtrl 104) ctrlEnable false;
			//cutText ["Cannot Abort while in combat!", "PLAIN DOWN"];
			cutText [localize "str_abort_playerincombat", "PLAIN DOWN"];
			_sleep = 1;
		};
		if (_timeOut < _timeMax) then {
			((findDisplay 49) displayCtrl 104) ctrlEnable false;
			((findDisplay 49) displayCtrl 104) ctrlSetText format["%1 (in %2)", _btnAbortText, (ceil ((_timeMax - diag_tickTime)*10)/10)];
			cutText ["", "PLAIN DOWN"];	
			_sleep = 0.1;
		};

	};
	sleep _sleep;
	_timeOut = diag_tickTime;
};
cutText ["", "PLAIN DOWN"];
