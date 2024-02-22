{
  pkgs,
  inputs,
  ...
}:
# games
{
  home.packages = with pkgs; [
    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    gamescope
    prismlauncher
    # (lutris.override {extraPkgs = p: [p.libnghttp2];})
    winetricks
     retroarch
    retroarch-assets
    retroarch-joypad-autoconfig
     (retroarch.override {
        cores = with libretro; [
          beetle-lynx
          beetle-ngp
          beetle-pce-fast
          beetle-pcfx
          beetle-psx-hw
          beetle-supergrafx
          beetle-vb
          beetle-wswan
          blastem
          bsnes
          citra
          desmume
          dosbox
          flycast
          mame
          melonds
          mgba
          mesen
          parallel-n64
          ppsspp
          sameboy
          stella
          swanstation
          yabause
        ];
      }
    )
  ];
}
