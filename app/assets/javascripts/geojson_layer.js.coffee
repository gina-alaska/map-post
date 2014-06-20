class @GeoJSONLayer extends @MapLayer
  constructor: (@config) ->
    @config.style = $.extend({
      "marker-color": '#00f',
      "marker-symbol": 'star'
    }, @config.style)
    
    @layer = L.mapbox.featureLayer(@config.url)
    @setStyle()
    super()

  setStyle: =>
    @layer.on 'ready', () =>
      @layer.eachLayer (l) =>    
        if l.setIcon?
          l.setIcon(L.divIcon({
            className: 'custom-marker',
            iconSize: [20, 20],
            iconAnchor: [10, 10],
            html: "<div class=\"custom-marker-wrapper\">
                    <div class=\"icon\" style=\"color: " + (@styleProps('marker-color', l.feature.properties)) + "\">
                      <i class=\"fa fa-" + (@styleProps('marker-symbol', l.feature.properties)) + "\"></i>
                    </div> 
                  </div>"
          })); 
        
        if @config.popup? and @config.popup != '' and @config.options.clickable != 'no'
          l.bindPopup(L.mapbox.template(@config.popup, l.feature.properties), {
            maxWidth: 500
          });
        
  styleProps: (name, attrs) =>
    if attrs[name]? and attrs[name] != ''
      attrs[name]
    else
      @config.style[name]