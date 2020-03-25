# README

####This is the starter code for Exam 2, for both sections: W and X.

You have THREE hours to complete this project by adding the following:


1. Given the supporting testing files provided under test/models as well as the ER diagram, create and write the code for the User, Room and Bookings models that sastisfy all the tests provided.
2. Create and Write the code for UsersController, RoomsController and BookingsController.
3. Create all the templates corresponding to the actions defined in each Controller.
4. the index action in each controller should list all the model objects using pagination. 

5. Add a footer that should be displayed in all the templates containing the following:

	`Copyright 2020, exam 2, YOUR_NAME, Your Section`

**Hint**: The footer is to be defined as a partial.

6. Add the all the routes that provide the mapping between HTTP verbs and URLs to controller actions. **YOU ARE NOT ALLOWED TO USE the `resource` METHOD.** All the routes have to be defined manually.

7. For unit testing, you are provided with contexts (test/contexts.rb). You will have to create the factories that create default objects for a User, a Room and a Booking (in test/factories).
