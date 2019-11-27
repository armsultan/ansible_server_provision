# Ansible automate provision
Example Ansible configurations that linux systems can update themselves with.

Based off the article [How to manage your workstation configuration with Ansible](https://opensource.com/article/18/3/manage-workstation-ansible)

## Prerequsites

`git` and `ansible` are both installed on the system first:

### Centos
```bash 
yum -y install python3-pip
pip3 install ansible
yum -y install git
```

### RHEL
You need to have an account on https://developers.redhat.com before you can do this:

```bash
subscription-manager register --auto-attach
subscription-manager repos --enable ansible-2.8-for-rhel-8-x86_64-rpms
yum -y install ansible
ansible --version
```

### Debian/Ubuntu
```bash 
apt-add-repository ppa:ansible/ansible
apt update
apt -y install ansible git
```