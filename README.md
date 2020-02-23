# README

Ruby on Rails Blog Application RESTful API do the following:

Authenticate Users (Login, Signup)
- Each user has the following fields (name, email, password, image)
- User will log in using his email and password
- All other api endpoints are not accessible without authentication
- Use JWT for API authentication
CRUD Posts:
- Each post has the following fields (title, body, author, tags, comments) ​Please
note that the author is a separate entity which is the user model.
- Users/authors can only edit/delete their own posts
- Users/authors can add comments on any post
- Users/authors can only edit/delete their own comments
- Users/authors can update the post tags
- Each post must have at least one tag
- All posts must be deleted after 24 hours of its creation date

Used Ruby On Rails, mysql database, Sidekiq and redis (to schedule post deletion)

- First Create User
User.create(email:'test@test.com', password:123456, password_confirmation: 123456)

- Auth Token
POST localhost:3000/auth_user
{
	"email": "test@test.com",
	"password": 123456
}
it will render user data and user auth_token

- Create new Post
POST localhost:3000/api/v1/posts
with Authorization in headres => auth_token
{
	"post": {
		"title": "test post",
		"body": "first post",
		"tags_attributes": [{"title": "test"},{"title": "new_post"}]
	}
}

- Create new comment
POST localhost:3000/api/v1/comments?post_id=1
with Authorization in headres => auth_token
{
	"comment": {
		"body": "first comment"
	}
}

- Create new tag
POST localhost:3000/api/v1/tags?post_id=1
with Authorization in headres => auth_token
{
	"tag": {
		"title": "first_post_tag"
	}
}
