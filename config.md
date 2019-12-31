# Settings what I use in Manjaro i3

- No sound in Manjaro i3 (portuguese): https://medium.com/@lucasferreiraek/manjaro-i3-sem-som-veja-como-resolver-973cc74fbe8

- Removing beep:

```
$~ xset -b
$~ sudo nano ~/.xprofile
```

and write ```xset -b``` in your archive.

- Adjust my monitors: https://i3wm.org/docs/userguide.html#_configuring_your_monitors

I make this way:
```xrandr --output eDP1 --auto --left-of DP1```
and then make adjustments in arandr.

- Set wallpaper: just type ```nitrogen``` in your shell and choose your best wallpaper.

- Changing default browser: https://www.rockyourcode.com/change-the-default-browser-in-i3-manjaro-linux/

- Disable automatic lock screen: ```# exec --no-startup-id xauto -time 10 -locker blurlock```
