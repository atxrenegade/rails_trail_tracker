TO DO LIST

CORE APP FUNCTIONALITY
-add privacy page for facebook oauth to function correctly
-fill out landing/welcome page
-add linked footer
-center image on image show page

CORE BONUS
-add stars for difficulty_rating
-add checkboxes for terrain with rails serializer for db object
-add password recovery

COMMENTS FEATURE
 -Comment Models:
  	trail_comment - belongs_to :user, belongs_to :trail
		hike_comment - belongs_to :user, belongs_to :hike
		hike - has_many :hike_comments
		trail - has_many :trail_comments
		user - has_many :trail_comments, has_many :hike_comments

		index/show/new/edit js views
		update/delete/create actions

		Trail Show page -
			displays index of existing comments for this Trail
			display add trail_comments
			add new comment button listens for click
			new comment button appends new comment form to DOM
			new comment form listens for click
			new comment form button hides new comment form and adds new comment to DOM

		Hike Show page -
			displays index of existing comments for this Hike
			display add hike_comments
			add new comment button listens for click
			new comment button appends new comment form to DOM
			new comment form listens for click
			new comment form button hides new comment form and adds new comment to DOM

		User Show page - aka Profile Page
			displays index of existing comments for this USER (in order of most recent)
			each comment_content links to comment_show page

		Hike_Comment/Trail Comment Show Page
				shows individual comment
				js edit button with click event listener
				 -revises comments and displays edited version on the DOM
				js delete button with click ever listener
				 -deletes comment and reroutes to user/profile page (comment index)

GOOGLE MAPS FEATURE

	functionality:
	- Set trail location on map
	- Display trail location on map
	- Get directions to location on map

	A. SET TRAIL LOCATION
			-add functionality to set start of trail on map by address
			-add functionality to set start of trail on map by current location
			-add functionality to set end of trail on map by address
			-add functionality to set end of trail on map by current location
	B. DISPLAY MAP OF TRAIL
			-display map of trail start
			-display map of trail end point
	C. ALLOW USER TO GET DIRECTIONS TO START OF TRAIL
