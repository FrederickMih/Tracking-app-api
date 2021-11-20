# Tracking App API

## Project Description

This is a web application designed to track measurements of body parts(Biceps, Thighs, Hip, and Waist) from an API, built with Rails. . It fetches data such as measurements from the back-end API and equally allows users to post new measurements data.
Here is the front-end repository ([API Repo](https://github.com/FrederickMih/Tracking-App-Front-end))

## URL

[Base URL:](fred-body-track-app-backend.herokuapp.com)

### Built with

- Ruby
- Rails
- PostgresSQL
- shoulda-matchers
- Rspec

## Set up this project locally

- Open the terminal in the folder where you want to install the app;
- Run `https://github.com/FrederickMih/Tracking-app-api` to clone the project;
- Switch to the main directory of project using cd;
- Run `bundle install` in your terminal to install all dependencies.
- Append one of the endpoints to http://localhost:3000/ in order to get/post data

## Setup database with:

- `rails db:setup`
- `rails db:migrate`
- `rails db:seed`
- `rails server`

## Author

👤 **Mih Frederick**

[![](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/FrederickMih)
[![](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/frederick-mih/)
[![](https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/MihFrederick)

## API Reference

### About

Base URL returns brief introduction about the API:

> fred-body-track-app-backend.herokuapp.com

# New user Registration

Post Request:

> /registrations

Provide the user data

```bigquery
{
   user: {
        username: <your username>,
        password: <user password>,
        password_confirmation: <user password_confirmation>,
      },
}
```

Example:

```bigquery
POST: /registrations

{
    "user": {
        "username": "fred12",
        "password": "123456",
        "password_confirmation": "123456"
    }
}

Response:

{
    "status": 200,
    "logged_in": true
    "username": "fred12"
}
```

# Existing user Login

Post Request:

> /sessions

Send the user credentials

```bigquery
{
   user: {
        username: <your username>,
        password: <user password>,
      },
}
```

Example:

```bigquery
POST: /sessions

{
    "user": {
        "username": "fred12",
        "password": "123456"
    }
}

Response:

{
    "status": 200,
    "logged_in": true
    "username": "fred12"
}
```

# Current user logout

Delete request

> /sessions

Example:

```bigquery
DELETE: /sessions

Response:

{
    "status": 200,
    "logged_out": true
}

```

# To get all the measurements available

Get Request

> /measurements

Example:

```bigquery
Get: /measurements

{
    "measurements": [
        {
            "id": 1,
            "measurement_name": "Left-Biceps",
            "created_at": "2021-11-18T09:51:09.501Z",
            "updated_at": "2021-11-18T09:51:09.501Z"
        },
        {
            "id": 2,
            "measurement_name": "Right-Biceps",
            "created_at": "2021-11-18T09:51:09.501Z",
            "updated_at": "2021-11-18T09:51:09.501Z"
        },
    ],
    "status": "ok"
}
```

# To get the specific measurement

Get Request

> /measurements/:id

Example:

```bigquery
GET: /measurements/2

{
    "measurement": {
        "id": 2,
        "measurement_name": "Right-Biceps",
        "created_at": "2021-11-18T09:51:09.501Z",
        "updated_at": "2021-11-18T09:51:09.501Z"
    },
    "user": {...},
    "status": "ok"
}
```

# To get all the measures associated with current user

#### User is required to be sign in

Get Request:

> /measures

It returns all the measures date-wise and measurements wise

Example:

```bigquery
{
  all: {
    '2021-11-18': [
      {
        user_id: 1,
        measurement_id: 3,
        data: 12,
        ...
      },
          ...
    ],
      ...
  },
  progress: {
    sum_data: 1124,
    items: {
      'Right-Biceps': [
        {
          user_id: 1,
          measurement_id: 3,
          data: 20,
          ...
        },
        ...
      ],
      ...
    }
  },
  status: 'ok'
}
```

# Create New measure (For logged in user)

Post Request

> /measurements/:measurement_id/measures

Provide the measure data

```bigquery
{
    measurement_id: <measurement_id>,
    data: <data>,
}
```

Example

```bigquery
POST: /measurements/1/measures

{
    "measurement_id": 1,
    "data": 12,
}
```

## Testing

In order to run the tests, RSPEC should be installed.

- Please run the following command line in your terminal to install :

```bash
gem install rspec
```

Run from terminal

```bash
rspec
```

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

If you want to contribute, you can clone this project or fork it.

If you found an issue, feel free to check the [issues page](https://github.com/FrederickMih/Tracking-App-Front-end/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Microverse](https://www.microverse.org/)

## License

MIT License
