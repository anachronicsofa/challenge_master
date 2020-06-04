# Gocase Challenge

 An apiREST that create a platform to receive Purchase Orders from other systems, group them on Batches and follow the Orders in the production pipeline until the dispatch.

Other systems may control when an Order or a Batch is ready to move to the next stage using a few endpoints to signal progress on the production pipeline.

<h2>Technologies:</h2>

* Ruby version: 2.5.5

* Rails version: 5.2.4.3

* Database: postgresql 

<h2>Infos:</h2>

* Clone the repository:
```
$ git clone https://github.com/anachronicsofa/challenge_master
```
* Install all gems: 
```
$ bundle install
```
* Update the database and feed the database with default seeds:
```
$ rake db:create db:migrate db:seed
```
* Start the web server on http://localhost:3000 by default:
```
$ rails s
```
* All routes: http://localhost:3000/rails/info/routes or 
```
$ rails routes
```

<h2>Features/Endpoints documentation (via Postman):</h2>

https://documenter.getpostman.com/view/11570035/SztHX5Ut?version=latest

<h2>To-do:</h2>

* Add other combinations of parameters for research, and check if parameters used in research exist in the database.
* Use <i>.downcase</i> in the parameters for comparison to avoid string recognition problem.
* Implement more test cases to check the application of the status change methods.


*The test were made at postman, but there's some specs to run for check create. 

