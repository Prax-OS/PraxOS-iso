{
  self,
  inputs,
  ...
}: let
  # get these into the module system
  extraSpecialArgs = {inherit inputs self;};

  homeImports = {
    "cmde@hyprland" = [
      ../.
      ./hyprland
    ];
    "cmde@gnome" = [
      ../.
      ./gnome
    ];
    "cmde@plasma" = [
      ../.
      ./plasma
    ];
    "cmde@cinnamon" = [
      ../.
      ./cinnamon
    ];
    "cmde@xfce" = [
      ../.
      ./xfce
    ];
  };

  

  inherit (inputs.hm.lib) homeManagerConfiguration;

  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in {
  # we need to pass this to NixOS' HM module
  _module.args = {inherit homeImports;};

  flake = {
    homeConfigurations = {
      "cmde_hyprland" = homeManagerConfiguration {
        modules = homeImports."cmde@hyprland";
        inherit pkgs extraSpecialArgs;
      };

      "cmde_gnome" = homeManagerConfiguration {
        modules = homeImports."cmde@gnome";
        inherit pkgs extraSpecialArgs;
      };
      
      "cmde_plasma" = homeManagerConfiguration {
        modules = homeImports."cmde@plasma";
        inherit pkgs extraSpecialArgs;
      };

      "cmde_cinnamon" = homeManagerConfiguration {
        modules = homeImports."cmde@cinnamon";
        inherit pkgs extraSpecialArgs;
      };

      "cmde_xfce" = homeManagerConfiguration {
        modules = homeImports."cmde@xfce";
        inherit pkgs extraSpecialArgs;
      };
     };
  };
}
