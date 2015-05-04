
# Heroku Powercli

## Commands

Currently, just one command:

### remove_many

Removes the given collaborator from all apps.

    ./heroku_powercli.rb remove_many 'ilya@artsymail.com' --token ...


## Acquiring a Heroku API token

    heroku plugins:install git@github.com:heroku/heroku-oauth.git
    heroku authorizations:create -d "Platform API example token"

Copy the token from the command output into the other commands.
