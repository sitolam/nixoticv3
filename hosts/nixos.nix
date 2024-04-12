{pkgs, inputs, ...}: {

  imports = [
    ./hardware
    ./services
    ./network
    ./geography/locale.nix
    ./packages
    ./desktop/hyprland.nix
    ../pkgs
  ];

  # nix
  documentation.nixos.enable = false; # .desktop
  nixpkgs = {
    config.allowUnfree = true;
    config.permittedInsecurePackages = [
      "electron-25.9.0" 
    ];

    overlays = [
      inputs.nur.overlay 
    ];
  };

  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 14d";
    };
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };  

  # dconf
  programs.dconf.enable = true;

  # packages
  environment.systemPackages = with pkgs; [
    home-manager
    neovim
    git
    wget
  ];

  # services
  services = {
    xserver = {
      enable = true;
      excludePackages = [pkgs.xterm];
      # displayManager.sddm = {
      #     enable = true;
      #     wayland.enable = true;
      #   };
    };
    printing.enable = true;
    flatpak.enable = true;
  };

  # logind
  services.logind.extraConfig = ''
    HandlePowerKey=ignore
    HandleLidSwitch=suspend
    HandleLidSwitchExternalPower=ignore
  '';

  system.stateVersion = "23.05";
}
