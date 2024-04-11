{
  pkgs,
  config,
  ...
}: {
  boot = {
    # bootspec.enable = true;

    # initrd = {
      # systemd.enable = true;
      # supportedFilesystems = ["ext4"];
    # };

    # use latest kernel
    kernelPackages = pkgs.linuxPackages_latest;

    consoleLogLevel = 3;
    kernelParams = [
      "quiet"
      "loglevel=3"
      # hopefully fixing nvme issues
      "nvme_core.default_ps_max_latency_us=0"
      "pcie_aspm=off"

    ];

    loader = {
    	timeout = 7;
    	grub = {
    		enable = true;
    		devices = ["nodev"];
    		efiSupport = true;
    		useOSProber = true;
    		configurationLimit = 5;
    		default = "0";
    		extraEntries = ''
    			menuentry "Reboot" {
    				reboot
    			}
    			menuentry "Poweroff" {
    				halt
    			};
    		'';
    	};
    	efi = {
    		canTouchEfiVariables = true;
    		efiSysMountPoint = "/boot";
    	};
    };
    
    # plymouth
    plymouth = rec {
      enable = true;
      # black_hud circle_hud cross_hud square_hud
      # circuit connect cuts_alt seal_2 seal_3
      theme = "connect";
      themePackages = with pkgs; [
        (
          adi1090x-plymouth-themes.override {
            selected_themes = [ theme ];
          }
        )
      ];
    };   
  };
  environment.systemPackages = [config.boot.kernelPackages.cpupower];
}
