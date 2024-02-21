{
  self,
  inputs,
  ...
}: let
  # get these into the module system
  extraSpecialArgs = {inherit inputs self;};

  homeImports = {
    "live@iso" = [
      ../.
      ./iso
    ];
  };

  inherit (inputs.hm.lib) homeManagerConfiguration;

  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in {
  # we need to pass this to NixOS' HM module
  _module.args = {inherit homeImports;};

  flake = {
    homeConfigurations = {

      "live_iso" = homeManagerConfiguration {
        modules = homeImports."live@iso";
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}
