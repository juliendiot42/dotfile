# Copyright (c) 2009 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import subprocess
from libqtile import bar, hook, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from qtile_extras import widget
from qtile_extras.widget.decorations import BorderDecoration


mod = "mod4"
alt = "mod1"

# programes
terminal = guess_terminal()
webBrowser = 'firefox'
fileExplorer = 'pcmanfm' #'dolphin'
appLauncher = 'krunner'
screenShot = 'flameshot gui'



@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])


# custom functions
@lazy.function
def window_to_prev_group(qtile):
    i = qtile.groups.index(qtile.current_group)
    if qtile.current_window is not None and i != 0:
        qtile.current_window.togroup(qtile.groups[i - 1].name)
        qtile.current_screen.toggle_group(qtile.groups[i - 1])


@lazy.function
def window_to_next_group(qtile):
    i = qtile.groups.index(qtile.current_group)
    if qtile.current_window is not None and i != 6:
        qtile.current_window.togroup(qtile.groups[i + 1].name)
        qtile.current_screen.toggle_group(qtile.groups[i + 1])


# custom variables
doom_one = [
    ["#282c34", "#282c34"],  # bg
    ["#bbc2cf", "#bbc2cf"],  # fg
    ["#1c1f24", "#1c1f24"],  # color01
    ["#ff6c6b", "#ff6c6b"],  # color02
    ["#98be65", "#98be65"],  # color03
    ["#da8548", "#da8548"],  # color04
    ["#51afef", "#51afef"],  # color05
    ["#c678dd", "#c678dd"],  # color06
    ["#46d9ff", "#46d9ff"]   # color15
    ]

colors = doom_one


# ---- SET KEYMAPS ----
# A list of available commands that can be bound to keys can be found
# at https://docs.qtile.org/en/latest/manual/config/lazy.html
keys = []

# Switch between windows
keys.extend([
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
])


# Switch between groups
keys.extend([
    # Key([mod, "shift"], "h", lazy.prev_screen(), desc="Move to previous screen"),
    Key([mod, "shift"], "h", lazy.to_screen(0), desc="Move to screen left"),
    Key([mod, "shift"], "j", lazy.screen.next_group(), desc="Move to the group on the right"),
    Key([mod, "shift"], "k", lazy.screen.prev_group(), desc="Move to the group on the left"),
    # Key([mod, "shift"], "l", lazy.next_screen(), desc="Move to next screen"),
    Key([mod, "shift"], "l", lazy.to_screen(1), desc="Move to screen right"),
])


# Move windows
keys.extend([
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "control"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "control"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "control"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "control"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "control", "shift"], "j", window_to_next_group, desc="Move window to next group"),
    Key([mod, "control", "shift"], "k", window_to_prev_group, desc="Move window to prev group"),
])


# Resize windows
keys.extend([
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    # Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    # Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    # Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    # Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "plus",
        lazy.layout.grow_left().when(layout=["bsp", "columns"]),
        lazy.layout.grow().when(layout=["monadtall", "monadwide"]),
        desc="Grow window to the left"),
    Key([mod], "minus",
        lazy.layout.grow_right().when(layout=["bsp", "columns"]),
        lazy.layout.shrink().when(layout=["monadtall", "monadwide"]),
        desc="Shrink window to the right"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
])

keys.extend([
    KeyChord([mod], "s", [
        Key([], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
        Key([], "j", lazy.layout.grow_down(), desc="Grow window down"),
        Key([], "k", lazy.layout.grow_up(), desc="Grow window up"),
        Key([], "l", lazy.layout.grow_right(), desc="Grow window to the right")],
        mode=True,
        name="Resize")
])


keys.extend([
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "f", lazy.window.toggle_floating(), desc="Toggle between layouts"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "Escape", lazy.window.kill(), desc="Kill focused window"),
    Key([alt], "Space", lazy.spawn(appLauncher), desc="App launcher"),
])



# media keys
volUpcmd='pactl set-sink-volume @DEFAULT_SINK@ "+5%"'
volDowncmd='pactl set-sink-volume @DEFAULT_SINK@ "-5%"'
volMutecmd='pactl set-sink-mute @DEFAULT_SINK@ toggle'
volNotify='bash ~/notifyVolume.sh'
keys.extend([
    Key([], "XF86AudioRaiseVolume", lazy.spawn(volUpcmd), lazy.spawn(volNotify, shell=True), desc='Volume Up'),
    Key([], "XF86AudioLowerVolume", lazy.spawn(volDowncmd), lazy.spawn(volNotify, shell=True), desc='Volume Down'),
    Key([], "XF86AudioMute", lazy.spawn(volMutecmd), lazy.spawn(volNotify, shell=True), desc="Mute/Unmute Volume"),
])


