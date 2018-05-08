# Memorial Notifier API

An externally usable API for total management of memorials. Application built using Rails 5.0 API Mode

![Snapshot](app/assets/images/snapshot.png)

[Case Study](https://samibirnbaum.com/portfolio/to-do-list-api.html)

## Usage

1. Fork and clone the repo: `git clone https://github.com/samibirnbaum/Memorial-Notifier-API.git`
2. You must have Ruby installed (built using version 2.4.1)
3. Run `$ bundle install` to download/install the needed dependencies
4. Start the local server: `$ rails s` and utilise `http://localhost:3000`
5. Make requests to the API using the guide below.

<hr>

## Authentication
This API uses [JWT's](https://jwt.io/) for authentication.

Every request made to the API will require a valid [JWT](https://jwt.io/).

This is expected to be in the request `header` in a `key/value` format:

`Authorization: Bearer <JWT>`

**There are however 3 requests that do not require authentication:**
- Creating a User (Sign-Up)
- Initial Authentication (Log-In)
- Forgot My Password

<hr>

## Users
- ### Create a user

Method: `POST`

Path: http://localhost:3000/api/users

Headers: `Content-Type: application/json`

Body:
```json
{"user":
	{
	"email":"joebloggs@gmail.com",
	"password":"joe123456"
	}
}
```

Expectations: The email must be valid as it will be needed to reset a users password. The password must be at least 6 characters long. If sign-up is successful the response status will be `201`. If unsuccessful the response status will be `422`. The user will not be automatically logged-in.

- ### Log-In
Method: `POST`

Path: http://localhost:3000/api/users/sign_in

Headers: `Content-Type: application/json`

Body:
```json
{"user":
	{
	"email":"joebloggs@gmail.com",
	"password":"joe123456"
	}
}
```

Expectations: If log-in is successful the response status will be `201`. You will also receive a [JWT](https://jwt.io/) in the response header `Authorization`.  If unsuccessful the response status will be `401` and the error will be returned as JSON.

**You will need to use this JWT for all requests to the API, it will expire automatically after 1Hour, after which you will have to log-in again to receive another JWT.**

- ### Update a User
Method: `PUT`

Path: http://localhost:3000/api/users

Headers:

`Content-Type: application/json`

`Authorization: Bearer <JWT>`

Body:
```json
{"user":
	{
	"email":"joebloggs@gmail.com",
	"password":"strongjoe123456",
	"current_password": "joe123456"
	}
}
```

Expectations: The user needs to provide their current password, and they will be able to change their email and password. If successful response status will be `204`. If unsuccessful response status will be `422` with JSON errors in the response body.

- ### Forgot My Password
Method: `POST`

Path: http://localhost:3000/api/reset_password

Headers: `Content-Type: application/json`

Body:
```json
{"user":
	{
	"email":"joebloggs@gmail.com"
	}
}
```

Expectations: If successful response status will be `200`. The response body will contain a JSON message that an email has been sent to the user. The user will receive an email with a new password that they can log-in with. The expectation is that once logged-in they will then change their password to something more memorable. If unsuccessful response status will be `422` with JSON error message in the response body.

<hr>

<!-- ## Lists
- ### Create a list
Method: `POST`

Path: http://localhost:3000/api/users/:user_id/lists

`:user_id` must be replaced with an integer of your own user id. This can be found from the create user response or by calling get all users.

Body:
```json
{"list":
	{
	"name":"TO DO",
	"private":false
	}
}
```

- ### Update a list
Method: `PUT`

Path: http://localhost:3000/api/users/:user_id/lists/:list_id

`:user_id` must be replaced with an integer of your own user id. This can be found from the create user response or by calling get all users.

`:list_id` must be replaced with an integer of your own list id. This can be found from the create list response.

Body:
```json
{"list":
	{
	"name":"update name of list",
	"private":true
	}
}
```

- ### Delete a list
Method: `DELETE`

Path: http://localhost:3000/api/users/:user_id/lists/:list_id

`:user_id` must be replaced with an integer of your own user id. This can be found from the create user response or by calling get all users.

`:list_id` must be replaced with an integer of your own list id. This can be found from the create list response.

Body: N/A
<hr>

## Items
- ### Create an item
Method: `POST`

Path: http://localhost:3000/api/lists/:list_id/items

`:list_id` must be replaced with an integer of your own list id. This was returned to you when you created your list.

Body:
```json
{"item":
	{
	"name":"Take the bins out",
	"private":false
	}
}
```

- ### Update an item
Method: `PUT`

Path: http://localhost:3000/api/lists/:list_id/items/:item_id

`:list_id` must be replaced with an integer of your own list id. This can be found from the create list response.

`:item_id` must be replaced with an integer of your own item id. This can be found from the create item response.

Body:
```json
{"item":
	{
	"name":"item name updated",
	"complete":true
	}
}
``` -->
