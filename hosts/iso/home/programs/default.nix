{pkgs, ...}: {
  imports = [
    ./browsers/firefox.nix
    ./media
    ./gtk.nix
    ./office
    #./stylix/stylix.nix
  ];

  #theme.wallpaper = ./wallpaper.jpg;
  home = {
    
    packages = with pkgs; [
      #YOU NEED TO ADD NFS MODULE TO HARDWARE-CONFIGURATION.nix#
      nfs-utils

      gimp
      krita
      inkscape
      shotwell

      remmina
      nextcloud-client
      protonmail-bridge
      thunderbird
      tdesktop
      zoom-us
    ];
  };
}
