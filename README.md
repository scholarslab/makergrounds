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
  - `cd makergrounds`
  - `bundle install`

## Preview
- You can preview your changes on the local computer
  ```
  jekyll serve
  ```
  - Then open http://localhost:4000 in your browser

## Publish
- Run `jekyll build` to generate the static HTML/CSS/Javascript files. They are
  stored in the '_site' folder
- Copy the files from '_site' to the server.

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

