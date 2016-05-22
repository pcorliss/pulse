# Pulse

A simple rails 5 app for pulse/feedback surveys

## Development

```
git clone https://github.com/pcorliss/pulse.git
bundle install
createdb pulse_development
createdb pulse_test
rspec
rails server
```

## TODO

* ~~Answer Entry Form~~
* ~~Answer Create Action~~
* ~~Survey Show Page~~
* ~~Survey Stats~~
* ~~tests!~~
* rails_admin (No rails 5 compat gem) or Question/Survey Admin
* Dockerize
* ~~Make Prettier~~
* ~~D3 Stats~~
* Validations on input
* Freeform Text Questions
* ~~Survey Start/Stop Open/Close~~
* Disable Result Viewing until a critical mass of votes have been retrieved
* Team Scoping/Org Scoping
* Thanks for taking the survey flash message
* AnswerSets
* Slack integration (Send links, post results)
* ~~Single Vote Per Person~~
* Historical Stats

## User Stories

As a user I want to click a link and be dropped on a survey
As a user when I complete the survey I want to see the results
As a user I want to be able to provide anonymous feedback in a free form text field that is hidden from anyone besides an admin.
As a user I want my answers to be anonymous (minimum threshold of responses before results show)

As an admin I want to create questions and surveys with questions.
As an admin I want to send my users links to surveys via slack or email.
As an admin I want to prevent accidental submission of answers.
As an admin I want to break down answers by organization, teams, and sub-teams
As an admin I want to see trends over time
~~As an admin I want to see how many folks submitted a response~~
