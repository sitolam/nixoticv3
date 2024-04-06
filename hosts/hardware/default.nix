{
  self,
  # inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./powersave.nix
    ./nvidia.nix
    ./boot.nix
    ./security.nix
    ./bluetooth.nix
  ];

  #  age.secrets.spotify = {
  #    file = "${self}/secrets/spotify.age";
  #    owner = "mihai";
  #    group = "users";
  #  };

  hardware = {
    enableRedistributableFirmware = true;
    opentabletdriver.enable = true;
    xpadneo.enable = true;
  };


  # security.tpm2.enable = true;

  services = {
    fwupd.enable = true;
    # for SSD/NVME
    fstrim.enable = true;

    # howdy = {
    #   enable = true;
    #   package = inputs.nixpkgs-howdy.legacyPackages.${pkgs.system}.howdy;
    #   settings = {
    #     core = {
    #       no_confirmation = true;
    #       abort_if_ssh = true;
    #     };
    #     video.dark_threshold = 90;
    #   };
    # };

    # linux-enable-ir-emitter = {
    #   enable = true;
    #   package = inputs.nixpkgs-howdy.legacyPackages.${pkgs.system}.linux-enable-ir-emitter;
    # };
  };
}
