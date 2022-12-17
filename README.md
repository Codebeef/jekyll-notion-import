# jekyll-notion-import


[![Gem Version](https://badge.fury.io/rb/jekyll-notion-import.svg)](https://badge.fury.io/rb/jekyll-notion-import)
[![RSpec](https://github.com/Codebeef/jekyll-notion-import/actions/workflows/rspec.yml/badge.svg)](https://github.com/Codebeef/jekyll-notion-import/actions/workflows/rspec.yml)

Adds a command to jekyll to import the content of a notino database to the
`_posts` folder. Updates existing posts, but doesn't delete them.

## Usage

### Install the gem

Add the following to your site's `Gemfile`

```
gem 'jekyll-notion-import'
```

Add the following to your jekyll config:

```
plugins:
  - jekyll-notion-import
```

### Get your Notion integration token

Get a token from Notion by creating an integration and giving it read
permissions on the database you want to import.

Add the token as an env var locally (via something like direnv), or if running
this command remotely, add it to your build environment:

```
export NOTION_TOKEN=<token value>
```

### Configure Jekyll to read from the database

In your `_config.yml`, add the section that defines the database. THis currently
uses the same format [as laid out here][1]

[1]:https://github.com/emoriarty/jekyll-notion#databases

### Run the command

```
jekyll notion_import
```


## Acknowledgements

[Enrique Arias](https://github.com/emoriarty) for

* [Jekyll Notion](https://github.com/emoriarty/jekyll-notion)
* [notion_to_md](https://github.com/emoriarty/notion_to_md)

[Orbit](https://github.com/orbit-love) for
[Notion Ruby Client](https://github.com/orbit-love/notion-ruby-client)
