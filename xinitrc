#       _       _ _
# __  _(_)_ __ (_) |_ _ __ ___
# \ \/ / | '_ \| | __| '__/ __|
#  >  <| | | | | | |_| | | (__
# /_/\_\_|_| |_|_|\__|_|  \___|
#

# nvidia config
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --dpi 96

# xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# wallpaper setup
~/.fehbg &

# compositor for true transparency
compton -b

# notifications server
dunst &

# hide cursor
unclutter &

# restore sound config
alsactl -f ~/.alsa_state restore &

# polish keymap
setxkbmap pl

# i3
exec i3

