
#TODO change all instances of "cmde" to your username
###this file can be left alone unless you know what you are
###doing and want to add more desktop environments

{
  self,
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
    inherit (import "${self}/system") desktop laptop colemak dvorak;

    # get these into the module system
    specialArgs = {inherit inputs self;};
  in {
    hyprland = nixosSystem {
      inherit specialArgs;
      modules =
        laptop
        ++
        colemak
        ++ [
          "${mod}/services/greetd.nix"
          "${mod}/desktops/hyprland.nix"

          {
            networking.hostName = "hyprland";
            home-manager = {
              users.cmde.imports = homeImports."cmde@hyprland";
              extraSpecialArgs = specialArgs;
          };
        }
          inputs.agenix.nixosModules.default
      ];
    };

     gnome = nixosSystem {
       inherit specialArgs;
       modules =
        laptop
         ++
        colemak
         ++ [
          "${mod}/desktops/gnome.nix"

          {
            networking.hostName = "gnome";
            home-manager = {
              users.cmde.imports = homeImports."cmde@gnome";
              extraSpecialArgs = specialArgs;
          };
        }
          inputs.agenix.nixosModules.default
      ];
    };

     cinnamon = nixosSystem {
       inherit specialArgs;
       modules =
         laptop
         ++ [
          "${mod}/desktops/cinnamon.nix"

          {
            networking.hostName = "cinnamon";
            home-manager = {
              users.cmde.imports = homeImports."cmde@cinnamon";
              extraSpecialArgs = specialArgs;
            };
          }
          inputs.agenix.nixosModules.default
        ];
      };
     plasma = nixosSystem {
       inherit specialArgs;
       modules =
         laptop
         ++ [
          "${mod}/desktops/plasma.nix"

          {
            networking.hostName = "plasma";
            home-manager = {
              users.cmde.imports = homeImports."cmde@plasma";
              extraSpecialArgs = specialArgs;
            };
          }
          inputs.agenix.nixosModules.default
        ];
      };
     xfce = nixosSystem {
       inherit specialArgs;
       modules =
         laptop
         ++ [
          "${mod}/desktops/xfce.nix"

          {
            networking.hostName = "xfce";
            home-manager = {

              users.cmde.imports = homeImports."cmde@xfce";
              extraSpecialArgs = specialArgs;
            };
          }
          inputs.agenix.nixosModules.default
        ];
     };
       iso = nixosSystem {
       inherit specialArgs;
       modules =
         laptop
         ++ [
          "${mod}/desktops/gnome.nix"

          {
            networking.hostName = "iso";
            home-manager = {
              users.cmde.imports = homeImports."cmde@iso";
              extraSpecialArgs = specialArgs;
          };
        }
          inputs.agenix.nixosModules.default
      ];
    };
  };
}
