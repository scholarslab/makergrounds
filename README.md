# MakerGrounds website

## Quick list of steps to make changes to the website
- make a copy of the repo.
- make the changes
- check your changes locally (run `bundle exec jekyll serve`).
  - view your changes in the browser at http://localhost:4000
- If changes are good, run `bundle exec jekyll build`
- copy files in `_site` to corgi server.


## Where's stuff at?
- Most of the home page is sectioned out into files in the `_includes` folder.
- Design stuff is in the `css` and `layouts` folders
- Data for each space on its location page is in the `_data/places.json` file
- Data for the people section on the home page is in `_data/people.json`


# Development

## Requirements for Mac Development
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
  - `cd makergrounds`
  - `bundle install`

## Preview
- You can preview your changes on the local computer
  ```
  jekyll serve
  ```
  - Then open http://localhost:4000 in your browser

## Publish
- In terminal, run `jekyll build` to generate the static HTML/CSS/Javascript files. They are
  stored in the '_site' folder.
  - Note: if you copy the files after running `jekyll serve` then all of the
    links are hardcoded to use 'localhost' instead of the site url. Therefore,
    you should definitely run `jekyll build` before copying files to the
    server.
- Copy the files from '_site' to the server.
  - In the terminal, run the script in the "_bin" folder that runs an rsync to copy over files and remove unused files from the server, "update-server.sh"
  - `./_bin/update-server.sh`

## Workflow
- This project uses [GitHub Flow](https://help.github.com/articles/github-flow/)
  - Create a branch from the repository.
  - Create, edit, rename, move, or delete files.
  - Send a pull request from your branch with your proposed changes to kick off a discussion.
  - Make changes on your branch as needed. Your pull request will update automatically.
  - Merge the pull request once the branch is ready to be merged.
  - Tidy up your branches using the delete button in the pull request or on the branches page.
  
## Theme
- Based off of [Creative](http://startbootstrap.com/template-overviews/creative/), but uses the [MaterializeCSS Framework](http://materializecss.com/).

