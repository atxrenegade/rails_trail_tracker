Hikers who have used this trail: <%= @trail.hike.user.each |hiker| %>
 - <%= hiker.name %>
<% end %>
Hikes:
<ul>
	<%= @trail.hikes.each do |hike| %>
		<li><%= hike.user %> - <%= hike.date_of_hike %></li>
	<% end %>
</ul>

Add Hike:
<%= render @hike %>	
