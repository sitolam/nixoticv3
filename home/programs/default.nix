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
    ./school/school.nix
  ];

  home.packages = with pkgs; [
    element-desktop
    tdesktop
    vesktop
    overskride
    mission-center
    wineWowPackages.wayland
    brightnessctl
  ];
}
