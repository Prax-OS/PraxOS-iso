#These modules are imported in flakes/default.nix

let
  desktop = [
    #TODO figure a way to do this without --impure
    /etc/nixos/hardware-configuration.nix
    ./core/boot.nix
    ./core/default.nix
    ./hardware/opengl.nix
    ./network/default.nix
    ./network/tailscale.nix
    ./network/adblock.nix
    ./network/nfs.nix
    ./programs
    ./services
    ./services/pipewire.nix
    ./programs/gamemode.nix
    ./programs/steam.nix
    ./services/gnome-services.nix
    ./services/location.nix
  ];

  laptop =
    desktop
    ++ [
      ./hardware/bluetooth.nix
      ./services/backlight.nix
      ./services/power.nix
    ];
  
  #A module for colemak-dh using keyd
  colemak = [./hardware/keyboard/colemak.nix]; 
  dvorak = [./hardware/keyboard/dvorak.nix];   
  
in {
  inherit desktop laptop colemak dvorak;
}
