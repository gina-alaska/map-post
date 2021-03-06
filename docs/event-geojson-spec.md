# Event GeoJSON Spec

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in RFC 2119.

Implementations MUST treat unknown keys as if they weren't present. However, implementations MUST expose unknown key/values in their API so that API users can optionally handle these keys. Implementations MUST treat invalid values for keys as if they weren't present.

GeoJSON resources will conform to the GeoJSON spec outlined here: http://geojson.org/geojson-spec.html

Property attributes conform to the [Event JSON Spec](event-json-spec.md), some additional fields have been added

## GeoJSON Properties Attributes

**url** *URL* - Url to the geojson api resource endpoint for the event

**group** *Hash* - Includes inline information about the group the event belongs to, attributes conform to the [group json spec](group-json-spec.md)

## Example

Request URL:

    http://map-post.127.0.0.1.xip.io/events/4.json?visible_only=1

Response Body:

    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [-147.84945487976074, 64.85933165134932]
      },
      "properties": {
        "id": 4,
        "title": "Party time!",
        "description": "Testing",
        "starts_at": "2014-07-30T11:10:00.000-08:00",
        "ends_at": "2014-07-31T11:10:00.000-08:00",
        "created_at": "2014-07-15T11:10:47.388-08:00",
        "updated_at": "2014-07-15T11:59:31.580-08:00",
        "address_1": "Wood Center",
        "address_2": "University of Alaska Fairbanks",
        "visible": true,
        "group_id": 1,
        "group_url": "http://map-post.127.0.0.1.xip.io/groups/1.json",
        "group": {
          "id": 1,
          "name": "Geographic Information Network of Alaska",
          "acronym": "GINA",
          "url": "http://map-post.127.0.0.1.xip.io/groups/1.json"
        }
      }
    }
