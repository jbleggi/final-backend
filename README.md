# README

## About
This is the backend API intended for the administrators of a monthly mail order Tea Subscription Service. 

## Built With
Rails 7.1.5.1 & RSpec 3.13 on a MacOS

## Getting Started
1. Use Terminal to select the intended directory for download.
2. `git clone git@github.com:jbleggi/final-backend.git`
3. Open into the `final-backend` directory 
4. Run `bundle install` and `rails db:reset` in your Terminal
5. Run `rails s` in your Terminal to connect to the local server
6. Navigate to `https://localhost:3000/api/v1/subscriptions` on your preferred browser to view all subscriptions in the database.

## Postman Endpoints
1. Run `rails s` in Terminal
2. To view all subscriptions: GET `http://localhost:3000/api/v1/subscriptions`
3. To view one subscription in detail: GET `http://localhost:3000/api/v1/subscriptions/:id`
4. To edit the status of a subscription: PATCH `http://localhost:3000/api/v1/subscriptions/:id` with JSON body of
      ```
      {
        "subscription": {
          "status": "canceled" --or-- "active"
        }
      }
      ```
      
## Testing
RSpec tests are organized into Model tests, where the relationship associations and validations are inspected, and in a Request test, where the endpoint functionality is tested.  Model testing is valuable to this application in order to ensure smooth data logic within the backend of the application.   This application uses a Request spec (as opposed to an outdated Controller spec) in order to test the user's ability to send HTTP requests to this application.  
1. Run `bundle exec rspec`
2. Run `open/coverage/index` to see a detailed SimpleCov report regarding the line-by-line coverage in the tests
Give directions for how to run your tests.


## Challenges & Wins
While the CRUD endpoints used are fairly straightforward, the model relationships of the Customer/Item(Tea)/Subscription are more complex. This is the first project where I used the relationship associations in order to serialize the data exposed by these endpoints (in particular, the GET detailed subscription information).  

I had fun experimenting with the Faker and FactoryBot gems in order to seed my database tables and create  factories for the RSpec tests. This is the most complex data organization that I have seeded to date, and I enjoyed being able to implement for loops within the data in order to randomize mocked data retrieved with Faker and from Pexels.  

I look forward to returning to this project to add more details-- in particular connecting this database to an external API-- and expanding the CRUD route functionality of the app. 
