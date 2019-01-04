#  _ _____
# (_)___ /
# | | |_ \
# | |___) |
# |_|____/
#

# mod key
set $mod Mod4

# font
font pango:SauceCodePro Nerd Font 11

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start a terminal
bindsym $mod+Return exec --no-startup-id ~/scripts/i3/terminal_in_place

# kill focused window
bindsym $mod+Shift+q kill

# start dmenu
bindsym $mod+d exec --no-startup-id dmenu_run -fn 'monospace-15'

# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+p split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
# bindsym $mod+s layout stacking
# bindsym $mod+w layout tabbed
# bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# workspaces
set $ws1 "1:🌐"
set $ws2 "2:>_"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5:📨"
set $ws6 "6:🖌"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

# switch to workspace
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8
bindsym $mod+9 workspace $ws9
bindsym $mod+0 workspace $ws10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2
bindsym $mod+Shift+3 move container to workspace $ws3
bindsym $mod+Shift+4 move container to workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5
bindsym $mod+Shift+6 move container to workspace $ws6
bindsym $mod+Shift+7 move container to workspace $ws7
bindsym $mod+Shift+8 move container to workspace $ws8
bindsym $mod+Shift+9 move container to workspace $ws9
bindsym $mod+Shift+0 move container to workspace $ws10

# reload the configuration file
bindsym $mod+Shift+c reload

# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart

# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec --no-startup-id "i3-nagbar -t warning -m 'Do you really want to exit i3?' -B 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym h resize shrink width 10 px or 10 ppt
        bindsym j resize grow height 10 px or 10 ppt
        bindsym k resize shrink height 10 px or 10 ppt
        bindsym l resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or $mod+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}

bindsym $mod+r mode "resize"

# custom apps
# browser
bindsym $mod+b exec --no-startup-id google-chrome-stable

# email
bindsym $mod+m exec --no-startup-id thunderbird

# volume keys
bindcode 121 exec --no-startup-id ~/scripts/i3blocks/volume_un_mute
bindcode 122 exec --no-startup-id ~/scripts/i3blocks/change_volume -
bindcode 123 exec --no-startup-id ~/scripts/i3blocks/change_volume +

# mic keys
bindcode 198 exec --no-startup-id ~/scripts/i3blocks/microphone_un_mute

# brightness keys
bindcode 232 exec --no-startup-id ~/scripts/i3blocks/change_brightness -
bindcode 233 exec --no-startup-id ~/scripts/i3blocks/change_brightness +

# ss keys
bindcode 107 exec --no-startup-id scrot
bindcode --release Shift+107 exec --no-startup-id scrot -s

# gaps
gaps inner 6
gaps outer 1

# borders
default_border none

# status bar
bar {
    status_command i3blocks
	strip_workspace_numbers yes
    mode dock
    position top
    font pango:SauceCodePro Nerd Font 13
    colors {
        background           #1d1f21
        statusline           #b4b7b4
        focused_workspace    #005499    #005499     #b4b7b4
        active_workspace     #005499    #005499     #b4b7b4
        urgent_workspace     #cc342b    #cc342b     #b4b7b4
        inactive_workspace   #005499    #1d1f21     #b4b7b4
    }
}

# workspace distribution
# Thunderbird
for_window [class="Thunderbird"] move to workspace $ws5; workspace $ws5
# Chrome
for_window [class="Google-chrome"] move to workspace $ws1; workspace $ws1

# start on 2nd workspace
exec --no-startup-id i3-msg workspace $ws2

