# User Stories
- A counselor(user) can sign-up and login
- A user can perform CRUD actions on plans and students that they are guiding
- 

# Models

## User (counselor)
#### Attributes
- name
- last name
- email
- password
#### Associations
- has many students
- has many plans, through students

## Meeting
#### Attributes
- Meeting date
- Meeting topic
- Student questions
- Reponses
- Next meeting todo
- 
#### Associations
- has many students
- has many users (counselor), through students

## Student
#### Attributes 
- first name
- last name
- email
- grade
- DOB

#### Associations
- belongs to a user (users)
- belongs to a plan