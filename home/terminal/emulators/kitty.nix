{ lib, ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      scrollback_lines = 10000;
      placement_strategy = "center";

      allow_remote_control = "yes";
      enable_audio_bell = "no";
      visual_bell_duration = "0.1";

      window_padding_width = 20;

      copy_on_select = "clipboard";

      selection_foreground = "none";
      selection_background = "none";

      # colors
      background_opacity = lib.mkForce "0.9";
    };
  };
}
