# git-clone
#### _mass github repo scraper/cloner_

git-clone is simple but powerful shell script to mass download *all* repositories of a user or organization on Github.

- launch the git-clone script
- enter the userid of an individual or org on github you want to scrape 
- ✨Magic ✨

### Requires

Terminal with ``git`` installed. Simply copy  [**gitclone.sh**](https://github.com/rkooyenga/git-clone/blob/main/gitclone.sh), and make sure you set it to be executable: 
```sh
$ chmod +x gitclone.sh
```

### To run:
```sh
$ ./gitclone.sh
```

You will be prompted to enter a user or org name. Type a valid username of a github user and press 'enter. It will take a moment to poll the github servers, then respond with a list of repositories found for a given user. Your choices are to download all of them or cancel out. Pretty simple. If you are downloading from a large list such as from Google or Twitter, make sure you have a fast internet connection, ample storage space on your drive, and plenty of coffee while you wait. 



 by [**Ray Kooyenga**](https://github.com/rkooyenga)
