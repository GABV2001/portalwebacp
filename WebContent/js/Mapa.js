(function () {

    var basemaps = {
        Calles: L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }),
        Satelite: L.tileLayer('https://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Tiles style by <a href="https://www.hotosm.org/" target="_blank">Humanitarian OpenStreetMap Team</a> hosted by <a href="https://openstreetmap.fr/" target="_blank">OpenStreetMap France</a>'
        })
    };

    var groups = {
        Arboles: new L.LayerGroup(),
        Sectores: new L.LayerGroup(),
    };

    //Marcadores de Arboles
    L.marker([12.126932040970864, -86.27038300037383]).bindPopup('Árbol Test').addTo(groups.Arboles);
    L.marker([12.126811412639345, -86.27067267894745]).bindPopup('Árbol Test 1').addTo(groups.Arboles);
    L.marker([12.126947775097026, -86.27054393291472]).bindPopup('Árbol Test 2').addTo(groups.Arboles);
    L.marker([12.127052669247792, -86.27022743225098,]).bindPopup('Árbol Test 3').addTo(groups.Arboles);
    L.marker([12.126816657350542, -86.27015233039856]).bindPopup('Árbol Test 4').addTo(groups.Arboles);
    L.marker([12.126973998638585, -86.27022743225098]).bindPopup('Árbol Test 5').addTo(groups.Arboles);
    L.marker([12.126842880905002, -86.27052247524261]).bindPopup('Árbol Test 6').addTo(groups.Arboles);
    L.marker([12.126837636194313, -86.27036154270172]).bindPopup('Árbol Test 7').addTo(groups.Arboles);
    L.marker([12.126842880905002, -86.27052247524261]).bindPopup('Árbol Test 8').addTo(groups.Arboles);
    L.marker([12.126832391483536, -86.27024352550505]).bindPopup('Árbol Test 9').addTo(groups.Arboles);
    L.marker([12.12697924334659, -86.27045273780823]).bindPopup('Árbol Test 10').addTo(groups.Arboles);


    //Geometria Poligonos Sectores
    L.polygon([
        [12.12674224800075, -86.27073604613543],
        [12.126753720809331, -86.27064853906631],
        [12.126908439779847, -86.27065625041723],
        [12.12674224800075, -86.27073604613543]
    ]).addTo(groups.Sectores);

    //Sector 1
    L.polygon([
        [12.127019562035922, -86.2706009298563],
        [12.126909423162852, -86.27065557986498],
        [12.126920240375616, -86.27047285437584],
        [12.127053980424424, -86.27048525959253],
        [12.127019562035922, -86.2706009298563]
    ]).addTo(groups.Sectores);



    window.Mapa = {
        LayerGroups: groups,
        Basemaps: basemaps
    };

}());
