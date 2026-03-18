{ config, pkgs, inputs, ... }:

{
  home.username = "crenu";
  home.homeDirectory = "/home/crenu";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
  
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
    fastfetch
    '';
    functions = {
    update = ''
      cd /etc/nixos
      sudo nix flake update
      sudo nixos-rebuild switch --flake /etc/nixos/#Crenu
    '';
   };
  };

  home.packages = with pkgs; [
    pkgs.fastfetch
    pkgs.nautilus
    pkgs.grim
    pkgs.slurp
    pkgs.satty
  ];

  programs.fastfetch = {
    enable = true;
  };

  programs.swaylock.enable = true;

  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia-shell.enable = true;
}
