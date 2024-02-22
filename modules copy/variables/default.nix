{lib, ...}: {
  options.var = {

    wallpaper = lib.mkOption {
      description = ''
        Location of the wallpaper to use throughout the system.
      '';
      type = lib.types.path;
      example = lib.literalExample "./wallpaper.png";
    };
  
    left = lib.mkOption {
      description = ''
        Location of the wallpaper to use throughout the system.
      '';
      type = lib.types.string;
      example = lib.literalExample "h";
    };
  
  };
}
