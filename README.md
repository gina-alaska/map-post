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

* Added new since (Date: YYYY-MM-DD) api param for events.{html|json|geojson}.  When added to the url only posts that have been created or updated since the passed in date will be returned.
* Added ability for managers to make individual posts not visible.
* When a group is deleted any associated posts are now deleted as well.