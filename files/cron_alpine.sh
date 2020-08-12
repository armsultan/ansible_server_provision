#!/bin/sh
/usr/bin/ansible-pull -o -U https://github.com/armsultan/ansible_server_provision.git local_apk.yml > /dev/null
