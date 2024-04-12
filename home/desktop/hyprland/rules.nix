{
  inputs,
  pkgs,
  ...
}: {

  wayland.windowManager.hyprland = {
    settings = {

      windowrule = let
        f = regex: "float, ^(${regex})$";
      in [
        (f "org.gnome.Calculator")
        (f "pavucontrol")
        (f "nm-connection-editor")
        (f "blueberry.py")
        (f "org.gnome.Settings")
        (f "org.gnome.design.Palette")
        (f "Color Picker")
        (f "xdg-desktop-portal")
        (f "xdg-desktop-portal-gnome")
        (f "transmission-gtk")
        (f "com.github.Aylur.ags")
        "workspace 7, title:Spotify"
      ];

      windowrulev2 = [
        "opacity 0.90 0.90,class:^(firefox)$"
        "opacity 0.90 0.90,class:^(Brave-browser)$"
        "opacity 0.80 0.80,class:^(Steam)$"
        "opacity 0.80 0.80,class:^(steam)$"
        "opacity 0.80 0.80,class:^(steamwebhelper)$"
        "opacity 0.80 0.80,class:^(Spotify)$"
        "opacity 0.80 0.80,class:^(Code)$"
        "opacity 0.80 0.80,class:^(code-url-handler)$"
        "opacity 0.80 0.80,class:^(org.kde.ark)$"
        "opacity 0.80 0.80,class:^(nwg-look)$"
        "opacity 0.80 0.80,class:^(qt5ct)$"
        "opacity 0.80 0.80,class:^(qt6ct)$"
        "opacity 0.80 0.80,class:^(kvantummanager)$"
        "opacity 0.80 0.80,class:^(nautilus)$"
        
        "opacity 0.90 0.90,class:^(com.github.rafostar.Clapper)$" #Clapper-Gtk
        "opacity 0.80 0.80,class:^(com.github.tchx84.Flatseal)$" #Flatseal-Gtk
        "opacity 0.80 0.80,class:^(hu.kramo.Cartridges)$" #Cartridges-Gtk
        "opacity 0.80 0.80,class:^(com.obsproject.Studio)$" #Obs-Qt
        "opacity 0.80 0.80,class:^(gnome-boxes)$" #Boxes-Gtk
        "opacity 0.80 0.80,class:^(discord)$" #Discord-Electron
        "opacity 0.80 0.80,class:^(WebCord)$" #WebCord-Electron
        "opacity 0.80 0.80,class:^(ArmCord)$" #ArmCord-Electron
        "opacity 0.80 0.80,class:^(app.drey.Warp)$" #Warp-Gtk
        "opacity 0.80 0.80,class:^(net.davidotek.pupgui2)$" #ProtonUp-Qt
        "opacity 0.80 0.80,class:^(yad)$" #Protontricks-Gtk
        "opacity 0.80 0.80,class:^(Signal)$" #Signal-Gtk
        "opacity 0.80 0.80,class:^(io.github.alainm23.planify)$" #planify-Gtk
        "opacity 0.80 0.80,class:^(io.gitlab.theevilskeleton.Upscaler)$" #Upscaler-Gtk
        "opacity 0.80 0.80,class:^(com.github.unrud.VideoDownloader)$" #VideoDownloader-Gtk
        
        "opacity 0.80 0.70,class:^(pavucontrol)$"
        "opacity 0.80 0.70,class:^(blueman-manager)$"
        "opacity 0.80 0.70,class:^(nm-applet)$"
        "opacity 0.80 0.70,class:^(nm-connection-editor)$"
        "opacity 0.80 0.70,class:^(org.kde.polkit-kde-authentication-agent-1)$"

        # telegram media viewer
        "float, title:^(Media viewer)$"

        # allow tearing in games
        "immediate, class:^(osu\!|cs2)$"

        # make Firefox PiP window floating and sticky
        "float, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"

        # throw sharing indicators away
        "workspace special silent, title:^(Firefox — Sharing Indicator)$"
        "workspace special silent, title:^(.*is sharing (your screen|a window)\.)$"

        # idle inhibit while watching videos
        "idleinhibit focus, class:^(mpv|.+exe|celluloid)$"
        "idleinhibit focus, class:^(firefox)$, title:^(.*YouTube.*)$"
        "idleinhibit fullscreen, class:^(firefox)$"

        # fix xwayland apps
        "rounding 0, xwayland:1"
        "center, class:^(.*jetbrains.*)$, title:^(Confirm Exit|Open Project|win424|win201|splash)$"
        "size 640 400, class:^(.*jetbrains.*)$, title:^(splash)$"
      ];
    };
  };  
}