# README

This is a Pinterest-clone following the tutorial by [Mackenzie Child](https://mackenziechild.me/) in his
[12-apps-in-12-weeks](https://mackenziechild.me/12-in-12/) series.  
* The video for the tutorial is located here: [Week 8: How To Build A Forum With Rails 4](https://mackenziechild.me/12-in-12/10/) and on Youtube
* Mackenzie's GitHub repo for this project is here: [forum](https://github.com/mackenziechild/forum)

#### CM Items to do Later
* Fix the category functionality from the Wikipedia app (see the user through post example below)

#### CM Insights
* Here's another example of trying to show a user through post.
```haml
- @posts.each do |post|
	%h2= link_to (post.title), post
	%strong Published:
	=time_ago_in_words(post.created_at)
	ago by
	= User.find(post.user_id).email      <= version 1
	or
	= post.user.email  									 <= version 2 (probably the better version)
	%p= post.content
```

#### ~43:30 - Clearfix
* The way he solved his spacing problem was pretty cool...I need to look up what he did and how it works
```css
.clearfix:before, .clearfix:after {
	content: " ";
	display: table;
}

.clearfix:after {
	clear: both;
}
```
* Cool way to truncate the text and show users a preview of the post:
```haml
%p
= truncate(post.content, length: 250)
= link_to "read more", post
```
* The before_action lines in the posts_controller.rb file:
```ruby
before_action :find_post, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!, except: [:index, :show]
```
* the find_post method is a private method that finds the post that the person wants to show, edit, update or 
destroy...pretty self-explanatory
  * Notice it has the 'only:' keyword indicating that it does that method ONLY for those four actions
* the ':authenticate_user!' is from Devise and uses the "except:" keyword. 
	* So what are authenticating?  And why?  
	  * We want users to be logged in to do pretty much everything.  That means that we can use the 'except:' to
	  exempt just two actions, the show and index actions.  That makes sense...we don't care if visitors / non-users
	  can read individual posts, we just don't want them to be able to do anything else.

#### ~1:02:00 - Add Comments Model and Controller

* I am stuck on adding comments...I may have messed up my database but I can't get the comments to save to the database.
It always fails for some reason...nothing seems to be able to save to the database now




