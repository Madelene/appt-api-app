##Appointment API
=====================

This appointment API was designed to use imported data from a CSV file to create a database-driven RESTful Web API using Ruby on Rails.

I used test-driven development (TDD) to create this API, testing all 4 methods that facilitate CRUD operations on the appointment resources. Please refer to the integration tests for more information:

* GET request (Read): Returns a list of all of the appointments, in JSON.
 - GET == https://vast-woodland-4805.herokuapp.com
 - Successfully filters out by start_time and end_time. 
   For example: https://vast-woodland-4805.herokuapp.com/?start_time=2013-11-01T07:00 filters out the appointment       that starts at 7AM.
 
* POST request (Create): Able to create an appointment, but first and last name need to be present, and start/end times must be in the future.
 
* PUT/PATCH request (Update): After updating an entry, the data is reloaded from the database (.reload method) and populated with the latest update.

* DELETE (Destroy): Tests the ability to delete an existing appointment.








