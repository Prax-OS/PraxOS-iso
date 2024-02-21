{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    snowflakeos-modules = {
      url = "github:snowflakelinux/snowflakeos-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    icicle = {
      url = "github:snowflakelinux/icicle";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-data = {
      url = "github:snowflakelinux/nix-data";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
    hyprland.url = "github:hyprwm/Hyprland"; 
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

  outputs = inputs:
    inputs.snowfall-lib.mkFlake rec {
      inherit inputs;
      channels-config.allowUnfree = true;

      systems.modules.nixos = with inputs; [
        nix-data.nixosModules.nix-data
        icicle.nixosModules.icicle
        snowflakeos-modules.nixosModules.gnome
        snowflakeos-modules.nixosModules.kernel
        snowflakeos-modules.nixosModules.networking
        snowflakeos-modules.nixosModules.pipewire
        snowflakeos-modules.nixosModules.printing
        snowflakeos-modules.nixosModules.snowflakeos
        snowflakeos-modules.nixosModules.metadata
      ];

      src = ./.;
    };
}
