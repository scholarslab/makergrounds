# Development

## Requireds for Mac Development
- Install Homebrew:
  - https://brew.sh/
  - `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
- Your local computer needs to have Ruby (at least version 2.2.2) and Jekyll (at
  least version 3.0.0)
  - Check the version if already installed
    - `ruby --version`
    - `jekyll --version`
  - Install
    - `brew install ruby`
    - `brew install jekyll`
- Install Git
  - `brew install git`
- A copy of the page generator plugin from https://github.com/avillafiorita/jekyll-datapage_gen
- Bundler
	` gem install bundler`

## Set up
- Clone this repo to your local computer
  ```
  git clone https://github.com/scholarslab/makergrounds.git makergrounds
  ```
- Run 'bundler' to install all of the dependencies
  - `bundle install`

## Preview
- You can preview your changes on the local computer
  ```
  jekyll serve
  ```
  - Then open http://localhost:4000 in your browser

## Publish
- Copy the files from the backend
  - In the terminal, run the script in the "_bin" folder that copies all of the json files and image files "copy-files.sh"
  - `./_bin/copy-server.sh`
- In terminal, run `jekyll build` to generate the static HTML/CSS/Javascript files. They are
  stored in the '_site' folder
- Copy the files from '_site' to the server.
  - In the terminal, run the script in the "_bin" folder that runs an rsync to copy over files and remove unused files from the server, "update-server.sh"
  - `./_bin/update-server.sh`

## Theme
- Theme uses [Start Bootstrap](http://startbootstrap.com/) - [Creative](http://startbootstrap.com/template-overviews/creative/)

