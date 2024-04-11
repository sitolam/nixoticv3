{pkgs, ...}: {
  imports = [
    ./zathura.nix
    ./vscode.nix
  ];

  home.packages = with pkgs; [
    betterbird
    libreoffice
    onlyoffice-bin
    #   obsidian
    xournalpp
  ];
}
