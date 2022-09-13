# BluetoothHandler
change 'User_NAME' with your username in boot-shutdown-script.plist file
put "boot-shutdown-script.plist" in ~/Library/LaunchAgents
use launchctl load ~/Library/LaunchAgents/boot-shutdown-script.plist to load it
use launchctl unload ~/Library/LaunchAgents/boot-shutdown-script.plist to unload it
