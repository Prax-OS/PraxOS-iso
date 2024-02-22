{ pkgs, ... }:

{
  imports = [
    ./bat.nix
    ./cli.nix
    ./git.nix
    ./skim.nix
    ./transient-services.nix
    ./yazi
  ];

home.packages = with pkgs; [
    calcurse
    zsh-powerlevel10k   
    ];

#modern "top" replacement, shows running processes and resource usage
programs.btop = {
    enable = true;
  };

}
