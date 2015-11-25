##Appointment API
=====================

This appointment API was designed to use imported data from a CSV file to create a database-driven RESTful Web API using Ruby on Rails.

I used test-driven development (TDD) to create this API, testing all 4 methods that facilitate CRUD operations on the appointment resources:

* GET method (Read): Returns a list of all of the appointments, in JSON.
* POST method (Create): Able to create an appointment, but first and last name need to not be nil, and start/end times must be in the future.
* PUT/PATCH method (Update): After updating an entry, the data is reloaded from the database (.reload method) and populated with the latest update.
* DELETE (Destroy): Tests the ability to delete an existing appointment.





