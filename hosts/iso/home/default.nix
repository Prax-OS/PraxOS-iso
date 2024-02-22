{ lib, self, inputs, ...}: {

  home = {
    username = "cmde";
    homeDirectory = "/home/cmde";
    stateVersion = "23.11";
  
    sessionPath = [ "~/.env" ];
    sessionVariables = {

    EDITOR = "hx";

    MOD = "SUPER";

    LEFT  = "n";
    DOWN  = "e";
    UP    = "i";
    RIGHT = "o";
    };
  };

  imports = [
    ./terminal
    inputs.nix-index-db.hmModules.nix-index
    self.nixosModules.theme
  ];

  var = { 
    wallpaper = ./wallpaper.jpg;
    left = "n";
  };

      programs.bash = {
      enable = true;
      initExtra = ''
        . "/etc/profiles/per-user/cmde/etc/profile.d/hm-session-vars.sh"
      '';
  };

  # disable manuals as nmd fails to build often
  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };
}
