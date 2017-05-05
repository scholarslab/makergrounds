# Makergrounds map documentation

## uses mapbox with an access token

### mapfiles/makergrounds-map-data.geojson
  * contains coordinate information for map markers (as well as marker styling)
  * the "location-slug" property is used to access data about that location from makergrounds.csv.
  * coordinates are specifically picked to make sure markers do not overlap at the default zoom level.
  * If a new location were to be added, add a feature to this file, including the location-slug and its map coordinates.


### tool-categories.json
  * name, slug, and icon file name for each tool category (which correspond to the map filters)
  * each category has locations that have tools of that category
  * suggestion: this file is the only place that references these categories (makergrounds.csv does not)
  suggestion: more specific tools should fall under these categories, and can be included in the file.
  regarding a "other tools" category: this does not take into account "other tools". adding an "other" category would interfere with the map filter list, which uses this file to generate icons and labels for the filters.

### includes/map.html
  * map (empty div)
  * locations on the right overlaying the map (a list)
      * created by iterating through site.data.makergrounds
      * openPopup(): clicking on a locations on this list opens up the corresponding marker popup
  * map filter (a list)
      created by iterating through site.data.tool-categories (excluding the "show-all" filter)
  * mapbox map is created and markers are added as a "layer" using the geojson file.
  * marker popups
      * title: links to specific location page
      * website: links to external location website
      * icons: shows all categories of tools the location has

### maps.css
  * map
  * locations on the right overlaying the map (a list)
  * map filter (a list)
      * icons and text
  * marker popups
      * title, website, and icons (a list)

### img/icons
  * contains icons used represent the tool categories
  * has 14 icons, (13 + the "show all" icon)
  * file names correspond to slugs for each tool category
  * taken from The Noun Project (creative commons)
  * https://thenounproject.com/jennyxing27/kit/favorites/
  * the woodworking icon couldn't be found anymore on thenounproject for some reason...
  * suggestion: these should also be used in the individual locations' sites once * specific tools are established under each tool category
