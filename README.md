**Ionic development environment for Android builds RUNNING in DOCKER container.** 
##  Installation
**Pre-requisite**: Linux with docker installed

From your Linux prompt as `root` in the `/root` DIR:
```
git clone https://github.com/mpalitto/docker-ionic-android-phone.git <your APP name>
cd <your APP name>
```
Edit Dockerfile variables in case you need to work with different Ionic, Cordova or NPM versions, otherwise the latest will be used.

* run `source docker.sh build` (which will build the docker image)
* run `source docker.sh run` (for starting the container)
A shared DIR with your HOST will be created named ` <your APP name>-code`
If you have already some code you can copy it in there, or you can start a new project once insde the container.
## Developing and Editing
* run `source docker.sh enter` (to get a prompt inside the container)

Once you're inside your docker container and folder, you can follow usual workflow to a Ionic project:
For example:
```
ionic start <your APP name> tabs
```
The code will be accessible from your HOST in the `/root/<you APP name>/<your APP name>-code/` DIR

I usually have a window opened with container prompt for running IONIC commands, and a window with the HOST prompt in the `<your APP name>-code` DIR for editing the code.

### Running the APP in your browser
If you plan to run `ionic serve`, remember to have your ports free.

you can also run `ionic lab`

open your browser and enter `http://localhost:8100/ionic-lab`

### Running the APP on your PHONE
There are some APPs that use NATIVE plugins (for example the SQLite) which won't be able to run in the browser.

However you will be able to run it on a PHONE device.
 - Have your phone plugged and with proper USB connection mode (PTP, sometimes MTP).
 - In case you have adb on your local machine, run `adb kill-server` there, then `adb devices` in your docker.
* `source ionic.sh` for building and connecting to your phone.
NOTE: there is a **livereload** option, thus every time you save a file for your APP, automatically will be sent to the phone and the APP updated.

This repository doesn't support any Android Emulator. 