# quick launch
keys.extend([
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "b", lazy.spawn(webBrowser), desc="Launch web browser"),
    Key([mod], "d", lazy.spawn(fileExplorer), desc="Launch file explorer"),
    Key([], "Print", lazy.spawn(screenShot), desc="Screenshot"),
])

# qtile actions
keys.extend([
    KeyChord([mod], "Backspace", [
        Key([], "r", lazy.reload_config(), desc="Reload the config"),
        Key(["shift"], "r", lazy.restart(), desc="Restart Qtile"),
        Key([], "q", lazy.shutdown(), desc="Shutdown Qtile")],
        name="Qtile")
])


def go_to_group(name: str):
    def _inner(qtile) -> None:
        if len(qtile.screens) == 1:
            qtile.groups_map[name].toscreen()
            return

        # qtile.groups_map[name+'0'].toscreen(0)
        # qtile.groups_map[name+'1'].toscreen(1)
        lazy.group[name+'0'].toscreen(0)
        lazy.group[name+'1'].toscreen(1)
    return _inner


# group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
group_names = ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"]
# group_names = ["q", "w"]
# group_labels = ["", ""]

# group_labels = ["1", "2", "3", "4", "5", "6", "7", "8", "9",]
group_labels = ["", "", "", "󰊢", "", "", "󰤙", "󰙯", "", "󰽰"] # 
# group_layouts = ["monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall"]

groups = []
# for i in range(len(group_names)):
#     for screen in '01':
#         # glab = group_labels[i]
#         if screen == '0':
#             glab = group_labels[i]
#         else:
#             glab = 'X'

#         groups.append(
#             Group(
#                 name=group_names[i]+screen,
#                 # layout=group_layouts[i].lower(),
#                 label=glab,
#             ))
#     keys.extend(
#         [Key([mod], group_names[i], go_to_group(group_names[i]),
#              desc="Switch to group {}".format(group_names[i]),),
#          ]
#     )



for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            # layout=group_layouts[i].lower(),
            label=group_labels[i],
        ))

for i in groups:
    keys.extend(
        [Key([mod], i.name, lazy.group[i.name].toscreen(), desc="Switch to group {}".format(i.name),),
         Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True), desc="Switch to & move focused window to group {}".format(i.name),),]
    )



layout_theme_base = {"border_width": 5,
                     "margin": 3,
                     "border_on_single": True,
                     # "border_normal": "#00000000", #colors[0]
                     "border_normal": "#555555", #colors[0]
                     }

layout_theme = {**layout_theme_base,
                "border_focus": colors[5],
                }

layout_theme_float = {**layout_theme_base,
                      "border_focus": colors[4],
                      }

layouts = [
    # layout.Columns(border_focus_stack=["#d75f5f", "#7f3d3d"], border_width=3),
    layout.Columns(**layout_theme),
    layout.Max(**layout_theme),
    # Try more layouts by unleashing below layouts.
    layout.Stack(**layout_theme, num_stacks=2),
    layout.Bsp(**layout_theme),
    layout.Matrix(**layout_theme),
    layout.MonadTall(**layout_theme,
                     align=layout.MonadTall._right),
    layout.MonadWide(**layout_theme),
    layout.RatioTile(**layout_theme),
    layout.Tile(**layout_theme),
    layout.TreeTab(**layout_theme),
    layout.VerticalTile(**layout_theme),
    layout.Zoomy(**layout_theme),
]



widget_defaults = dict(
    font="Ubuntu",
    fontsize=18,
    padding=7,
    background="#00000088"
)
extension_defaults = widget_defaults.copy()

wallpaperPath='/usr/share/wallpapers/Autumn/contents/images/2560x1600.jpg'




class myCapLockIndicator(widget.CapsNumLockIndicator):
    """Modified version of CapsNumLockIndicator to show only one icon
    only for Caps Lock"""
    def poll(self):
        """Poll content for the text box."""
        indicators = self.get_indicators()

        if indicators[0][1] == 'off':
            status = ""
        elif indicators[0][1] == 'on':
            status = "󰯫" # 󰬈
        else:
            status = ""
        return status




