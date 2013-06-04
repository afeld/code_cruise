# CodeCruise

## Getting Started

Requires [Ruby](http://www.ruby-lang.org/en/) >= 1.9.3 and [Node.js](http://nodejs.org/) >= 0.8.0.

```bash
bundle install
rake db:migrate
npm install -g bower
bower install

rails server
open http://localhost:3000
```

## Deploying

To deploy to Heroku

```bash
heroku config:set BUILDPACK_URL='git://github.com/qnyp/heroku-buildpack-ruby-bower.git#run-bower'
```

## Credits

Thanks to [Aliona Katz](https://github.com/siberiancharm) for the branding/design help.
