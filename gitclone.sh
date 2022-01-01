#!/bin/bash
# mass clone all repos (up to 300) of a Github user/organization
# by ray kooyenga @rayktweets
# created 03-04-2014
# revised 01-01-2021
myecho() {
  echo -e "\e[33m${1}\e[0m"
}
GITCMD="git clone "
# alternate clone methods
# GITCMD="git clone --depth 1 --single-branch --branch master "
# GITCMD="git clone --mirror "
myecho 'Enter the user or org name whose repositories you want to clone: '
read GITORG
REPOLIST=""
for PAGE in {1..3}; do
  REPOLIST+=`curl --silent "https://api.github.com/users/${GITORG}/repos?per_page=100&page=${PAGE}" -q|sort|grep "\"clone_url\""|awk -F': "' '{print $2}' | sed -e 's/",//g'`
done
myecho ' $REPOLIST '
myecho ' Cloning the above repositories of $GITORG press Enter to continue or Ctrl C to cancel'
read
mkdir $GITORG
cd $GITORG
for REPO in $REPOLIST; do
  ${GITCMD}${REPO}
done
myecho ' finished cloning '
