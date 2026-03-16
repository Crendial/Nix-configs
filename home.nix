{ config, pkgs, inputs, ... }:

{
  home.username = "nixtest67";
  home.homeDirectory = "/home/nixtest67";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
  
  programs.fish = {
    enable = true;
  };

  home.packages = with pkgs; [
    pkgs.fastfetch
    pkgs.nautilus
  ];

  programs.fastfetch = {
    enable = true;
  };
  
  home = {
    shellAliases = {
      update = "nix flake update /etc/nixos#CrenuNix && sudo nixos-rebuild switch --flake /etc/nixos#CrenuNix";
    };
  };
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia-shell.enable = true;
}

