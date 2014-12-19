# MapPost API

[![Build Status](https://travis-ci.org/gina-alaska/map-post.svg?branch=master)](https://travis-ci.org/gina-alaska/map-post)

Application for hosting the map-post api data for the UAF Office of Sustainability

## API Documentation

[General Overview](docs/API_Overview.md)

[Events Geojson Spec](docs/event-geojson-spec.md)

[Events JSON Spec](docs/event-json-spec.md)

[Groups JSON Spec](docs/group-json-spec.md)

## Recent Changes

### 2014-12-19

* added "since" api url paramater for events.{html|json|geojson} endpoint.  It takes a date in the format of YYYY-MM-DD and filters to only return items that have been created or updated since the passed in date.
* Added ability for managers to make individual posts not visible.
* When a group is deleted any associated posts are now deleted as well.
