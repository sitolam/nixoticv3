{ lib, ... }: {

  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
    wifi.powersave = true;
  };

  services = {
    openssh = {
      enable = true;
      settings.UseDns = true;
    };

    # DNS resolver
    resolved.enable = true;
  };



  # Firewall
  
  # kde connect
  networking.firewall = rec {
    enable = false;
    allowedTCPPortRanges = [{ from = 1714; to = 1764; } 47984 47989 47990 48010 ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };


}
