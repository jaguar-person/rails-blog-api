# Blog APIs

## Stack

Ruby on Rails + PostgreSQL

## APIs

- Create a new post. Method should accept title, body, user login and user ip.
- Rate the post. Method should accept post id, user id and rating value.
- Get top 100 posts by average rating.
- Get a list of IPs that were posted by several different authors.

## Data Structure

### users

id, login (string, not null)

### posts

user_id (not null), title (string, not null), body (text, not null), ip (not null)

### ratings

post_id (not null), user_id (not null), value (integer, allowed values from 1 to 5, not null)

## How to start

```
rails db:create
rails db:migrate
rails s
rails db:seed
```
