{
  pkgs,
  lib,
  ...
}: 

{
  #Anki
  # home.activation = {
  #   anki = lib.hm.dag.entryAfter ["writeBoundary"] ''
  #   run wget https://github.com/Sitolam/nixosbox/releases/download/v1.0.0/anki_plugins.7z \
  #     7z x anki_plugins.7z
  #     mkdir -p ~/.local/share/Anki2
  #     cp -r addons21 ~/.local/share/Anki2
  #   '';
  # };
  home.packages = with pkgs; [
    anki-bin
    flowtime
  ];

}
