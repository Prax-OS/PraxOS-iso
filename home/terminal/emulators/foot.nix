{config, lib, ...}:

{
  programs.foot = {
    enable = true;

    settings = {
      main = {
        box-drawings-uses-font-glyphs = "yes";
        pad = "20x20 center";
        notify = "notify-send -a \${app-id} -i \${app-id} \${title} \${body}";
        selection-target = "clipboard";
      };

      scrollback = {
        lines = 10000;
        multiplier = 3;
      };

      url = {
        launch = "xdg-open \${url}";
        label-letters = "tnseriaompl";
        osc8-underline = "url-mode";
        protocols = "http, https, ftp, ftps, file";
        uri-characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.,~:;/?#@!$&%*+=\"'()[]";
      };

      cursor = {
        style = "beam";
        beam-thickness = 1;
      };

      colors =
    {
      alpha = lib.mkForce 0.9;
      background = lib.mkForce "ffffff"; # Base

      };
    };
  };
}