def getWidgetsList():
    widgetList = [
        widget.CurrentLayoutIcon(),
        widget.CurrentLayout(),
        widget.GroupBox(
            active='#FFF',
            inactive='#888',
            rounded=True,
            highlight_color=['#00000000', '#00000000'],
            highlight_method='line', #"block",
            this_current_screen_border=colors[5],
            this_screen_border=colors [4],
            other_current_screen_border=colors[5],
            other_screen_border=colors [4],
            foreground=colors[1]
        ),
        widget.Prompt(),

        widget.Chord(
            chords_colors={
                "Qtile": ("#d75f5f", "#ffffff"),
                "Resize": ("#00ff00", "#ffffff"),
            },
            # name_transform=lambda name: name.upper(),
        ),

        # widget.WindowName(),
        widget.GlobalMenu(
            font='monospace',
            menu_border_width=2,
            menu_fontsize=18,
            highlight_radius=3,
            separator_colour="#ffffff",
        ),
        widget.Spacer(),
        widget.Clock(
            font="Ubuntu bold",
            format="%Y-%m-%d %a %H:%M:%S",
        ),
        widget.Spacer(),

        widget.Net(
            foreground=colors[7][0],
            format='{down}↓↑{up}',
            fmt='󱞒  {}',
            prefix='M'
        ),

        widget.CPU(
            format='  {load_percent}%',
            foreground = colors[4],
            # decorations=[
            #     BorderDecoration(
            #         colour = colors[4],
            #         border_width = [0, 0, 2, 0],
            #         padding_x = 5,
            #         padding_y = None,
            #     )
            # ],
        ),

        widget.ThermalSensor(
            tag_sensor='Tccd1',
            foreground=colors[4][0],
            foreground_alert='#d75f5f',
            # decorations=[
            #     BorderDecoration(
            #         colour = colors[4],
            #         border_width = [0, 0, 2, 0],
            #         padding_x = 5,
            #         padding_y = None,
            #     )
            # ]
        ),

        widget.Memory(
            foreground=colors[8],
            mouse_callbacks={'Button1': lambda: qtile.cmd_spawn(guess_terminal() + ' -e htop')},
            format='{MemUsed: .1f} /{MemTotal: .0f} {mm}',
            fmt = '  {}',
            measure_mem='G',
            # decorations=[
            #     BorderDecoration(
            #         colour = colors[8],
            #         border_width = [0, 0, 2, 0],
            #         padding_x = 5,
            #         padding_y = None,
            #     )
            # ],
        ),

        widget.NvidiaSensors(
            foreground=colors[5][0],
            format='󱕁  {temp}°C'
        ),

        widget.CheckUpdates(
            foreground=colors[7][0],
            colour_have_updates = colors[7][0],
            colour_no_updates = colors[7][0],
            distro='Arch_yay',
            initial_text="?",
            display_format="{updates}",
            no_update_string="0",
            fmt = '󰚰 {}',
        ),

        widget.PulseVolume(
            foreground = colors[4],
            fmt = '  {}',
        ),
        widget.TextBox(
            fmt = "|{}"
        ),
        widget.Systray(),
        widget.TextBox(
            fmt = "|{}"
        ),
        myCapLockIndicator(
            foreground = colors[3],
        ),
        # widget.QuickExit(default_text=""),
        widget.QuickExit(
            default_text=" ",
            countdown_format="{} ",
            # padding=30,
                         ),
    ]
    return widgetList



# def init_screens(): return [
#     Screen(top=bar.Bar(widgets=init_widgets_screen1(), background="#00000000", size=24, opacity=1)),
#     Screen(top=bar.Bar(widgets=init_widgets_screen2(), background="#00000000", size=24, opacity=1))]
# screens = init_screens()

screens = [
    Screen(
        wallpaper=wallpaperPath,
        wallpaper_mode='stretch', #fill
        top=bar.Bar(widgets=getWidgetsList(),
                    background="#00000000",
                    size=26),
    ),
    Screen(
        wallpaper=wallpaperPath,
        wallpaper_mode='fill', #fill
        #top=bar.Bar(widgets=[
        #    widget.GroupBox(
        #        # active=colors[8],
        #        # inactive=colors[1],
        #        rounded=False,
        #        # highlight_color=colors[1],
        #        highlight_method="line",
        #        this_current_screen_border=colors[3],
        #        this_screen_border=colors [4],
        #        other_current_screen_border=colors[7],
        #        other_screen_border=colors[6],
        #        #foreground=colors[1]
        #    ),
        # background="#00000000",
        #], size=26),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    **layout_theme_float,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
