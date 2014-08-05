///////////////////////////////////////////////////////////////////////////
/// Styles
///////////////////////////////////////////////////////////////////////////

// Control types

class RscTextT
{
	access = 0;
	type = 0;
	idc = -1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {0.8784,0.8471,0.651,1};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0;
	shadow = 2;
	font = "Zeppelin32";
	SizeEx = 0.03921;
};
class RscListBox
{
	access = 0;
	type = 5;
	w = 0.4;
	h = 0.4;
	rowHeight = 0;
	colorText[] = {0.8784,0.8471,0.651,1};
	colorScrollbar[] = {0.95,0.95,0.95,1};
	colorSelect[] = {0.95,0.95,0.95,1};
	colorSelect2[] = {0.95,0.95,0.95,1};
	colorSelectBackground[] = {0,0,0,1};
	colorSelectBackground2[] = {0.8784,0.8471,0.651,1};
	colorBackground[] = {0,0,0,1};
	soundSelect[] = {"",0.1,1};
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	class ScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		shadow = 0;
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
	style = 16;
	font = "Zeppelin32";
	shadow = 2;
	sizeEx = 0.03921;
	color[] = {1,1,1,1};
	period = 1.2;
	maxHistoryDelay = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
};
class AdminDialog
{
	idd = -1;
	movingenable = 0;

	class Controls {
		class RscText_1000: RscTextT
		{
			idc = 1000;
			x = 0.283646 * safezoneW + safezoneX;
			y = 0.22492 * safezoneH + safezoneY;
			w = 0.432709 * safezoneW;
			h = 0.55016 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: RscTextT
		{
			idc = 1001;
			text = "Pick a vehicle or select a category";
			x = 0.295498 * safezoneW + safezoneX;
			y = 0.235917 * safezoneH + safezoneY;
			w = 0.170212 * safezoneW;
			h = 0.0166935 * safezoneH;
		};
		class RscListbox_1500: RscListbox
		{
			idc = 13000;
			x = 0.290407 * safezoneW + safezoneX;
			y = 0.268674 * safezoneH + safezoneY;
			w = 0.419186 * safezoneW;
			h = 0.447636 * safezoneH;
		};
		class RscShortcutButton_1700: RscShortcutButton
		{
			idc = -1;
			text = "Temp";
			x = 0.297168 * safezoneW + safezoneX;
			y = 0.720556 * safezoneH + safezoneY;
			w = 0.0651391 * safezoneW;
			h = 0.0590864 * safezoneH;
			onButtonClick = "TempDialogSelected = (lbCurSel 13000); ((ctrlParent (_this select 0)) closeDisplay 9000);";
		};
		class RscShortcutButton_1701: RscShortcutButton
		{
			idc = -1;
			text = "Perm";
			x = 0.37154 * safezoneW + safezoneX;
			y = 0.720556 * safezoneH + safezoneY;
			w = 0.0651391 * safezoneW;
			h = 0.0590864 * safezoneH;
			onButtonClick = "PermDialogSelected = (lbCurSel 13000); ((ctrlParent (_this select 0)) closeDisplay 9000);";
		};
		class RscShortcutButton_1702: RscShortcutButton
		{
			idc = 12004;
			text = "Air";
			x = 0.485168 * safezoneW + safezoneX;
			y = 0.218000 * safezoneH + safezoneY;
			w = 0.0651391 * safezoneW;
			h = 0.0590864 * safezoneH;
			onButtonClick="[""Air""] call LoadSpecificList;";
		};
		class RscShortcutButton_1704: RscShortcutButton
		{
			idc = 12005;
			text = "Land";
			x = 0.55954 * safezoneW + safezoneX;
			y = 0.218000 * safezoneH + safezoneY;
			w = 0.0651391 * safezoneW;
			h = 0.0590864 * safezoneH;
			onButtonClick="[""LandVehicle""] call LoadSpecificList;";
		};
		class RscShortcutButton_1705: RscShortcutButton
		{
			idc = 12006;
			text = "Sea";
			x = 0.633912 * safezoneW + safezoneX;
			y = 0.218000 * safezoneH + safezoneY;
			w = 0.0651391 * safezoneW;
			h = 0.0590864 * safezoneH;
			onButtonClick="[""Ship""] call LoadSpecificList;";
		};
		class RscShortcutButton_1710: RscShortcutButton
		{
			idc = -1;
			text = "Close";
			x = 0.633912 * safezoneW + safezoneX;
			y = 0.720556 * safezoneH + safezoneY;
			w = 0.0651391 * safezoneW;
			h = 0.0590864 * safezoneH;
			onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 9000);";
		};
	};
};