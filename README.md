# B2 Assessments

Base repository for B2 assessments and diagnostics.

This repository requires and has been tested on Ruby v2.7.2 and is based on Rails 5.2.4.3.

RSpec and Shoulda-Matchers have been installed and set up.

## Setup

1. fork this repo
2. clone your fork
3. `git clone <paste_repo>`
4. `cd b2-mid-mod`
5. `bundle install`

When you run `bundle exec rspec` you should have 0 tests.

## Instructions

* Work on this assessment independently. DO NOT discuss with anyone.
* You are allowed to use any references including notes, Google, lesson plans, etc.
* Read each story carefully before you start working.
* Commit Frequently, about every 15 - 30 minutes
* Push your code to your fork once the time is up (not before!)

## Submission

Once the time for the assessment is up, push your code to your fork and create a pull request to the `turingschool-examples` repository. Include the following:

* Your Name
* A reflection on how you felt you did with this challenge and what story you got through

## Requirements

* TDD all new work
* model methods and relationships must be fully tested.

## Not Required

* No visual styling is required or expected
* You do not need to test for or create any model validations.

## User Stories

### Tournament of Champions

In this assessment, you will build an application to track sporting competitions, the teams in those competitions, and the players on those teams.

* Each competition will have a name, location, and sport
  * for example, name: ‘Men’s Regional’, location: ‘Louisville’, sport: ‘basketball’
* Each team will have a hometown and a nickname
  * for example, hometown: ‘Leesburg’, nickname: ‘Rockets’
* Each player will have a name and age
  * for example, name: ‘Billy Bigshoes’, age: 12
* Competitions have many teams
* Teams can be in many competitions
* Teams can have many players
* Players belong to a team

Some of the initial migrations and model set up has been done for you.

```
User Story 1 - Competition Index

As a user
When I visit the competion index
Then I see the names of all competitions
Each competition name links to its show page
```

```
User Story 2 - Competition Show Page

As a user
When I visit a competition's show page
Then I see the competition's name, location, and sport
And I see the name and hometown of all teams in this competition
And I see the average age of all players in the competition
```
```
User Story 3 - Register a Team

As a user
When I visit a competition's show page
Then I see a link to register a new team
When I click this link
Then I am taken to a new page where I see a form
When I fill in this form with a team's hometown and nickname
And I click submit
Then I am redirected back to the competition's show page
And I see the new team I created listed
```

```
Extension - Team Index

As a user
When I visit the team index
Then I see the names of all teams
And next to the team name I see the average age of its players
And I see that all teams are sorted by this average age from highest to lowest

(Note: you should not make a separate query for each team to calculate the average age)
```
