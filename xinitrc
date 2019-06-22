# Monitor setup with 144hz
xrandr --output DP-0 --mode 1920x1080 --rate 144 --output DVI-I-1 --mode 1920x1080 --rate 60 --right-of DP-0

# Mouse sensitivity
xinput --set-prop 8 'Coordinate Transformation Matrix' 0.53 0 0 0 0.53 0 0 0 1

# Java apps fix
export _JAVA_AWT_WM_NONREPARENTING=1

# Compositor for opacity
compton &

# Notifications
dunst &

# Wallpaper
~/.fehbg &

# Keyboard binds
sxhkd &

# Hide cursor
unclutter &

# Keymap
setxkbmap pl

# Numlock
numlockx &

# Tmp bar
while true; do
    xsetroot -name " "
    sleep 30s
done &

# Window manager
exec dwm
