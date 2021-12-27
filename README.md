# Volunteer Tracker

#### By Drew Henderson

#### This website allows users to add a list of projects and add volunteers to the projects.

## Technologies Used

* Docker
* Ruby
* Gems
* Bundler
* Rspec
* Sinatra
* Capybara
* Postgres
* SQL
* SQL Designer

## Description

This site shows a list of projects on the home page, which can be added to or clicked on to view a specific project. Users can edit the project name, delete the project, view the volunteers signed up for it, or add more volunteers. Clicking on a volunteer lets you view them and change its name.

## Setup/Installation Requirements

* Create and/or navigate to the directory you would like to contain this project on your computer.
* Initialize a git repository by typing **git init** in the terminal.
* Type `git clone https://github.com/DrewHendersonGitHub/code-review-9.git` to clone the repository to your local machine.
* Navigate into project directory by typing `cd code-review-9`
* Comment out line 9 in `app.rb`
* Run `docker-compose up` to get Postgres and Sinatra running
* Type in your terminal:  
      `createdb [DATABASE NAME]`  
      `psql [DATABASE_NAME] < database_backup.sql`
      `createdb -T [DATABASE_NAME] [TEST_DATABASE_NAME]`
* Uncomment line 9 in `app.rb` to reconnect the database to the project
* Run `docker-compose up --build` to rebuild with the database
* After building the database, type `docker-compose run --rm web bundle exec rspec` in the terminal to confirm passing of all tests
* Open browswer and enter the url "http://localhost:4567/" unless otherwise prompted in the terminal

## Known Bugs

There are currently no known bugs.

## License

[MIT](https://opensource.org/licenses/MIT)

If you have any issues, questions, ideas or concerns, please reach out to me at my email and/or make a contribution to the code via GitHub.  

Copyright (c) 2021 Drew Henderson

![image_of_database_schema](./map.png)