{pkgs, ...}:
{
  imports = [
  # ./gnome.nix
  ];

  environment.systemPackages = with pkgs; [

    sunshine


  ];  

}
