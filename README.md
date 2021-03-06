# README

## Deployment procedure to Heroku

1. Access the official website of heroku (https://www.heroku.com/) and make a user registration.
2. Install heroku CLI
```
$ brew tap heroku/brew && brew install heroku
```
3. Login to heroku
```
$ heroku login
```
4. Deploy the application (make sure you are on the application directory)
```
$ heroku create
$ git add .
$ git commit -m 'init'
$ git push heroku master
```
5. Precompile assets
```
$ rails assets:precompile RAILS_ENV=production
```
6. Database migration
```
heroku run rails db:migrate
```


## Table Definition
| No | Table logical name | Table Physical name | Remarks                  |
| -- | ------------------ | ------------------- | ------------------------ |
| 1  | User information   | User                | Manage users information |
| 2  | Task infomation    | Task                | Magage task information  |

## Table Description

### User information

Table physical name : User\
Comment : Manage user information

| No | Column logical name | Column physical name | Type    | Digit | Primary key        |
| -- | ------------------- | -------------------- | ------- | ----- | ------------------ |
| 1  | User ID             | id                   | Integer | 11    | :heavy_check_mark: |
| 2  | Name                | name                 | String  | 255   |                    |
| 3  | Email               | email                | String  | 255   |                    |
| 4  | Password            | password             | String  | 255   |                    |


### Table information

Table physical name : Task\
Comment : Manage Task information

| No | Column logical name | Column physical name | Type    | Digit | Primary key        | Secondary key      | Comment |
| -- | ------------------- | -------------------- | ------- | ----- | ------------------ | ------------------ | ------- |
| 1  | Task ID             | id                   | Integer | 11    | :heavy_check_mark: |                    |         |
| 2  | User ID             | user_id              | Integer | 11    |                    | :heavy_check_mark: |         |
| 3  | Task title          | title                | String  | 255   |                    |                    |         |
| 4  | Task description    | description          | Text    |       |                    |                    |         |
| 5  | Task deadline       | deadline             | Date    |       |                    |                    |         |
| 6  | Priority            | priority             | String  | 255   |                    |                    | Priority can be either high, middle, and low |
| 7  | Status              | status               | String  | 255   |                    |                    | Status can be either not started, started, and completed |
| 8  | Label               | label                | String  | 255   |                    |                    | Later you can short the task by label |
