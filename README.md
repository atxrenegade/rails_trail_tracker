# Trail Tracker Application
![Trail Tracker Screen Shot](https://github.com/atxrenegade/rails_trail_tracker/blob/master/public/TrailTrackerScreenShot.png)

The Trail Tracker app is an easy to use, straight-forward application created
to help hikers and outdoor enthusiasts to document and share trail
locations, details and photos.  It allows users to record and share hikes
on these trails, and to view other users recent public hikes and public
gallery images.

Future functionality for Trail Tracker will allow users to add comments to
trails and using google maps geo-encoding to get directions to trails saved
in the app and view their hiking progress on them.

The top navigation bar or nav buttons on each page have been created to
easily move between create, review, edit or delete functionalities.

## Getting Started
- Download from github repo and install on local server - For new users sign up with username, password and email.

  Please NOTE: There is no password recovery functionality at this time so be mindful
and remember your password.

## How to Use this Application
######  **Sign up**

- There is are two methods for new users to sign up, through either the basic
sign up form on the sign up page, or click the link "Sign Up/Log in with
Facebook" to use facebook omniauth sign up
- To sign up as a new user from the root directory click the link "Are you a
new user? Sign up here."  Once you have reached the basic sign up form
users must provide a unique username, an email address that has not been
previously registered and a valid password, the password must be entered
correctly for confirmation a second time to complete the process
- To sign up through facebook/omniauth new users will be asked to be currently
signed or to sign in to a valid facebook account.

######  **Log in**
- To successfully sign in to an existing account you have the option to
enter a valid username and password on the root page and you will be redirected
to the Welcome page once signed in. The Welcome page can still be accessed
without logging in but all other pages will redirect user to the login page.

- The optional method is to be signed into and previously authorized through
facebook. Or to click the link "Sign Up/Log in with Facebook" and sign into the
previously authorized facebook account again.

###### **Profile**
 - **add custom profile pic**- once you have navigated to the profile page
 using the top nav button you can add a custom profile picture by clicking on
 the "Add Profile Picture" button. From there you will be redirected to an a
 image, fill out the fields with the correct format, check the checkbox to make
 image visible to other users and click "Save Image"
 - **update profile pic** - the same steps as listed above can be used to update
an your profile image, but you will see a button marked "Edit Profile Image"
instead.

NOTE ABOUT IMAGES: In order to keep this app free to use we do not store images
in our database. When saving image you will be asked for a URL, we encourage
you to use one of the many popular photo sharing sites such as - [USE](https://www.use.com/) - [IMGUR](https://imgur.com/) - [PHOTOBUCKET](https://photobucket.com/) - [FLICKR](https://www.flickr.com/) to store your images and copy the URL to share
them here.
###### **Trails**
Clicking on Trails in the top nav bar will bring you to a current index of trails saved by all users
 - **create trail** - to create a new trail click on the "Create New Trail" button
 and enter the correct information and format for the trail.  Name, Starting Point and and Difficulty Rating are mandatory fields. All others are optional.
 Once data has been entered using the correct format, click on the "Save Trail"
 button to persist it to the database. Once the trail is saved you will be redirected to the view page for the new trail.
 - **view trail** - to view an existing trail, use top nav to load the Trails index and select the trail you would like to view or edit.
 - **edit trail** - select the trail you would like to edit from the Trail index, use the "Edit this Trail button" to navigate to the edit form, click "Save Trail" to persist your trail updates to the database.
 - **delete trail** - If other users have hikes associated with a trail you are trying to delete, the trail CANNOT be deleted.  If you would like to delete a trail select the trail from the trail index page, once you are on the view page for a specific trail you can use the "DELETE this Trail" button to delete it.  When you click on the button you will see a secondary warning pop up in the dialog box asking for confirmation, if you would proceed click yes and you should be rerouted to the Trail directory and see the message "Trail successfully deleted". If they are associated hikes the delete process will not be successful, if you have images of this trail stored in the gallery, you will be asked for additional confirmation before all related images are deleted.


###### **My Hikes**
Clicking on My Hikes in the top nav bar will bring you to a current index of
hikes specific to each user, it will also include a list of recent public hikes
made public by other users.
 - **create hike** - to create a new hike click on the "Record New Hike" button on the hikes page and enter the correct information and format for the hike. Date
 of hike, and selecting the Trail the hike was on from the drop down menu are
 mandatory fields. You will also be given the option of sharing this hike with
 other users. If you would like to make your hike public, check the check box
 provided. Once data has been entered using the correct format, click on the
 "Save Hike" button to save it. Once the hike has been saved you will be
 redirected to the view page for the new hike.
 - **view hike** - to view an existing hike, use top nav to load the My Hikes index
 page and select the hike you would like to view or edit.
 - **edit hike** - select the hike you would like to edit from the My Hikes index,
 and use the "Edit this Hike button" to navigate to the edit form, click "Save hike" to save your changes.
 - **delete hike** - If you would like to delete a hike, select the hike from the My Hikes index page, once you are on the details page for that specific hike
 use the "DELETE this Hike" button to delete it. When you click on the button you will see a secondary warning pop up in the dialog box asking for confirmation, if you would proceed click yes and you
 should be rerouted to the hike directory and see the message "Hike
 successfully deleted". If they are associated hikes the delete process will
 not be successful, if you have images of this hike stored in the gallery, you
 will be asked for additional confirmation before all related images are
 deleted.

###### **Images**
 - **add image** - To add an image navigate to the details page for the Trail or
 Hike you would like to add the image to.  Click on the "Add Image" button.
 Fill out the image form with the image date, url and description.  If you would
 like the image to be viewable in the public gallery as well as your own,
 select the checkbox "allow this image to be viewable to other users". Leave the
 checkbox blank if you would like to keep it private.  Complete the process by
 clicking on the "Save Image" button.
 - **show image** - images are viewable on your "My Gallery" page and by
 selecting the detail page for the trail or hike the image is associated with.
 - **edit image** - To edit an image, go to the image detail page and click the
 "Edit Image" button, update the details you would like to change and click on
 "Save Image"
 - **delete image** -go to the image detail page and click the "Delete Image"
 button, when the confirmation dialog boxes asks if you are sure, select "Yes"

 NOTE ABOUT IMAGES: In order to keep this app free to use we do not store images
 in our database. When saving image you will be asked for a URL, we encourage
 you to use one of the many popular photo sharing sites such as - [USE](https://www.use.com/) - [IMGUR](https://imgur.com/) - [PHOTOBUCKET](https://photobucket.com/) - [FLICKR](https://www.flickr.com/) to store your images and copy the URL to share
 them here.

###### **Logout**
- Logging out can be easily accomplished by clicking the Logout option
in the Top Nav Bar or by logging out

###### **Top Nav**
- The top nav bar allows for rapid navigation to the users Trails, Hikes,
Profile, Gallery, and Home pages, and to a quick Logout button.

## Prerequisites

Safari/Firefox/Google Chrome Browsers

## Installing

To install this program locally:

- Download Repo
- Run bundle install from command line
- Navigate to root page on local server

## Built With
	* ruby '2.3.3'
	* bootstrap
	* figaro
	* omniauth
	* omniauth-facebook
	* rails ~> 5.2.1
	* sqlite3
	* bcrypt ~> 3.1.7

## Authors
  Harleigh Abel - ATXRenegade

## License
This project is licensed under the MIT License - see the LICENSE.md file for details

## Acknowledgments:

  Photographer(s):
		Anastasia Petrova
		https://unsplash.com/@anastasia_p
