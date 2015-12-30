Ubuntu virtual machine with Apache + Django set up and optional
project boilerplate included.

# Get Started

* Install [Vagrant 1.8+](https://www.vagrantup.com/)
* (optional) Place an existing Django project in the `backend/` directory. The
`manage.py` script for the project should be in the root,
eg. `backend/manage.py`.
* Run `vagrant up` from this directory.

# Initial Environment

* A new project called `project` will automatically be created for you in
`backend/` if the provisioner didn't find an existing project. Otherwise,
the only difference to note will be that a `requirements.txt` was created for
your project, if it didn't already have one.
* The project will have been set up and running on `localhost:8080` (note that
  for now, if your existing project is using a database other than **SQLite**,
  the migration task will have failed since the database engine will not exist
  on the VM. Planning to set up dynamic installing
  of the database engine in the very near future).

# Making Changes to the Apache Configuration

The Apache VirtualHost configuration can be found in
`server/provision/roles/apache/files`. If you customize it (for example, to
change the path to `wsgi.py` if you imported your own project or changed the
project name), make sure to run `vagrant provision`, which will copy it
into the virtual machine.

# Working with the virtual machine from outside the VM

Helper scripts for common tasks live in `server/utils` directory.

# Django 101

## Project Configuration

Stored in `backend/PROJECT_NAME/settings.py`.

### Project Admin Configuration ###

Run `python manage.py createsuperuser` in the VM after activating the
virtualenv via `./home/vagrant/project_env/bin/activate`.

### Project Database Configuration ####

`DATABASES['default']`: Provide information for your database
management system here.

### Project Static Files Configuration ####

`STATIC_URL`: The directory Django will look in for static files within `INSTALLED_APPS` when using `./manage.py runserver` or `./manage.py collectstatic`.

`STATIC_ROOT`: Where Django will dump static files it finds via `./manage.py collectstatic`.
