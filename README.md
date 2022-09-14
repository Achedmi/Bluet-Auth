
# Bluet-Auth

### **Desctiption :**

This sctipt is made for unpairing all the paired devices on log-out and on log-in (i tryed to use it on shut down but didn’t work 🙃).

### **Problem :**

Every one of us here at 42 has encountered this situation, you finish your work at night you logout and head back home, the next morning you come back only to realise that your bluetooth headset was left connected somewhere around the cluster and you just can’t remember where you were seated.

Leaving you with two possibilities, either you play a boring guessing game, or surcome to the reality that you will need to look up 200 IMACs… only to realise that you were in the wrong cluster. (Who knew IMac’s bluetooth had that much range).

### **Solution :**

Luckily for you, There is a way to auto unpair your bluetooth device without manually doing so…

Once you log out from your session (or in case you left your session locked untit it rebooted automaticaly and someone has this script and used the same session), this script will automatically looks up all the paired devices on the session, and automatically unpaires them.

> Note : A part of this project was taken from https://github.com/toy/blueutil and manipulated to fetch the MAC adresses of the paired devices and unpairing them without human interraction. (well my work basically was to change his code to get just what’s needed, so make sure to check https://github.com/toy/blueutil repo to see the full details)
> 

Using the following steps :

- Clone this repo in “~/Library/LaunchAgents/”
- Change **'User_NAME'** with your **Username** in **boot-shutdown-script.plist** file in the repo
- Run this command:

```bash
mv boot-shutdown-script.plist ~/Library/LaunchAgents/
```

- Type this command to load the script:

```bash
launchctl load ~/Library/LaunchAgents/boot-shutdown-script.plist
```

**Finally** :

Thanks to :

[akh9001 - Overview](https://github.com/akh9001)

[kirwa-KO - Overview](https://github.com/kirwa-KO)

[Ssymba0 - Overview](https://github.com/Ssymba0)

[https://github.com/toy/blueutil](https://github.com/toy/blueutil)