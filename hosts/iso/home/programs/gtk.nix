{
  pkgs,
  ...
}: {

  gtk = {
    enable = true;
    iconTheme.package = pkgs.papirus-icon-theme;
    iconTheme.name = "Papirus-Dark";
  };

  home.packages = with pkgs; [
    libsForQt5.breeze-qt5
    papirus-icon-theme
  ];
}
