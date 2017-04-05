# XCRI Ansible Roles

This contains various ansible roles for making administration
of XSEDE-related software easier. Most of these will be tested on
CentOS 6 and 7, depending on demand / contributions, we may support
other operating systems as well.

## Install Ansible
The included install_ansible.sh script will install ansible in a
virtualenv in your $HOME, under ansible_env/ansible_source.

To use, run
`./install_ansible.sh`
`source $HOME/ansible_env/ansible/bin/activate`
`source $HOME/ansible_env/ansible_source/hacing/env-setup`

## Ansible role for installing Globus Connect Server

This role automates the installation of Globus Connect Server (GCS). 
Currently, this works for CentOS and Ubuntu, though the Ubuntu
version may not be quite up-to-date as of 
April 4, 2017.

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

The role checks (on CentOS) for whether firewalld is installed or not,
and applies sane firewall rules, and adds Globus as a service.

CAVEATS:
The default setup will install a private-only endpoint!
The resulting endpoint name may not be as defined in the
globus-connect-server.conf - I am not yet sure why.
