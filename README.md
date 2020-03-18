# Ansible automate provision
Example Ansible configurations that linux systems can update themselves with.

Based off the article [How to manage your workstation configuration with Ansible](https://opensource.com/article/18/3/manage-workstation-ansible)

## Prerequsites

1. `git` and `ansible` are both installed on the system first
2. Then you can manually run `ansible-pull` for the first time (after first run, cron job will automate this)

### Centos
```bash
# Install ansible and git
yum -y install epel-release
yum -y update
yum -y install ansible git
# manually run ansible-pull for the first time
ansible-pull -o -U https://github.com/armsultan/ansible_server_provision.git local_yum.yml
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
ansible-pull -o -U https://github.com/armsultan/ansible_server_provision.git local_yum.yml
```

### Ubuntu
```bash
# Install ansible and git
apt-get install software-properties-common
apt-add-repository ppa:ansible/ansible
apt update
apt -y install ansible git
# manually run ansible-pull for the first time
ansible-pull -o -U https://github.com/armsultan/ansible_server_provision.git local_apt.yml
```

### Debian
```bash
# Install ansible and gi
apt-get install software-properties-common
echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
apt update
apt -y install ansible git
# manually run ansible-pull for the first time
ansible-pull -o -U https://github.com/armsultan/ansible_server_provision.git local_apt.yml
```
