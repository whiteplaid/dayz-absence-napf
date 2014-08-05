// Minor mission marker
while{MissionGoMinor == 1} do { //refresh marker script by *hs-s.com | waTTe - www.banditparty.de
    _MainMarker75 = createMarker["MainMarker75", MCoords];
    _MainMarker75 setmarkertext missiontext75;
    _MainMarker75 setMarkerColor "ColorRed";    // Set color of marker
    _MainMarker75 setMarkerShape "ELLIPSE";        // Set shape of marker
    _MainMarker75 setMarkerBrush "Grid";        // Set style of marker
    _MainMarker75 setMarkerAlpha 0.75;        // Set transparency of marker
    _MainMarker75 setMarkerSize [150,150];        // Set size of marker
    
    	_markertext75 = createmarker ["markertext75", MCoords];
	_markertext75 setmarkertext missiontext75;
	_markertext75 setmarkercolor "colorblue";
	_markertext75 setmarkershape "icon";
	_markertext75 setMarkerBrush "Solid";
	_markertext75 setmarkertype "dot";
	_markertext75 setmarkersize [1,1];
sleep 25;
    deleteMarker _MainMarker75;
    deletemarker _markertext75;
};
