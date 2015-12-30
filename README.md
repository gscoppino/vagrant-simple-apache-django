Boilerplate Apache + Django Virtual Machines with optional project boilerplate
for Red Hat and Debian based environments.

This repo provides an easy way to get started on a new Django project. By
simply bringing up a new virtual machine via `vagrant up`, it is possible
to have a Red Hat or Debian based environment set up with an Apache + Django
configuration, along with the default Django starter project already up and
running, served at `localhost:8080`. The project will already have `STATIC_ROOT`
configured, and a `requirements.txt` present at its root. With all this out
of the way, you can get to business. All configuration is stateful thanks
to Ansible, so the next time you `vagrant provision`, your project will be
exactly how you left it, the provisioner will just update the database, static
files, and installed requirements on the machine to match your project. Which
leads into...

You can import an existing Django project into this environment! Simply make
sure you put the root of the project (with `manage.py`) directly in the
`backend` folder of whatever environment you choose to go with. A
`requirements.txt` will be created automatically if it didn't already exist in
the root of your project.

Requirements:

* Vagrant 1.8+

Get Started:

* Do a shallow clone of the repo (for speed):
`git clone https://github.com/gscoppino/vagrant-simple-apache-django --depth=1`
* Copy either the Ubuntu` or `CentOS` directory to the location you
want to keep your project in, and rename the directory to whatever you like.
* Follow the README for your choice of VM.
* Consider removing/replacing/modifying the `README` and initializing a new git
repo in the folder for your project.

Usage:

* `vagrant up` :  When you are ready to spin up the server. If a project
doesn't exist one will be created in the `backend` directory.
* `vagrant provision` : can be used to bring the virtual machine to a new
desired state without starting from scratch. If changing a configuration file
(such as the Apache config, or your `requirements.txt`), just run
`vagrant provision` to get the machine to the state it needs to be in.
