#!/bin/sh
#. /etc/os-release

# UPTIME
UPTIME_DAYS=$(expr `cat /proc/uptime | cut -d '.' -f1` % 31556926 / 86400)
UPTIME_HOURS=$(expr `cat /proc/uptime | cut -d '.' -f1` % 31556926 % 86400 / 3600)
UPTIME_MINUTES=$(expr `cat /proc/uptime | cut -d '.' -f1` % 31556926 % 86400 % 3600 / 60)

cat > /etc/motd << EOF
██╗  ██╗██╗ █████╗      ██████╗ ██████╗  █████╗
██║ ██╔╝██║██╔══██╗    ██╔═══██╗██╔══██╗██╔══██╗
█████╔╝ ██║███████║    ██║   ██║██████╔╝███████║
██╔═██╗ ██║██╔══██║    ██║   ██║██╔══██╗██╔══██║
██║  ██╗██║██║  ██║    ╚██████╔╝██║  ██║██║  ██║
╚═╝  ╚═╝╚═╝╚═╝  ╚═╝     ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝

`date`

 - Hostname............: `uname -n`
 - Uptime..............: $UPTIME_DAYS days, $UPTIME_HOURS hours, $UPTIME_MINUTES minutes

 - Primary IP Address..: `ifconfig eth0 | grep "inet addr" |  awk -F: '{print $2}' | awk '{print $1}'`
 - Distro..............: `lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om`
 - Kernel..............: `uname -r`
 - CPU.................: `cat /proc/cpuinfo | grep 'model name' | head -1 | cut -d':' -f2 | sed 's/ //'`
 - CPU cores...........: `cat /proc/cpuinfo | grep processor | wc -l`
 - Total memory........: `free -m | grep "Mem" | awk '{print $2" MB";}'`


 - CPU Load............: `cat /proc/loadavg | awk '{print $1 ", " $2 ", " $3}'`
 - Free Memory.........: `free -m | head -n 2 | tail -n 1 | awk {'print $4'}` MB / `free -m | grep "Mem" | awk '{print $2"MB";}'`
 - Free Swap...........: `free -m | tail -n 1 | awk {'print $4'}`M
 - Free Disk...........: `df -h / | awk '{ a = $2 } END { print a }'`

 - IP Addresses..........:

`ifconfig | awk '/inet addr/{print substr($2,6)}'`

EOF