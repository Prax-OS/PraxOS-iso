{ config, lib, pkgs, ...}:

{
  services.
  mako = {
    enable = true;
    maxVisible = 3;
    borderSize = 3;
    borderRadius = 10;
    borderColor = #f4adcd;
    backgroundColor = #121212;
    defaultTimeout = 4000;

#"top-right" "top-center" "top-left" "bottom-right"
#"bottom-center" "bottom-left" "center"
    anchor = "top-right";
  };
}
