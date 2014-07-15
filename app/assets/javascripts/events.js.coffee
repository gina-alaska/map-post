# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class @EventEditor
  constructor: (map_container, config) ->
    @layer = L.featureGroup()
    @setup(map_container, config)
    @map_container.addLayer(@layer)
    
  setup: (@map_container, @config) =>
    marker = @build_marker()
    @layer.addLayer(marker)
    @map_container.map.setView(marker.getLatLng())
    
  build_marker: =>
    lat = $(@config.lat).val()
    lng = $(@config.lng).val()
    
    if lat? and lng? and lat != '0.0' and lng != '0.0'
      location = [lat,lng]
    else
      location = @map_container.map.getBounds().getCenter()
    
    marker = L.marker(location, {
      draggable: @config.editable
    })
    
    if @config.editable
      marker.bindPopup("Drag me to the event location")
      marker.on('dragend', @update_event_location)    
      marker.on 'add', ->
        this.openPopup()
      
    @update_event_location({ target: marker })
    marker
    
  clear: =>
    @layer.clearLayers()
    
  update_event_location: (e) =>
    location = e.target.getLatLng()
    $(@config.lat).val(location.lat)
    $(@config.lng).val(location.lng)