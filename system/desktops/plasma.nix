{ pkgs, lib, ...}:

{

  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      plasma.enable = true;
    };
    displayManager= {
      defaultSession = "plasma-wayland";
      sddm.enable = true;
    };
  };

  qt.platformTheme = lib.mkForce "kde";

}
