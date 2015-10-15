Simple Apache + Django configuration for Red Hat and Debian based environments. It can be used to kickstart new projects or to import existing projects into a more reproducible environment.

Get Started:

- Do a shallow clone for speed: ```git clone https://github.com/gscoppino/vagrant-simple-apache-django --depth=1```
- Copy and rename either the ```Ubuntu``` or ```CentOS``` directory to the location you want to keep your project in.
- Optional: Remove/Replace/Modify the ```README```.
- Optional: Copy in an existing project into the ```backend``` directory. ```manage.py``` is mandatory if you want to import an existing project and should be directly under the ```backend``` directory.
- This is a good time to run ```git init``` and create a ```.gitignore``` so you can effectively revision control your project.

Usage:

- ```vagrant up``` :  When you are ready to spin up the server. If a project doesn't exist one will be created in the ```backend``` directory.
- ```vagrant provision``` : can be used to bring the virtual machine to a new desired state without starting from scratch. If changing a configuration file (such as an Apache config, or the ```requirements.txt```), just run ```vagrant provision``` to get the machine to the state it needs to be in.