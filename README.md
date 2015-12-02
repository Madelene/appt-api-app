##Appointment API
=====================

This appointment API was designed to use imported data from a CSV (comma-separated values) file to create a database-driven RESTful Web API using Ruby on Rails.

I used test-driven development (TDD) to create this API, testing all 4 methods that facilitate CRUD operations on the appointment resources. Please refer to the integration tests for more information:

* GET request (Read): Returns a list of all of the appointments, in JSON.
 - GET == https://vast-woodland-4805.herokuapp.com
 - Successfully filters out by start_time and end_time. 
   For example: https://vast-woodland-4805.herokuapp.com/?start_time=2013-11-01T07:00 filters out the appointment that starts at 7AM.
 
* POST request (Create): Able to create an appointment, but first and last name need to be present, and start/end times must be in the future. 
 - Integration tests were written to ensure that the above is true, if valid, as well as appointments can not overlap.
 - In order to truly make sure that this works, I created a file called ```api_test.rb```. The code in this file allows us to use HTTParty to test the POST HTTP method.
 - Here is the code in that file:
 
```ruby
    require 'httparty'
    require 'json'
    require 'pp'

    data = {
      body: {
        appointment: {
        first_name: "Maddie",
        last_name: "Campos",
        start_time: "2015-12-2T19:00:00.000Z",
        end_time: "2015-12-2T120:05:00.000Z"
         }
        }
      }

     response = HTTParty.post('https://vast-woodland-4805.herokuapp.com/appointments', data)

     print response
 ```
     
  - Checking the heroku logs will help see what kind of request was made (```POST```, in this instance), along with the   status code.
  - The newly created appointment may also be verified in the heroku console by typing: ```Appointment.last```.
  - It is also confirmed that appointments can not be created with duplicate start times (no overlap)
 
* PUT/PATCH request (Update): After updating an entry, the data is reloaded from the database (.reload method) and populated with the latest update.
  - In order to update an appointment,```id:```must be added to the above params, as well as to the end of the URL.
  - Changing ```post``` to ```patch``` is also necessary.

* DELETE (Destroy): Tests the ability to delete an existing appointment.
 - curl -i -X DELETE https://vast-woodland-4805.herokuapp.com/appointments/1 successfully deletes the appointment with ID 1, returning a 204 (No Content) status code.


The [smarter_csv](https://github.com/tilo/smarter_csv) gem was implemented in order to help populate the database with the csv file.





