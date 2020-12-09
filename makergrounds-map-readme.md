# Makergrounds map documentation

## uses mapbox with an access token (generated from Ammon's ammon.uva@gmail.com mapbox account, but any token should suffice.)

### mapfiles/makergrounds-map-data.geojson

- contains coordinate information for map markers (as well as marker styling)
- the "location-slug" property is used to access data about that location from makergrounds.csv.
- coordinates are specifically picked to make sure markers do not overlap at the default zoom level.
- If a new location were to be added, add a feature to this file, including the location-slug and its map coordinates.

### tool-categories.json

- name, slug, and icon file name for each tool category (which correspond to the map filters)
- each category has locations that have tools of that category
- suggestion: this file is the only place that references these categories (makergrounds.csv does not)
  suggestion: more specific tools should fall under these categories, and can be included in the file.
  regarding a "other tools" category: this does not take into account "other tools". adding an "other" category would interfere with the map filter list, which uses this file to generate icons and labels for the filters.

### includes/map.html

- map (empty div)
- locations on the right overlaying the map (a list)
  - created by iterating through site.data.makergrounds
  - openPopup(): clicking on a locations on this list opens up the corresponding marker popup
- map filter (a list)
  created by iterating through site.data.tool-categories (excluding the "show-all" filter)
- mapbox map is created and markers are added as a "layer" using the geojson file.
- marker popups
  - title: links to specific location page
  - website: links to external location website
  - icons: shows all categories of tools the location has

### maps.css

- map
- locations on the right overlaying the map (a list)
- map filter (a list)
  - icons and text
- marker popups
  - title, website, and icons (a list)

### img/icons

- contains icons used represent the tool categories
- has 14 icons, (13 + the "show all" icon)
- file names correspond to slugs for each tool category
- taken from The Noun Project (creative commons)
- https://thenounproject.com/jennyxing27/kit/favorites/
- suggestion: these should also be used in the individual locations' sites once \* specific tools are established under each tool category
- icons:
  - 3D printing: 3D Printing, Andrew Cameron, https://thenounproject.com/term/3d-printing/62251
  - 3D scanning: 3D Scanner, Arthur Schmitt, https://thenounproject.com/term/3d-scanner/18158
  - casting: Casting, Jasmine Rae Friedrich, https://thenounproject.com/term/casting/10773
  - cnc cutting: CNC Milling Machine, Toke Frello, https://thenounproject.com/term/cnc-milling-machine/189666
  - computer + software: Computer, Aleksandr Vector, https://thenounproject.com/term/computer/997804
  - drone: Drone Camera, Adrien Croquet, https://thenounproject.com/term/drone-camera/1177292
  - electronics: Circuit Board, Hea Poh Lin, https://thenounproject.com/term/circuit-board/585905
  - laser cutter: Laser Cutter, Toke Frello, https://thenounproject.com/term/laser-cutter/190353/
  - material + data archive: Archive, Rockicon, https://thenounproject.com/term/archive/989776
  - metalworking: Anvil, Pedro Ivo Hudson, https://thenounproject.com/term/anvil/3891
  - recording: Slider, Hea Poh Lin, https://thenounproject.com/term/slider/668941
  - robot arm: Robot, Dylan Thompson, https://thenounproject.com/term/robot/24952/
  - virtual-reality: VR Cardboard, Vaibhav Radhakrishnan, https://thenounproject.com/term/vr-cardboard/551703/
  - woodcutting: Saw Blade, Liane Kirschner, https://thenounproject.com/liane/uploads/?i=164988
