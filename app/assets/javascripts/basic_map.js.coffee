class @BasicMapContainer
  constructor: (@selector, @default_layer = 'Mapbox Terrain') ->
    @map = L.mapbox.map(@selector, 'gina-alaska.heb1gpfg')
    @defaultZoom()

    baselayers = {}

    baselayers["Mapbox Terrain"] = L.mapbox.tileLayer('gina-alaska.heb1gpfg')
    
    $.extend(baselayers, Gina.Layers.find('TILE.EPSG::3857.*'))

    @layers_control = L.control.layers(baselayers, [], {
      autoZIndex: true
    }).addTo(@map)

    @map.addLayer(baselayers[@default_layer])
    
    $(document).trigger('map:ready', @)

  defaultZoom: =>
    @map.setView([64.8581, -147.8342], 14)

  addLayer: (layer) =>
    @map.addLayer(layer)
