MVC Challenge
=============

Rules:
------
- Create a web mvc framework (like rails, but much simpler)
- No gems allowed (apart from rspec to drive your tests) 
- Must be test driven

Ruby Version
------------
2.1.2

Technologies Used:
------------------
- Rspec for testing

Functionality:
--------------
**Implemented basic CRUD function:**
- Users can add a post with a title and content
- Users can edit posts
- Users can delete posts
- A list of posts is displayed on the homepage

Notes:
------
- Server is built using WEBrick library
- Testing framework generates HTTP requests to the server using the Net::HTTP library
- Testing framework boots up server in test mode in a separate thread before the suite is started and terminates the thread once all tests have been run
- DB is implemented using a combination of constants and csv files (to maintain data if server goes offline)

Running the Application:
-----------------------

- $ ruby lib/server.rb from root
- connect to localhost on port 8000
- visit /posts

Running the Test Suite:
-----------------------

- $ rspec from root
