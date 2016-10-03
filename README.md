#H Ansible role for installing Globus Connect Server

This role automates the installation of Globus Connect Server (GCS). 
Currently, this works for CentOS 7; updating 
this for additional distros is a nice TODO. 

files/globus\_service.xml defines the necessary rich rules for 
GCS using firewalld. 

files/globus-connect-server.conf is the standard GCS configuration 
file, using Jinja2 variables and the expect module for local 
configuration. Suggestions on better defaults are quite welcome!

This can be added to your current Ansible plays by adding the
globus-server directory under "roles", and inserting "globus-server"
in the list of roles in our playbook.

The task does not use the firewalld module, since it both requires
the Python 2 bindings, and that the service exist in /etc/services, 
which globus does not.
