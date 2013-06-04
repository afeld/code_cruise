# CodeCruise

## Getting Started

Requires [Ruby](http://www.ruby-lang.org/en/) >= 1.9.3 and [Node.js](http://nodejs.org/) >= 0.8.0.

```bash
brew install postgresql
gem install pg -- --with-pg-config=/usr/local/bin/pg_config

bundle install
rake db:migrate
npm install -g bower
bower install

rails server

# in another terminal
open http://localhost:3000
postgres -D /usr/local/var/postgres
```

## Deploying

To deploy to Heroku:

```bash
heroku config:set BUILDPACK_URL='git://github.com/qnyp/heroku-buildpack-ruby-bower.git#run-bower'
git push heroku master
```

To sync local database:

```bash
pg_dump -Fc --no-acl --no-owner code_cruise_development > ~/Dropbox/Public/code_cruise.dump
open ~/Dropbox/Public/

# copy the public URL of code_cruise.dump

heroku pgbackups:restore DATABASE 'https://dl.dropboxusercontent.com/u/1950437/code_cruise.dump' --confirm codecruise
```

## Credits

Thanks to [Aliona Katz](https://github.com/siberiancharm) for the branding/design help.
