# Using an ASUS Nexus Gamepad on Linux

This is a great gamepad, probably the best I've used, but it is nearly useless out of the box. Luckily, a few scripts, udev rules, and an xboxdrv config will work around that.

This is a very hacky solution. I'm not offering support and take no responsibility if you use the scripts and they destroy your system. It works for me, and that's all I care about. I only provide it here to hopefully save others the hours I spent working it all out.

I put these files into /games/xboxdrv/ but you can look through them all and change the path to whatever you want. I'd advise you do this anyhow, so you know what you're doing on your system!

I then copy the 99-nexus-gamepad.rules file into /dev/udev/rules.d/ and make sure xboxdrv is installed.

That's all there is to it! Works for me, on Debian 8.0. If I have to make changes or come up with better solutions in the future, I will try to update this repo. Until such a time, use these files at your own risk and with no warranty.

Contents are released to the Public Domain.

# Problems

This works on my gaming rig without issue. However, when I try to set it up identically on my laptop, also running Debian 8.0, I have a weird issue where powering off the gamepad doesn't run the disconnect stuff. Powering the gamepad back on resumes functioning; this should be fine for single-player games and using only one pad, but could be an issue for multiple gamepads. Even without using these scripts and rules, the event* and js* devices created when first pairing the controller to the system remain even after powering off the gamepad. I don't really understand why this is the case. If anyone knows what could possibly be different on my two systems, let me know.
