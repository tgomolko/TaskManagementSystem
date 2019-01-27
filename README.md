# Task Management system (Todo list)

This is a single user application build using Ruby on Rails with JS(jQuery).
When user gets to the task page (home page) she/he should be able to see a list of all her/his tasks.

The user should be able to change the ordering of the tasks using Drag & Drop.

## Implemented features
- Adding tasks to the end of the list without page reload
- Ability to complete and incomplete tasks without page reload using AJAX
- Showing tasks complete/incomplete status
- Ability to change to change the ordering of the tasks(items) using Drag & Drop 
- Unit tests

## Technologies used
 - Ruby on Rails 5.1
 - Ruby 2.4.4
 - JavaScript
 - jQuery
 - AJAX
 - Bootstrap (CSS framework)
 - Control Version: Git

## Instalation
Clone the repository:

```bash
git clone https://github.com/tgomolko/TaskManagementSystem.git
```
Change into the directory: 
```bash
cd TaskManagementSystem
```
Then:
```bash
bundle install
```
```bash
rake db:migrate
```
Start local server 
```bash
rails s
```
Go to your browser and open http://localhost:3000
## Testing 

Test run for controller
```bash
bin/rails test test/controllers/tasks_controller_test.rb
```
Test run for model
```bash
 bin/rails test test/models/task_test.rb
```
