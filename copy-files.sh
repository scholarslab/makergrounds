#!/bin/bash

rsync -avz -L --exclude=/.gitignore --delete -e ssh sfm.lib.virginia.edu:/var/www/makergrounds.virginia.edu/app/public/uploads/ images/
rsync -avz -L -e ssh sfm.lib.virginia.edu:/var/www/makergrounds.virginia.edu/app/public/images/ imgs/


curl -o _data/places.json http://sfm.lib.virginia.edu/api/locations/
curl -o _data/people.json http://sfm.lib.virginia.edu/api/people/
curl -o _data/tools.json http://sfm.lib.virginia.edu/api/tools/
curl -o _data/cats-locations.json http://sfm.lib.virginia.edu/api/categories-locations/
