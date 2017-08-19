**Ionic development environment for Android builds RUNNING in DOCKER container.** 
*** Installation ***
From your Linux prompt as root:
```
git clone https://github.com/mateuswetah/docker-ionic.git <your APP name>
cd <your APP name>
```
* run ``source docker.sh build`` (which will build the docker image)
* run ``source docker.sh run`` (for starting the container)
* run ``source docker.sh enter`` (to get a prompt inside the container)
```
docker build -t ionic-android-image .
source docker.sh
docker exec -it ionic /bin/bash
```
Once you're inside your docker container and folder, you can follow usual workflow to an Ionic project:
```
```

If you plan to run `ionic serve`, remember to have your ports free.

If you plan to run `ionic cordova run android`, make sure to:
 - Have your phone plugged and with proper USB connection mode (PTP, sometimes MTP).
 - In case you have adb on your local machine, run `adb kill-server` there, then `adb devices` in your docker.

Edit Dockerfile variables in case you need to work with different Ionic, Cordova or NPM versions.

This repository doesn't support any Android Emulator yet. 
