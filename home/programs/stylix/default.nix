{ pkgs, inputs, config, ... }:{

imports = [inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    image = "${config.var.wallpaper}";
    base16Scheme = ./pinku.yaml;

    opacity.terminal = 0.9;


    polarity = "dark";

    cursor = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
      size = 48;
      };

    fonts = {
      serif = {
        name = "Inter";
        package = (pkgs.google-fonts.override {fonts = ["Inter"];});
      };

      sansSerif = {
        name = "Inter";
        package = (pkgs.google-fonts.override {fonts = ["Inter"];});
      };

      monospace = {
        name = "JetbrainsMono Nerd Font";
        package = (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];});
        };
        
      sizes = {        
        applications = 14;
        desktop = 11;
      };
    };    
  };
}
