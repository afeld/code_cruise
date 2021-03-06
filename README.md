# CodeCruise

## Getting Started

Requires [Ruby](http://www.ruby-lang.org/en/) >= 1.9.3 and [Node.js](http://nodejs.org/) >= 0.8.0.

```bash
brew install postgresql
gem install pg -- --with-pg-config=/usr/local/bin/pg_config

bundle install
rake db:setup
npm install -g bower
bower install

foreman start -f Procfile.local
open http://localhost:3000
```

## Deploying

To deploy to Heroku:

```bash
# first time
heroku config:set BUILDPACK_URL='git://github.com/qnyp/heroku-buildpack-ruby-bower.git#run-bower'

# to deploy
./bin/deploy
```

## Credits

Thanks to [Aliona Katz](https://github.com/siberiancharm) for the branding/design help.
