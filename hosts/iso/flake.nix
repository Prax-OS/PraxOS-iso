{
  description = "PravdaOS flake and home-manager settings";

#This is the main flake (a sort of config file) of the system. In short, the inputs and outputs are managed here.
#Inputs are links to repositories, such as the NixOS repositories (nixpkgs) and other flakes added as modules.
#Outputs send the prudent information from the inputs to other configuration files in our flake.

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];
      #this section pulls in the configurations held in the below folders. When a folder is imported, nix will look
      #for a default.nix inside. You can also specify an individual .nix file this way. Allows for extreme modularity.
     
      imports = [
        ./home/desktops
        ./flakes
        ./modules
      ];
    };

  #Below are all the flakes referenced throughout the config, more can be easily added.
  #However, if any are removed you will need to remove any reference to it from all of
  #of the config files.
  
  inputs = {

    #Do not be alarmed by the term "unstable", NixOS is stable regardless.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    #Manages keys for github, ssh, etc.
    agenix = { 
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "hm";
    };  

    #provides flakes for specific hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    
    #universal theming tool
    stylix = { url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
      
    #adblock and content filtering via DNS
    hosts.url = "github:StevenBlack/hosts";

    #Provides the functionality we need to easily switch desktop environments
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    fu.url = "github:numtide/flake-utils";

    #Home-Manager allows declarative configuration of config files
    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #A wrapper for nix commands, provides more intersting output when rebuilding
    nh = {
      url = "github:viperML/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-db = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #provides nice things like low-latancy audio
    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.flake-parts.follows = "flake-parts";
    };

    helix.url = "github:helix-editor/helix";
    
  };
}
