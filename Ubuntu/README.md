Simple Ubuntu 14.04 virtual environment with Apache configured to work with Django through WSGI.

Purposefully made as barebones as possible, all this does is prepare the virtual environment, with all the requisite packages installed.

# Get Started

- A new project called ```project``` will automatically be created for you in ```/vagrant/backend``` if
the provisioner doesn't find a ```manage.py``` file in that location. You can drop your existing project here if you
choose.

## Project configuration

- Open ```PROJECT_NAME/settings.py```.

### Database ####

    - ```DATABASES['default']```: Provide information for your database management system here.

### Static Files ####

    - ```STATIC_URL```: The directory Django will look in for static files within ```INSTALLED_APPS``` when using ```./manage.py runserver``` or ```./manage.py collectstatic```.

    - ```STATIC_ROOT```: Where Django will dump static files it finds via ```./ manage.py collectstatic```.


## Configure the server

- The VirtualHost configuration can be found server/provision/roles/apache/files. If you customize it (for example, to change the path to wsgi.py if you imported your own project or changed the project name), make sure to run ```vagrant provision```, which will copy it into the virtual machine.