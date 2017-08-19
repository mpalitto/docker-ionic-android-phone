adb reverse tcp:53703 tcp:53703
adb reverse tcp:8100 tcp:8100
adb reverse tcp:35729 tcp:35729
ionic cordova run android -b -lcs --address localhost --verbose
