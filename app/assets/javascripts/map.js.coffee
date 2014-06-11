# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# 
$(document).on 'ready page:load', ->
  if $('#map').length > 0
    container = new BasicMapContainer('map')
    $('#map').data('container', container)
    
    
    if $('#map').data('hash')
      setTimeout => 
        hash = new L.Hash(container.map)
      , 100