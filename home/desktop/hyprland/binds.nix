{
  inputs,
  pkgs,
  ...
}: let

  yt = pkgs.writeShellScript "yt" ''
    notify-send "Opening video" "$(wl-paste)"
    mpv "$(wl-paste)"
  '';

  playerctl = "${pkgs.playerctl}/bin/playerctl";
  brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
  pactl = "${pkgs.pulseaudio}/bin/pactl";


  # binds SUPER + [shift +] {1..10} to [move to] workspace {1..10}
  workspaces = builtins.concatLists (builtins.genList (
      x: let
        ws = let
          c = (x + 1) / 10;
        in
          builtins.toString (x + 1 - (c * 10));
      in [
        "SUPER, ${ws}, workspace, ${toString (x + 1)}"
        "SUPER SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
        "SUPER ALT, ${ws}, movetoworkspacesilent, ${toString (x + 1)}"
      ]
    )
    10);

in {

  wayland.windowManager.hyprland = {
    settings = {

      binds = {
        allow_workspace_cycles = true;
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
        # no_gaps_when_only = "yes";
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_forever = true;
        workspace_swipe_numbered = true;
      };

      # binds
      bind = let
        e = "exec, ags -b hypr";
      in 
        [
        
        # Session actions
        "CTRL SHIFT, R,  ${e} quit; ags -b hypr" # reload ags bar
        "SUPER, Tab,     ${e} -t overview" # overview
        ",XF86PowerOff,  ${e} -t powermenu" # logout menu
        "SUPER, Backspace, ${e} -t powermenu" # logout menu

        # Screenshot/Screencapture
        ",XF86Launch4,   ${e} -r 'recorder.start()'"
        ",Print,         ${e} -r 'recorder.screenshot()'"
        "SUPER SHIFT, R, ${e} -r 'recorder.screenshot()'"
        "SHIFT,Print,    ${e} -r 'recorder.screenshot(true)'"
        "SUPER, O, exec, wl-ocr" # select area to perform OCR on

        # Application shortcuts
        "SUPER, T, exec, xterm" # xterm is a symlink, not actually xterm
        "SUPER, B, exec, firefox" # open browser firefox
        "SUPER, F, exec, nautilus" # open file manager
        "SUPER, C, exec, vscode" # open vscode

        # youtube
        ", XF86Launch1,  exec, ${yt}"

        "CTRL ALT, Delete, exit"
        "SUPER, Q, killactive" # killactive, kill the window on focus
        "SUPER, W, togglefloating" # toggle the window on focus to float
        "SUPER, return, fullscreen" # toggle the window on focus to fullscreen
        "SUPER, O, fakefullscreen" # toggle the window on focus to fake fullscreen
        "SUPER, G, togglegroup," # toggle the window on focus to group
        "SUPER SHIFT, N, changegroupactive, f" # change the active group
        "SUPER SHIFT, P, changegroupactive, b" # change the active group

        "SUPER, space, hyprexpo:expo, toggle"

        # Move focus with mod + arrow keys
        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, slash, movefocus, u" # (for smaller keyboards)
        "SUPER, down, movefocus, d"
        "ALT, Tab, focuscurrentorlast"

        # move to the first empty workspace instantly with mod + CTRL + [↓]
        "SUPER CTRL, down, workspace, empty"

         # Move active window around current workspace with mod + SHIFT + CTRL [↔ ↑↓]
        "SUPER SHIFT CTRL, left, movewindow, l"
        "SUPER SHIFT CTRL, right, movewindow, r"
        "SUPER SHIFT CTRL, up, movewindow, u"
        "SUPER SHIFT CTRL, slash, movewindow, u" # (for smaller keyboards))
        "SUPER SHIFT CTRL, down, movewindow, d"

        # Scroll trhough existing workspace with mod + scroll
        "SUPER, mouse_down, workspace, m+1"
        "SUPER, mouse_up, workspace, m-1"
        
        # cycle workspaces
        "SUPER, bracketleft, workspace, m-1"
        "SUPER, bracketright, workspace, m+1"

        # cycle monitors
        "SUPER SHIFT, bracketleft, focusmonitor, l"
        "SUPER SHIFT, bracketright, focusmonitor, r"

        # send focused workspace to left/right monitors
        "SUPER SHIFT ALT, bracketleft, movecurrentworkspacetomonitor, l"
        "SUPER SHIFT ALT, bracketright, movecurrentworkspacetomonitor, r"

        # Toggle layout
        "SUPER, J, togglesplit,"
        "SUPER, P, pseudo,"

      ]
      ++ workspaces; # Switch workspaces with mod + workspace and move active window to a workspace with mod + SHIFT + workspace

      bindr = [
        "SUPER, exec, ags -b hypr -t launcher" # laucnher
      ];

      binde = [
        # Resize windows
        "SUPER SHIFT, right, resizeactive, 10 0"
        "SUPER SHIFT, left, resizeactive, -10 0"
        "SUPER SHIFT, up, resizeactive, 0 -10"
        "SUPER SHIFT, slash, resizeactive, 0 -10"
        "SUPER SHIFT, down, resizeactive, 0 10"
      ];

      bindle = [
        # backlight
        ",XF86MonBrightnessUp,   exec, ${brightnessctl} set +5%"
        ",XF86MonBrightnessDown, exec, ${brightnessctl} set  5%-"
        ",XF86KbdBrightnessUp,   exec, ${brightnessctl} -d asus::kbd_backlight set +1"
        ",XF86KbdBrightnessDown, exec, ${brightnessctl} -d asus::kbd_backlight set  1-"

        # volume
        ",XF86AudioRaiseVolume,  exec, ${pactl} set-sink-volume @DEFAULT_SINK@ +5%"
        ",XF86AudioLowerVolume,  exec, ${pactl} set-sink-volume @DEFAULT_SINK@ -5%"
      ];

      bindl = [
        # media controls
        ",XF86AudioPlay,    exec, ${playerctl} play-pause"
        ",XF86AudioStop,    exec, ${playerctl} pause"
        ",XF86AudioPause,   exec, ${playerctl} pause"
        ",XF86AudioPrev,    exec, ${playerctl} previous"
        ",XF86AudioNext,    exec, ${playerctl} next"

        # volume
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];

      # mouse movements
      bindm = [
        "SUPER, mouse:273, resizewindow"
        "SUPER, mouse:272, movewindow"
      ];
    };
  };  
}  