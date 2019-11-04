# burger_tracker_project

## Create database locally
run:
createdb burger_tracker

## Run sql file
run:
psql -d burger_tracker -f db/burgertracker.sql

## Run seeds file to create some dummy data
run:
ruby db/seeds.rb

## Run app
run:
ruby app.rb
