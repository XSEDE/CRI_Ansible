#H XCRI Ansible Roles

This contains various ansible roles for making administration
of XSEDE-related software easier. Most of these will be tested on
CentOS 6 and 7, depending on demand / contributions, we may support
other operating systems as well.

##H2 Ansible role for installing Globus Connect Server

This role automates the installation of Globus Connect Server (GCS). 
Currently, this works for CentOS 7; updating 
this for additional distros is a nice TODO. 

files/globus\_service.xml defines the necessary port ranges for 
GCS data transfer using firewalld; rich rules for Globus Online 
Services are handles in "configure.yml".

files/globus-connect-server.conf is the standard GCS configuration 
file, using Jinja2 variables and the expect module for local 
configuration. Suggestions on better defaults are quite welcome!

This can be added to your current Ansible plays by adding the
globus-server directory under "roles", and inserting "globus-server"
in the list of roles in our playbook.

The file "globus.yml" is an example playbook using this role; the 
variables set by vars\_prompt may either be set by hand, or copied into
the top-level playbook calling this role.

The task does not use the firewalld module, since it both requires
the Python 2 bindings, and that the service exist in /etc/services, 
which globus does not.
