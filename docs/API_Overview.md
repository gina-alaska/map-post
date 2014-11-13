# Available Endpoints

## Events /entries.{json|geojson}

Events are the primary data element for the application.  They are a record of a time and place for when meetings or other gatherings will occur.  

This endpoint will return an array of event items.  For more information about events please see [the event json spec](event-json-spec.md)

### Parameters  

_None_

### Example JSON Request

Request URL:

    http://mappost-api.herokuapp.com/events.json

Response Body:

    [{
      "id": 4,
      "title": "Party time!",
      "description": "Testing",
      "location": {
        "type": "Point",
        "coordinates": [-147.84945487976074, 64.85933165134932]
      },
      "event_at": "2014-07-30T11:10:00.000-08:00",
      "created_at": "2014-07-15T11:10:47.388-08:00",
      "updated_at": "2014-07-15T11:16:27.004-08:00",
      "address_1": "Wood Center",
      "address_2": "University of Alaska Fairbanks",
      "group_id": 1,
      "group_url": "http://mappost-api.herokuapp.com/groups/1.json",
      "url": "http://mappost-api.herokuapp.com/events/4.json"
    }]

### Example GeoJSON Request

For documentation about GeoJSON responses please see: http://geojson.org/geojson-spec.html

Request URL:

    http://mappost-api.herokuapp.com/events.geojson

Response Body:

    {
      "type": "FeatureCollection",
      "features": [{
        "type": "Feature",
        "geometry": {
          "type": "Point",
          "coordinates": [-147.84945487976074, 64.85933165134932]
        },
        "properties": {
          "id": 4,
          "url": "http://map-post.127.0.0.1.xip.io/events/4.json",
          "title": "Party time!",
          "description": "Testing",
          "event_at": "2014-07-30T11:10:00.000-08:00",
          "address_1": "Wood Center",
          "address_2": "University of Alaska Fairbanks",
          "group": {
            "id": 1,
            "name": "Geographic Information Network of Alaska",
            "acronym": "GINA",
            "url": "http://map-post.127.0.0.1.xip.io/groups/1.json"
          }
        }
      }]
    }

## Groups /groups.json

Groups are organizations that can be assigned to events and are usually responsible for organizing an event.
There are two flags that can be set for groups restricted and visible.  

_Restricted:_ Restricted groups can only be assigned to events by an admin or a user who is marked as a manager of the group.

_Visible:_ By default all groups are marked as visible and will be returned by the api.  If a group is changed to have visible == false then they will not be selectable when creating a new event.


This endpoint will return an array of group items.  For more information about events please see [the group json spec](group-json-spec.md)

### Example JSON Request

Request URL:

    http://mappost-api.herokuapp.com/groups.json

Response Body:

    [{
      "name": "Geographic Information Network of Alaska",
      "description": "Testing 123",
      "restricted": false,
      "visible": true,
      "created_at": "2014-06-10T10:14:56.004-08:00",
      "updated_at": "2014-06-10T10:22:08.275-08:00",
      "url": "http://mappost-api.herokuapp.com/groups/1.json"
    }]
