Rails Project Checklist of Requirements


A summary of the application


X What will your models and associations be and why? You will need a has_many and belongs_to relationship as well as a many_to_many relationship.

 Model Relationships:

	 Hike
		 belongs_to :user
		 belongs_to :trail
		 has_many :images, as: :imageable

	 User:
		 has_many :hikes
		 has_many :trails, through: :hikes
		 has_many :images, as: :imageable

	 Trail:
		 has_many :hikes
		 has_many :users, through: :hikes
		 has_many :images, as: :imageable

	  Image:
			belongs_to :imageable, polymorphic: true


X How will you implement a user submittable attribute on the join table of the many to many relationship?
	A trail has many users through Hikes,
	A user has many trails through Hikes,
	This is a many-to-many through relationship,
	To create a user submittable attribute on the join table I gave the user a drop down menu of the available trails to populate the trail_id on hikes table that also populates the user_id by retrieving the current logged_in user
	when creating a new hike record.


X What it is an ActiveRecord scope method and what is your implementation plan?
	An ActiveRecord scope method is a chainable database query that is converted by Rails to a class method at runtime, however a scope method will always return a relation, whereas our simple class method implementation will not, if parameters for arguments aren't supplied for a class method a null value could break our program

	In my program I implement scope method within my helper methods to filter public images, and hikes, to display the appropriate hike/trail/image info for a particular user.


X What validations will you have for your models?
	For USER model - validations for email address format, presence of all fields email/password/username, validate username and email address uniqueness

	For HIKE model - validates date format and presence of date attribute

	For TRAIL model - validates presence of name, start_point, difficulty_rating, format for difficulty_rating, and uniqueness of name

	For IMAGE model - validates presence of url, date, and the format of url and date

X How will you implement an authentication system?
	by providing standard user authentication - requiring and verifying passwords, creating sessions, storing current user data in the session, re-authenticating before displaying user info on each page.
	including signup, login, logout, functionality and encrypted passwords using bcrypt and has_secure_password and offering alternative authentication through OAuth using facebook as a 3rd party login in service,
	OAuth is currently experiencing security issues leaving it vulnerable to exploitation, I don't not see a viable solution of patch at this time.


X What 3rd party login service will you use?
	Facebook


X With the way your models are setup what nested routes will you use to meet the requirement?
	I have nested routes for my polymorphic model images
	Each image belongs to a user, hike or trail, and each of these categories contains more than one image resulting in nested routes
	ie: users/3/images/1
	or trails/2/images/16/edit
	or hikes/5/images/new
