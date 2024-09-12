
# Bluet-Auth

### **Description:**

This script automatically unpairs all paired Bluetooth devices upon logging out and pairs them again upon logging in. (It was tested for shutdown, but unfortunately, that didn’t work 🙃).

### **Problem:**

At 42, we've all been in this situation: You finish your work, log out, and head home. The next morning, you return only to realize that your Bluetooth headset is still connected somewhere in the cluster, and you can't remember where you were sitting.

You're left with two options: either play a tedious guessing game or come to terms with searching through 200 iMacs, only to realize you were in the wrong cluster the entire time. (Who knew iMac's Bluetooth range was so far-reaching?)

### **Solution:**

Fortunately, there’s an automatic way to unpair your Bluetooth device without doing it manually.

When you log out (or if your session is left locked until it automatically reboots), this script will automatically detect all paired Bluetooth devices associated with your session and unpair them.

> **Note**: Part of this project was built using [blueutil](https://github.com/toy/blueutil), which helps fetch MAC addresses of paired devices. I adapted the code to only get what’s needed. Be sure to check out the [blueutil repo](https://github.com/toy/blueutil) for more details.

1. Clone this repo into `~/Library/LaunchAgents/`.
2. Update **'User_NAME'** with your **Username** in the **boot-shutdown-script.plist** file.
3. Run the following commands:

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
