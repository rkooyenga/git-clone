#!/bin/bash
# mass clone all repos (up to 300) of a Github user/organization
# by ray kooyenga @rayktweets
# created 03-04-2014
# revised 01-01-2021
printf "\n Enter the user or org name whose repositories you want to clone: \n"
read GITORG
mkdir $GITORG
cd $GITORG
GITCMD="git clone "
# alternate clone methods
# GITCMD="git clone --depth 1 --single-branch --branch master "
# GITCMD="git clone --mirror "
REPOLIST=""
for PAGE in {1..3}; do
  REPOLIST+=`curl --silent "https://api.github.com/users/${GITORG}/repos?per_page=100&page=${PAGE}" -q|sort|grep "\"clone_url\""|awk -F': "' '{print $2}' | sed -e 's/",//g'`
done
printf "\n Cloning repositories of $GITORG... \n"
for REPO in $REPOLIST; do
  ${GITCMD}${REPO}
done
