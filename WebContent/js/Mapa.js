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
