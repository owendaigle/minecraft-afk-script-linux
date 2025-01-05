# Minecraft AFK Script 
This is a simple linux script that allow the player to do tasks while they are AFK (away from keyboard) such as fishing at an automatic farm, or mob farming at a mob farm.

This **does not require the minecraft window to be in focus**. You can be working on something else while you are doing something in Minecraft assuming your computer can handle the load. 

I decided to extend an [already existing script](http://web.archive.org/web/20240119180244/https://www.reddit.com/r/Minecraft/comments/bu4gka/linux_autoclicker_bash_script_useful_for_afk) that worked fine, but was a bit basic. I found the program [XAHK](https://github.com/histefanhere/XAHK) very good except it did not support linux, hence this script was made. Hopefully it is helpful, if there are any other farming mechanics that can be added, do it yourself (the code is straightforward) or let me know and I'll see what I can do. 

### Fishing
This just simulates holding down the right click button. Make sure you have a fishing rod (ideally with mending) in your main hand. 

<img src="resources/fishing.gif" alt="drawing" style="width:100%;"/>

### Fishing
This just simulates clicking the attack button (so make sure you have a sword in your hand) and then eats from your offhand (so you don't die from hunger).

<img src="resources/mob-farming.gif" alt="drawing" style="width:100%;"/>

# Usage
Ensure that `xdotool` is installed. This is often in the default repositories. 
 
On debian it can be installed with 
```
apt install xdotool
```
Also ensure that **minecraft is running**.

Then download the script called `MC-AFK.sh` to any folder on your system. 

**Make this script executable** by either running the following command on the file:
```
chmod +x <path-to-MC-AFK.sh>
```
*or certain file managers let you right click the file and select "Mark Executable".*

Then run the file in the terminal by:
```
./MC-AFK.sh
```

> This can also be run by using the command line arguments such as `./MC-AFK.sh fish` or `./MC-AFK.sh mobfarm` to skip the menu.

A menu should pop up with all options. Select the desired option (Fishing, Mob farming, etc) and follow on screen instructions.

### Keyboard Shortcuts
A keyboard shortcut can be created by running the script with an argument to specify the type of afk. This can be bound to a keyboard shortcut using whatever tool comes with your desktop environment. (**not suggested for mobfarm as it is hard to stop script in this case**)

```
MC-AFK.sh <mode>
```
Mode can be either:

- `fish` for AFK fishing
- `mobfarm` for AFK mob farming

# Requirements
Requires an existing Minecraft java edition installation.

Requires `xdotool` installed. 

Tested using debian 12 with Prism Launcher installed through flatpak. Should run on most linux systems.

# How it works
This script looks for a window with the text `Minecraft` in the title name then uses the utility `xdotool` to send the correct mouse clicks to that window. 
