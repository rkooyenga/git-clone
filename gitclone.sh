#!/bin/bash
# mass clone all repos (up to 300) of a Github user/organization
# just run./gitclone.sh , takes no parameters.
# by ray kooyenga , @rayktweets , https://github.com/rkooyenga/git-clone
# created 03-04-2014
# revised 01-01-2022

# prettify the console output
echo_r() {
  echo -e "\e[31m${1}\e[0m"
}
echo_g() {
  echo -e "\e[32m${1}\e[0m"
}
echo_y() {
  echo -e "\e[33m${1}\e[0m"
}

GITCMD="git clone "
# alternate clone method samples 
# GITCMD="git clone --depth 1 --single-branch --branch master "
# GITCMD="git clone --mirror "

echo_r 'Enter the user or org name whose repositories you want to clone: '
read GITORG

REPOLIST=""
# max repos downloaded from a given user will be 100 per page x 4 pages. should be enough but increase if necessary 
for PAGE in {1..4}; do
  REPOLIST+=`curl --silent "https://api.github.com/users/${GITORG}/repos?per_page=100&page=${PAGE}" -q|sort|grep "\"clone_url\""|awk -F': "' '{print $2}' | sed -e 's/",//g'`
done

echo_y "$REPOLIST"
echo_r "ready to clone all the above repositories of: $GITORG"
echo_r "press Enter to proceed or Ctrl C to cancel"
read

mkdir $GITORG
cd $GITORG
for REPO in $REPOLIST; do
  ${GITCMD}${REPO}
done

echo_g 'finished cloning.'
