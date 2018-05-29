# Recruiter Review : Backend

Ruby on Rails Api for the the Recruiter Review App. Persist and update recruiters, and reviews in the database. Render JSON data to Authenticated users.

## Getting Started

If you have PostgreSQL already installed, follow the section "Installing". After that API will be ready to use.

### Prerequisites

* [Recruiter Review Frontend](https://github.com/vsparrow/RecruiterReviewFrontend) -  Front end platform to be used with the API

```
PostgreSQL 10 recommended for your databse
POSTMAN   (used for testing API if testing needed)
```

### Installing

To get a development env running


```
bundle install
rake db:create
rake db:migrate
rake db:seed
```

Now connect to it with the Frontend app

## Testing

For use with POSTMAN

Signup
```
POST http://127.0.0.1:3000/signup   body: { firstname: "some_first_name", lastname: "some_last_name", email: "some_email_address@someDomain.com", password: "password_of_that_address"}
```

Authenticate (Login)
```
POST http://127.0.0.1:3000/authenticate   body: { email: "some_email_address", password: "password_of_that_address"}
```

Get list of recruiters
```
GET http://127.0.0.1:3000/recruiters   headers: { authorization: "key_obtained_from_post_authenticate"}
```

## Built With

* [RAILS 5](https://rubyonrails.org/) - The web framework used
* [RUBY 2.3.3p222](https://www.ruby-lang.org/en/) - Programming Language


## Versioning

Version .1 build for displaying at Flatiron School science fair

## Authors

* **Mohammad Khan** - *Initial work* - [vsparrow](https://github.com/vsparrow)

## License

This project is not licensed
