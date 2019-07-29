# Trail Tracker Application

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

		-Download from github repo and install on local server.

		-For new users sign up with username, password and email.

		Please NOTE: There is no password recovery functionality at this time so be mindful
		and remember your password.

## How to Use this Application
######  **Sign up**
		-There is are two methods for new users to sign up, through either the basic
		sign up form on the sign up page, or click the link "Sign Up/Log in with
		Facebook" to use facebook ominauth sign up.

		-To sign up as a new user from the root directory click the link "Are you a
		new user? Sign up here."  Once you have reached the basic sign up form
		users must provide a unique username, an email address that has not been
		previously registered and a valid password, the password must be entered
		correctly for confirmation a second time to complete the process.

		-To sign up through facebook/ominauth new users will be asked to be
		currently signed or to sign in to a valid facebook account.

######  **Log in**

		-To successfully sign in to an existing account you have the option to
		enter a valid username and password on the root page and you will be
		redirected to the Welcome page once signed in. The Welcome page can still
		be accessed without logging in but all other pages will redirect user to
		the login page.

		-The optional method is to be signed into and previously authorized through
		facebook. Or to click the link "Sign Up/Log in with Facebook" and sign into
		the previously authorized facebook account again.


###### **Profile**
		 -add custom profile pic
		 -update profile pic
###### **Trails**
		 -create trail
		 -view trail
		 -edit trail
		 -delete trail
###### **Hikes**
		 -create hike
		 -view hike
		 -edit hike
		 -delete hike
###### **Images**
		 -add image
		 -show image
		 -edit image
		 -delete image

###### **Logout**
		Logging out can be easily accomplished by clicking the Logout option
		in the Top Nav Bar or by logging out
###### **Top Nav**
		The top nav bar allows for rapid navigation to the users Trails, Hikes,
		Profile, Gallery, and Home pages, and to a quick Logout button.


## Prerequisites

	Safari/Firefox/Google Chrome Browsers

## Installing

	To install this program locally.

	    Download Repo
	    Run bundle install from command line
	    Navigate to root page on local server

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
