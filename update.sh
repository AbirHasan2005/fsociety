#!/bin/bash
# Update Script for fsociety
# Script created by @AbirHasan2005


dependencies() {

command -v git > /dev/null 2>&1 || { echo >&2 "Package GIT is not installed ... Unable to update ..."; exit 1; }
command -v python2 > /dev/null 2>&1 || { echo >&2 "Package Python2 is not installed ... Unable to update ..."; exit 1; }

}

script() {

clear
printf "\n \e[1;92mUpdating \e[1;94mfsociety\e[1;92m directory ...\n\n"
sleep 1.5
cd ..
rm -rf fsociety
git clone https://github.com/AbirHasan2005/fsociety
cd fsociety
printf "\n\e[1;92m Restarting \e[1;94mfsociety.py install.sh\e[1;92m script ...\n\e[0m"
bash install.sh
python2 fsociety.py
cd ..
ls

}

dependencies
script
