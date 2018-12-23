xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --dpi 96

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
~/.fehbg &
compton -b

exec i3

