{ inputs, ... }: {
  imports = [
    inputs.hosts.nixosModule {
      networking.stevenBlackHosts.enable = true;
    }
  ];

  networking.stevenBlackHosts = {
    blockFakenews = false;
    blockGambling = true;
    blockPorn = true;
    blockSocial = false;
  };

}   
