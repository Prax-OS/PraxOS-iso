{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    ./nh.nix
    ./nixpkgs.nix
    ./substituters.nix
  ];

                nixpkgs.config.permittedInsecurePackages = [
                "pulsar-1.109.0"
              ];

  # we need git for flakes
  environment.systemPackages = [pkgs.git];

  # Limit number of boot entries
  boot.loader.systemd-boot.configurationLimit = 10;

  nix = {
    # pin the registry to avoid downloading and evaling a new nixpkgs version every time
    registry = lib.mapAttrs (_: v: {flake = v;}) inputs;

    # set the path for channels compat
    nixPath = lib.mapAttrsToList (key: _: "${key}=flake:${key}") config.nix.registry;

    #Get rid of old setups
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };

    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      experimental-features = ["nix-command" "flakes"];
      flake-registry = "/etc/nix/registry.json";
      trusted-users = ["root" "@wheel"];
    };
  };
}
