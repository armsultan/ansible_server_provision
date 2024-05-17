# Ansible automate provision
Example Ansible configurations that linux systems can update themselves with.

Based off the article [How to manage your workstation configuration with Ansible](https://opensource.com/article/18/3/manage-workstation-ansible)

## Prerequsites

1. `amd64` Architecture (x86_64). (*Not yet adapted to `arm64`*)
1. `git` and `ansible`(**Version 2.9+**) are both installed on the system first
1. Then you can manually run `ansible-pull` for the first time (after first run, cron job will automate this)

### Centos
```bash
# Install ansible and git
yum -y install epel-release
yum -y update
yum -y install ansible git
# Check Ansible version
ansible --version
# manually run ansible-pull for the first time
ansible-pull -f -U https://github.com/armsultan/ansible_server_provision.git local_yum.yml
```

### RHEL < 8
You need to have an account on https://developers.redhat.com before you can do this:

```bash
# Install ansible and git
sudo dnf update -y
sudo dnf install python3
sudo subscription-manager register --auto-attach
sudo subscription-manager repos --enable ansible-2.8-for-rhel-8-x86_64-rpms
sudo yum -y install ansible git
# Check Ansible version
ansible --version
# manually run ansible-pull for the first time
sudo ansible-pull -f -U https://github.com/armsultan/ansible_server_provision.git local_yum.yml
```

### RHEL 8+
You need to have an account on https://developers.redhat.com before you can do this:

```bash
# Install ansible and git
sudo subscription-manager register --auto-attach
sudo subscription-manager repos --enable ansible-2.8-for-rhel-8-x86_64-rpms
sudo  dnf -y install ansible git
# Check Ansible version
ansible --version
# manually run ansible-pull for the first time
ansible-pull -f -U https://github.com/armsultan/ansible_server_provision.git local_dnf.yml
```

### Ubuntu
```bash
# Install ansible and git
sudo apt-get -y install software-properties-common gnupg2 
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt update
sudo apt -y install ansible git
# Check Ansible version
ansible --version
# manually run ansible-pull for the first time
sudo ansible-pull -f -U https://github.com/armsultan/ansible_server_provision.git local_apt.yml
```
### Debian
```bash
sudo apt update
sudo apt-get -y install software-properties-common gnupg2 wget
# Install ansible and git
# Debian 12 (Bookworm) -> Ubuntu 22.04 (Jammy) = jammy
# Debian 11 (Bullseye) -> Ubuntu 20.04 (Focal) = focal
# Debian 10 (Buster) -> Ubuntu 18.04 (Bionic) = bionic
UBUNTU_CODENAME=jammy
wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367" | sudo gpg --dearmour -o /usr/share/keyrings/ansible-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/ansible-archive-keyring.gpg] http://ppa.launchpad.net/ansible/ansible/ubuntu $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/ansible.list
sudo apt update
sudo apt -y install ansible git
# Check Ansible version
ansible --version
# manually run ansible-pull for the first time
sudo ansible-pull -f -U https://github.com/armsultan/ansible_server_provision.git local_apt.yml
```

### Alpine
```bash
# Repositories can be enabled using the following format
# See Mirrors: https://mirrors.alpinelinux.org
# https://<mirror-server>/alpine/<version>/[main|community|testing]
$ cat /etc/apk/repositories
#/media/cdrom/apks
http://dl-cdn.alpinelinux.org/alpine/v3.XX/main
http://dl-cdn.alpinelinux.org/alpine/v3.XX/community
#http://dl-cdn.alpinelinux.org/alpine/edge/main
#http://dl-cdn.alpinelinux.org/alpine/edge/community
#http://dl-cdn.alpinelinux.org/alpine/edge/testing

# Install ansible
apk add ansible
#apk add gcc git libffi-dev musl-dev openssl-dev perl py-pip python3-dev python3 sshpass cargo
# Optional: update pip
#pip3 install --upgrade pip
# Install Anisble globally
#pip3 install ansible
# Check Ansible version
ansible --version
# manually run ansible-pull for the first time
ansible-pull -f -U https://github.com/armsultan/ansible_server_provision.git local_apk.yml
```
