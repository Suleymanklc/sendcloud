# Sendcloud DevOps Hiring Test

Steve the developer has come to you with their amazing Python/Django
application but has no idea how to deploy it on a Kubernetes cluster. "It works
on my machine" Steve says, proudly. As a DevOps engineer you're the chosen one
to help out this poor lost soul.

## The Application

The web application exposes a very simple API on the path `/` that returns a
greeting. It also exposes an admin interface (the [Django admin][django-admin])
on `/admin/`.

[django-admin]: https://docs.djangoproject.com/en/3.2/ref/contrib/admin/

### Python

The application is tested on Python 3.11 and it's been verified to work. The
file `requirements.txt` lists all the Python packages that have been used for
this verification. You're free to modify the application's code if you think
that would make it run better. Just explain what you have changed and why so
our developer friend Steve can learn.

### Environment Variables

For the Django app to run correctly the following environment variables are
required:

- `SECRET_KEY`
- `DEBUG`
- `DATABASE_NAME`
- `DATABASE_USER`
- `DATABASE_PASSWORD`
- `DATABASE_HOST`
- `DATABASE_PORT`

Make sure to set these to the correct values.

### Database

The application relies on PostgreSQL.

### Migrations

The following command runs the Django database migrations.

```
python manage.py migrate
```

### Web Server

The following command runs the Django application itself.

```
gunicorn --bind 0.0.0.0:8080 --access-logfile - app.wsgi:application
```

## Requirements

This test has, as any test, a set of requirements to meet.

1. The application's API works and is accessible from outside of the Kubernetes
   cluster.
2. The admin interface is available and a user can log in.
3. The application's container image should be one that you would want to
   deploy to production. What you use to produce this image is up to you.
4. The database migrations need to be run *only once* every time the
   application is installed or upgraded *and* before the Django application
   itself (re)starts.
5. Supporting services (like PostgreSQL) need to be deployed on the same
   cluster.
6. Consider this exercise to be a deployment to production. Take this as an
   opportunity to show off what you would do to deploy and run applications in
   a live, high-traffic, customer-facing environment.


## Constraints

To give this challenge a little direction, here's a number of constraints your
solution will need to follow.

1. Instead of spending money on cloud resources, create a locally running
   multi-node Kubernetes cluster with a tool of your choosing. If this means
   that certain things you would do in production become either impossible or
   too time-consuming, you're encouraged to write down a list of improvements
   you would introduce without the local constraint.
2. Make use of [Helm](https://helm.sh/) to deploy the application.
3. Developers like Steve use either Linux or MacOS. No need to cater to other
   operating systems.

## Developer Documentation

You will need to document which steps and/or commands are needed to run the
application and why those are needed. Please write this documentation in the
`DOCS.md` file. The intended audience of this file is Steve and other
Steve-like "it works on my machine" people.

## Delivering the Test Results

It is completely up to you how you want to deliver the results of this test
back to Sendcloud. But please don't make it publicly accessible.
