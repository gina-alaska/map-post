# Event JSON Spec

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in RFC 2119.

Implementations MUST treat unknown keys as if they weren't present. However, implementations MUST expose unknown key/values in their API so that API users can optionally handle these keys. Implementations MUST treat invalid values for keys as if they weren't present.

## Attributes

**id** *Integer* - internal id of a specific event

**title** *String* - title of the event

**description** *String* - short description of the event

**location** *Hash* - the location information for the event

**starts_at** *Datetime (ISO8601)* - date and time when the event starts

**ends_at** *Datetime (ISO8601)* - date and time when the event ends

**event_at** *Datetime (ISO8601)* - ***DEPRECATED*** - date when the event will occur

**group_id** *Integer* - id of the group the event belongs to

**group_url** *URL* - url to the api end point that the event belongs to

## Example

    {
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
      "group_id": 1,
      "group_url": "http://mappost-api.herokuapp.com/groups/1.json",
      "url": "http://mappost-api.herokuapp.com/events/4.json"
    }