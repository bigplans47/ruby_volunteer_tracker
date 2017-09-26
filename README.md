A Project(s) with Assigned Volunteer(s) Web Application

An application where employees can view, add, update and delete projects with volunteers that they assign to Projects to. Date of README: 9/25/2017

Description

There are the following features in the Project with Assigned Volunteer(s) Web Application: Projects have CRUD functionality with manually created Projects and Volunteers as custom classes, custom instance methods(plain) and custom instance variables(@), custom class methods(use word self). This allows the user to look at projects in a bullet list and assign volunteers to them. When a project is clicked volunteers can be added.

To Test Locally

git clone https://github.com/bigplans47/ruby_volunteer_tracker.git to your desktop
cd volunteer_tracker
bundle to install all required gems
rspec and the tests will be ran
ruby app.rb will start a localhost server
Visit localhost:4567
For a Live Version

Visit https://morning-caverns-19097.herokuapp.com/

Specifications

Behavior 1 (our program should handle):View, add, update and delete projects (When it receives):"Auction" as Project Title in a form (It should return):the word in a clickable hyperlinked bullet and be ready to add another Project and all the Projects will be viewable on the page as they are added. Upon clicking the link to "Auction" the user should be able to change the Project Title or delete it.

Behavior 2 (our program should handle):Allow volunteers to be added to a project (When it receives):"Amber Smith"(via form on project page and is submitted) (It should return):"Amber Smith" as a Volunteer who is assigned to help with the project(and have a clickable hyperlink on the Volunteer that will open a page where their name can be edited)

Known Bugs

Don't have way to remove volunteers from projects or in general, Heroku has H10 deployment error

Technologies Used

Bootstrap,HTML,Ruby,Sinatra

Support and contact details

Dan Kiss email me as needed at flowfast47@gmail.com

License

This website is licensed under the MIT License

Copyright (c) 2017 Dan Kiss
