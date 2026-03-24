{ config, pkgs, inputs, ... }:

{
  home.username = "YOURUSER";
  home.homeDirectory = "/home/YOURUSER";
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
      sudo nixos-rebuild switch --flake /etc/nixos/#YOURUSER
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
