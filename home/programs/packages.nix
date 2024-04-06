{ pkgs, ... }:
{
  xdg.desktopEntries = {
    "lf" = {
      name = "lf";
      noDisplay = true;
    };
  };

  home.packages = with pkgs; with gnome; [
    # gui
    (mpv.override { scripts = [mpvScripts.mpris]; })
    spotify
    caprine-bin
    d-spy
    github-desktop
    gimp
    transmission_4-gtk
    discord
    icon-library
    dconf-editor
    gnome-secrets

    # langs

    # tools
    steam-run # fhs envs
    bat
    eza
    fd
    ripgrep
    fzf
    libnotify
    killall
    zip
    unzip
    glib

    # fun
  ];
}
