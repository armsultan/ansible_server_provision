# Ansible automate provision
Example Ansible configurations that linux systems can update themselves with.

Based off the article [How to manage your workstation configuration with Ansible](https://opensource.com/article/18/3/manage-workstation-ansible)

## Prerequsites

1. `git` and `ansible` are both installed on the system first. 
2. Then you can manually run `ansible-pull` for the first time (after first run, cron job will automate this)

### Centos
```bash 
# Install ansible and git
yum -y install python3-pip
pip3 install ansible --user
yum -y install git
# manually run ansible-pull for the first time
/usr/local/bin/ansible-pull -o -U https://github.com/armsultan/ansible_server_provision.git local_yum.yml
```

### RHEL
You need to have an account on https://developers.redhat.com before you can do this:

```bash
# Install ansible and git
subscription-manager register --auto-attach
subscription-manager repos --enable ansible-2.8-for-rhel-8-x86_64-rpms
yum -y install ansible git
ansible --version
# manually run ansible-pull for the first time
/usr/local/bin/ansible-pull -o -U https://github.com/armsultan/ansible_server_provision.git local_yum.yml
```

### Debian/Ubuntu
```bash 
# Install ansible and git
apt-add-repository ppa:ansible/ansible
apt update
apt -y install ansible git
# manually run ansible-pull for the first time
/usr/local/bin/ansible-pull -o -U https://github.com/armsultan/ansible_server_provision.git local_apt.yml
```