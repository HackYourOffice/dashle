# Dashle

__Dashle__ is a dashboard framework, which aims to bring back the concepts from the now
unmaintained [Dashing](http://github.com/dashing-io/dashing) project and focus on a code
base that makes use of popular & active Ruby frameworks.

It was conceived during a collaborative [hackathon](https://github.com/HackYourOffice) by
[dm](http://dm.de) & [synyx GmbH & Co. KG](http://synyx.de).

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
$ bin/rails db:migrate
$ bin/rails db:seed
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
