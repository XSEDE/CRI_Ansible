#!/bin/sh
sudo yum install epel-release
sudo yum -y install python-devel python-setuptools python-setuptools-devel gcc libffi-devel openssl-devel
easy_install pip
pip install virtualenv
mkdir -p $HOME/ansible_env
cd $HOME/ansible_env
virtualenv ansible
source $HOME/ansible_env/ansible/bin/activate 
git clone git://github.com/ansible/ansible.git --recursive ./ansible_source
#pexpect has to be 3.3 because new 4.01 version only
# works with python >= 2.7 :(
echo "PRE-PIP"
pip install six packaging setuptools appdirs
pip install paramiko PyYAML Jinja2 httplib2 pexpect==3.3
echo "POST-PIP"
#moved this after lib installations
source $HOME/ansible_env/ansible_source/hacking/env-setup -q
## later figure out how to source it together with virtualenv
#echo -e "\nsource $HOME/ansible/hacking/env-setup -q" >> $HOME/.activate_ansible
# run a quick test 
echo "# Ansible Inventory" > inventory_test
echo "[headnode]" >> inventory_test
echo "localhost ansible_connection=local" >> inventory_test
ansible -i inventory_test headnode -a 'hostname'
