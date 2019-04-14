1. revisit project requirements:
	You must include and make use of a nested resource with the appropriate RESTful URLs.

    • You must include a nested new route with form that relates to the parent resource

    • You must include a nested index or show route

		>>>>hike is nested form within a trail
		>>>> show all hikes for a trail

		>>>>> save user comments for RAILS/JS

		DON'T FORGET TO RECORD 30 minutes of coding minimum

	Your models must:

			• Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships

			• Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user

		FOUR models
			USER/HIKER -
				has_many :hikes
				has_many :trails, through: :hikes
			TRAILS
				has_many :hikes
				has_many :users, through: :hikes
				has_one :map_api
			HIKES
				belongs_to :trail
				belongs_to :user
				has_one :map_api through: :trails
			MAP_API
				belongs_to :trail

			  **********You must include at least one class level ActiveRecord scope method. ----which would be what exactly?

				-find_all user/hikers for a particular trail?

				review https://guides.rubyonrails.org/association_basics.html

				which google maps api am I using?
				what functionality do I want to include?
					-map of trail location
					-users geolocation in relation to trail
					-should I wait for JS/Rails to add maps and comments using js?
					- google places api or geo encoding api?
				- add images for trail/hike?	

2. create hikes belongs_to :user and :trail association in database
3. create hikes association on new hike form that shows drop down menu for existing trails and saves new hike to the appropriate users
4. finish hikes index view pages
5. finish hikes show view page
6. add date formatting user location and validation for date_of_hike
7. add update view page for both trails and hikes_params
8. Add a nested view page for user to view all hikes associated with a specific trail
9. Add a nested view page to show all hikes and users for a specific trail
10. add css styling
11. study google maps api
12. figure out what attributes my trail model need to store and retrieve trail location information from google maps api
13. create a google maps api controller
14. determine how to display trail location information
15. add trail location map to trail view page
16. add css formatting and styling
17. make video showing how to use app
18. write blog post about app

Requirements

    **********You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).

    Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...

    You must include and make use of a nested resource with the appropriate RESTful URLs.

        • You must include a nested new route with form that relates to the parent resource

        • You must include a nested index or show route


    Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.

        • Logic present in your controllers should be encapsulated as methods in your models.

        • Your views should use helper methods and partials when appropriate.

        • Follow patterns in the Rails Style Guide and the Ruby Style Guide.
