# IseatzPhase1

Using Zomato API, `https://developers.zomato.com/api`, created endpoints where 
 - Request: receives a city name string and api key 
 - Response: receives city info and list of cuisines in that city

## Gems 
- `rest-client` - A simple HTTP and REST client for Ruby
- `dotenv` - Dotenv is a zero-dependency module that loads environment variables from a .env

## SETUP
- Clone this repo to your local machine `git clone <this-repo-url>`
- run cd `Iseatz`, to access the project
- run `bundle install` to install required dependencies
- run `rails s` to fire up the server
- Using Postman: send a GET request to `http://localhost:3000/cuisines`
 - Where the Query Params will be: 
 - `Key: city`
 - `Value: cityname (eg. Houston)`
- If not using Postman, simply type `http://localhost:3000/cuisines?city=houston` in your web browser. 
  - In place of houston, you may type any city name. 
