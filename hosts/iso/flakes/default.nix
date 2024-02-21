
#TODO change all instances of "cmde" to your username
###this file can be left alone unless you know what you are
###doing and want to add more desktop environments

{
  self,
  nixpkgs,
  inputs,
  homeImports,
  ...
}: {
  flake.nixosConfigurations = let
    # shorten paths
    inherit (inputs.nixpkgs.lib) nixosSystem;

    #Set to your system as per nixos-hardware on github    
    mod = "${self}/system";

    # get the basic config to build on top of
    inherit (import "${self}/system") iso;

    # get these into the module system
    specialArgs = {inherit inputs self;};
  in {
     iso = nixosSystem {
       inherit specialArgs;
       modules =
         iso
         ++ [
        "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome.nix"
        "${nixpkgs}/nixos/modules/installer/cd-dvd/channel.nix"
        "${mod}/system/configuration.nix"
        "${mod}/desktops/gnome.nix"

          {
            networking.hostName = "iso";
            home-manager = {
              users.live.imports = homeImports."live@iso";
              extraSpecialArgs = specialArgs;
          };
        }
          inputs.agenix.nixosModules.default
      ];
    };
  };
}
