{pkgs, ...}: {
  imports = [
    # ./browsers/thorium.nix
    ./browsers/firefox.nix
    ./office
    ./terminal
    ./editors
    ./packages.nix
    ./distrobox.nix
    ./git.nix
  ];

  home.packages = with pkgs; [
    tdesktop
    vesktop
    overskride
    mission-center
    wineWowPackages.wayland
    brightnessctl
  ];
}
