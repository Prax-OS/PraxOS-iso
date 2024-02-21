{ pkgs, lib, ...}:

{

environment.systemPackages = [pkgs.xorg.xinit];

  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
    displayManager= {
      defaultSession = "xfce";
      lightdm.enable = true;
    };
  };
}
