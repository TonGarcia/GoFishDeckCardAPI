# README

## Running It
It project is a rails API project. To run it you might have a mysql instance, install it gems & run the command: ```$ rake db:create && rake db:recreate```

## It Architecture
1. It models are just for database logics
1. It controllers are just for requests treatments
1. All it business rules are implemented on services
1. It test strategy is BDD, so the behaviours are tested using RSpec & generate it coverage for all these files