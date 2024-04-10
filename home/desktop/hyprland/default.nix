{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.hyprland.homeManagerModules.default
    #./binds.nix
    #./rules.nix
    ./settings.nix
    ./hyprland.nix
  ];

  wayland.windowManager.hyprland = {
    systemd = {
      variables = ["--all"];
      extraCommands = [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };
  };
}
