# IseatzPhase1
Using Zomato API, `https://developers.zomato.com/api`, created endpoints where 
 - Request: receives a city name string and api key 
 - Response: receives city info and list of cuisines in that city

## Gems 
- `rest-client` - A simple HTTP and REST client for Ruby
- `dotenv` - Dotenv is a zero-dependency module that loads environment variables from a .env

## SETUP

### GET /Cuisines
- Clone this repo to your local machine `git clone <this-repo-url>`
- run cd `Iseatz`, to access the project
- create .env file in the root folder (/ISEATZ)
 -  Your .env file should look like this `API_KEY=abcd111111111111111`
- run `bundle install` to install required dependencies
- run `rails s` to fire up the server
- Using Postman: send a GET request to `http://localhost:3000/cuisines`
 - Where the Query Params will be: 
 - `Key: city`
 - `Value: cityname (eg. Houston)`
- If not using Postman, simply type `http://localhost:3000/cuisines?city=houston` in your web browser. 
  - In place of houston, you may type any city name. 

### GET /Reviews

- Clone this repo to your local machine `git clone <this-repo-url>`
- run cd `Iseatz`, to access the project
- create .env file in the root folder (/ISEATZ)
 -  Your .env file should look like this `API_KEY=abcd111111111111111`
- run `bundle install` to install required dependencies
- run `rails s` to fire up the server
- Using Postman: send a GET request to `http://localhost:3000/reviews`
 - Where the Query Params will be: 
 - `Key: city_id`
 - `Value: (eg. 280)`
 - `Key: cuisine_id`
 - `Value: (eg. 99)`
- If not using Postman, simply type `http://localhost:3000/reviews?city_id=280&cuisine_id=99` in your web browser. 
   
