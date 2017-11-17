# Dashle

# Development setup

__Dashle__ is developed as a [Ruby on Rails](http://rubyonrails.org) application.
Currently it uses Rails 5.1.x, which requires you to have the following installed:

* [Ruby 2.2+](http://ruby-lang.org)
* [Ruby Bundler](http://bundler.io)

To get started, clone this repository and install the needed dependencies:

```bash
$ git clone git@github.com:HackYourOffice/dashle.git
$ cd dashle
$ bundle install
```

Running the server for local development is easy as well:

```bash
$ bin/rails server
```

# Deployment

We use [Capistrano](http://capistranorb.com) for deployment. If you already installed
the dependencies as described above, deploying the test installation is easy:

```bash
# Make sure you have pushed your changes to the repository
$ git push
# Deploy and you will be asked which branch (defaults to current)
$ cap staging deploy
```
