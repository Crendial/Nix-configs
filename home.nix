{ config, pkgs, inputs, lib, ... }:

{
  home.username = "YOURUSER";
  home.homeDirectory = "/home/YOURUSER";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  home.activation.removeConflictingConfigs = lib.hm.dag.entryBefore ["writeBoundary"] ''
  rm -f \
    "${config.home.homeDirectory}/.config/gtk-4.0/settings.ini" \
    "${config.home.homeDirectory}/.config/gtk-3.0/settings.ini" \
    "${config.home.homeDirectory}/.config/fish/config.fish" \
    "${config.home.homeDirectory}/.config/niri/config.kdl" \
    "${config.home.homeDirectory}/.gtkrc-2.0"
  '';

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
    fastfetch
    '';
    functions = {
    update = ''
      cd /etc/nixos
      sudo nix flake update
      sudo nixos-rebuild boot --flake /etc/nixos/
    '';
   };
  };

  home.packages = with pkgs; [
    fastfetch
    wl-clipboard
  ];

programs.fastfetch = {
    enable = true;
  };

services.cliphist.enable = true;

 programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      screenshots = true;
      clock = true;
      indicator = true;
      indicator-radius = 100;
      indicator-thickness = 7;
      effect-blur = "7x5";
      effect-vignette = "0.5:0.5";
      color = "1e1e2ecc";
      ring-color = "cba6f7";
      key-hl-color = "a6e3a1";
      text-color = "cdd6f4";
      line-color = "00000000";
      inside-color = "1e1e2e88";
      separator-color = "00000000";
      fade-in = 0;
    };
  };

  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia-shell.enable = true;

  home.file.".config/niri/config.kdl".source = ./config.kdl;

  programs.git = {
    enable = true;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
  gtk4 = {
        theme = null;
      };
  };

}
