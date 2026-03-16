{ config, pkgs, inputs, ... }:

{
  home.username = "crenu";
  home.homeDirectory = "/home/crenu";
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
      update = "sudo nix flake update /etc/nixos/ && sudo nixos-rebuild switch --flake /etc/nixos/";
    };
  };
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia-shell.enable = true;
}

