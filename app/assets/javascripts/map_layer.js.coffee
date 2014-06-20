class @MapLayer
  constructor: ->
    # @autoZoom()
    
  @fromConfig: (config) ->
    switch config.type
      when 'wms'
        layer = new WMSLayer(config)
      when 'geojson'
        layer = new GeoJSONLayer(config)
        
    layer
  
  addTo: (map) =>
    @layer.addTo(map)
    @layer.bringToFront()
    
  removeFrom: (map) =>
    map.removeLayer(@layer)