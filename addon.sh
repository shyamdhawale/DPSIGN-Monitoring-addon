#!/bin/bash
# Created by didiatworkz
# Screenly OSE Monitoring
# Extension Installer
#
# November 2019
_BRANCH=v3.0
#_BRANCH=master



header() {
clear
cat << "EOF"
                            _
   ____                    | |
  / __ \__      _____  _ __| | __ ____
 / / _` \ \ /\ / / _ \| '__| |/ /|_  /
| | (_| |\ V  V / (_) | |  |   <  / /
 \ \__,_| \_/\_/ \___/|_|  |_|\_\/___|
  \____/                www.atworkz.de

EOF
echo
echo "Screenly OSE Monitoring Extension Installer"
echo
echo
}

header
echo "Prepair Screenly Player..."
sleep 2

if [ ! -e /home/pi/screenly/server.py ]
then
	echo
	echo "No Screenly OSE found!"
	exit
fi

header
echo "The installation can may be take a while.."
echo
echo
echo
sudo -u pi ansible localhost -m git -a  "repo=${1:-https://github.com/didiatworkz/screenly-ose-monitoring-addon.git} dest=/tmp/addon version=$_BRANCH"
cd  /tmp/addon/
sudo -E ansible-playbook addon.yml

header
echo "Screenly OSE Monitoring Extension successfuly installed"
echo "Device is being restarted in 5 seconds!"
sleep 5
sudo reboot now
