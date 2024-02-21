#These modules are imported in flakes/default.nix

let
  iso = [
    ./configuration.nix
    ../../system/core/hardware-configuration.nix
    ../../system/core/boot.nix
    ../../system/core/default.nix
    ../../system/hardware/opengl.nix
    ../../system/network/default.nix
    ../../system/network/tailscale.nix
    ../../system/network/adblock.nix
    ../../system/network/nfs.nix
    ../../system/programs
    ../../system/services
    ../../system/services/pipewire.nix
    ../../system/programs/gamemode.nix
    ../../system/programs/steam.nix
    ../../system/services/gnome-services.nix
    ../../system/services/location.nix
    ../../system/hardware/bluetooth.nix
    ../../system/services/backlight.nix
    ../../system/services/power.nix
    ];
  
  #A module for colemak-dh using keyd
  
in {
  inherit iso;
}
