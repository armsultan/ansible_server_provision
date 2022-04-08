# Ansible automate provision
Example Ansible configurations that linux systems can update themselves with.

Based off the article [How to manage your workstation configuration with Ansible](https://opensource.com/article/18/3/manage-workstation-ansible)

## Prerequsites

1. `git` and `ansible`(**Version 2.9+**) are both installed on the system first
2. Then you can manually run `ansible-pull` for the first time (after first run, cron job will automate this)

### Centos
```bash
# Install ansible and git
yum -y install epel-release
yum -y update
yum -y install ansible git
# manually run ansible-pull for the first time
ansible-pull -f -U https://github.com/armsultan/ansible_server_provision.git local_yum.yml
```

### RHEL < 8
You need to have an account on https://developers.redhat.com before you can do this:

```bash
# Install ansible and git
sudo dnf update -y
sudo dnf install python3
subscription-manager register --auto-attach
subscription-manager repos --enable ansible-2.8-for-rhel-8-x86_64-rpms
sudo  dnf -y install ansible git
ansible --version
# manually run ansible-pull for the first time
ansible-pull -f -U https://github.com/armsultan/ansible_server_provision.git local_dnf.yml
```

### RHEL 8+
You need to have an account on https://developers.redhat.com before you can do this:

```bash
# Install ansible and git
subscription-manager register --auto-attach
subscription-manager repos --enable ansible-2.8-for-rhel-8-x86_64-rpms
yum -y install ansible git
ansible --version
# manually run ansible-pull for the first time
ansible-pull -f -U https://github.com/armsultan/ansible_server_provision.git local_yum.yml
```



### Ubuntu
```bash
# Install ansible and git
apt-get -y install software-properties-common gnupg2 
apt-add-repository -y ppa:ansible/ansible
apt update
apt -y install ansible git
# manually run ansible-pull for the first time
ansible-pull -f -U https://github.com/armsultan/ansible_server_provision.git local_apt.yml
```

### Debian
```bash
# Install ansible and git
apt-get install -y software-properties-common gnupg2 sudo
# echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list
echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu focal main" >> /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
apt update
apt -y install ansible git
# manually run ansible-pull for the first time
ansible-pull -f -U https://github.com/armsultan/ansible_server_provision.git local_apt.yml
```

### Alpine
```bash
# Repositories can be enabled using the following format
# See Mirrors: https://mirrors.alpinelinux.org
# https://<mirror-server>/alpine/<version>/[main|community|testing]
$ cat /etc/apk/repositories
#/media/cdrom/apks
http://dl-cdn.alpinelinux.org/alpine/v3.12/main
http://dl-cdn.alpinelinux.org/alpine/v3.12/community
#http://dl-cdn.alpinelinux.org/alpine/edge/main
#http://dl-cdn.alpinelinux.org/alpine/edge/community
#http://dl-cdn.alpinelinux.org/alpine/edge/testing

# Install extra packages, including git
apk add gcc git libffi-dev musl-dev openssl-dev perl py-pip python3-dev python3 sshpass cargo
# Optional: update pip
pip3 install --upgrade pip
# Install Anisble globally
pip3 install ansible
# manually run ansible-pull for the first time
ansible-pull -f -U https://github.com/armsultan/ansible_server_provision.git local_apk.yml
```
