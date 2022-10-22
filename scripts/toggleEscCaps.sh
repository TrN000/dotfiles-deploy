#!/usr/bin/bash

if xmodmap -pke | grep 'keycode   9 = Escape'
then
    xmodmap -e 'keycode 66 = Escape NoSymbol Escape' -e 'keycode 9 = Caps_Lock NoSymbol Caps_Lock'
    notify-send -t 2500 'ESC = CAPS         CAPS = ESC'
else
    xmodmap -e 'keycode 9 = Escape NoSymbol Escape' -e 'keycode 66 = Caps_Lock NoSymbol Caps_Lock'
    notify-send -t 2500 'ESC = ESC         CAPS = CAPS'
fi
