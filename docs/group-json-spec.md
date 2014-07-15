# Group JSON Spec

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in RFC 2119.

Implementations MUST treat unknown keys as if they weren't present. However, implementations MUST expose unknown key/values in their API so that API users can optionally handle these keys. Implementations MUST treat invalid values for keys as if they weren't present.

## Attributes

**id** *Integer* - internal id of a specific event

**name** *String* - name of the group

**description** *String* - short description of the group

**restricted** *Boolean* - true if the group is not available for public users, false otherwise

**visible** *Boolean* - true if the group is visible for users to select for events, false otherwise

**created_at_** *Datetime (ISO8601)* - date and time when the group was created

**updated_at_** *Datetime (ISO8601)* - date and time when the group was last updated

**url** *URL* - a url to the group api resource endpoint

## Example

    {
      "id": 1,
      "name": "Geographic Information Network of Alaska",
      "description": "Testing 123",
      "restricted": false,
      "visible": true,
      "created_at": "2014-06-10T10:14:56.004-08:00",
      "updated_at": "2014-06-10T10:22:08.275-08:00",
      "url": "http://map-post.127.0.0.1.xip.io/groups/1.json"
    }