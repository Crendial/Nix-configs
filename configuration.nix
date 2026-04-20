{ config, pkgs, inputs, zen-browser,  ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.maccel.nixosModules.default
    ];

 nix = {
   package = pkgs.nix;
   extraOptions = ''
     experimental-features = nix-command flakes
   '';
 };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ "ntsync" ];

  networking.hostName = "YOURUSER"; # Replace that.

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Helsinki"; # change if needed

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fi_FI.UTF-8";
    LC_IDENTIFICATION = "fi_FI.UTF-8";
    LC_MEASUREMENT = "fi_FI.UTF-8";
    LC_MONETARY = "fi_FI.UTF-8";
    LC_NAME = "fi_FI.UTF-8";
    LC_NUMERIC = "fi_FI.UTF-8";
    LC_PAPER = "fi_FI.UTF-8";
    LC_TELEPHONE = "fi_FI.UTF-8";
    LC_TIME = "fi_FI.UTF-8";
  };

  services.xserver.enable = false;

  programs.niri.enable = true;

  # Technically no need here but keeping it.
  services.xserver.xkb = {
    layout = "fi";
    variant = "";
  };

  console.keyMap = "fi";
  # Change based on keyboard

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "niri-session";
      user = "YOURUSER";
    };
  };

  boot.kernelParams = [ "quiet" ];
  boot.plymouth.enable = true;
 
  users.users.YOURUSER = {
    isNormalUser = true;
    description = "YOURUSER";
    extraGroups = [ "networkmanager" "wheel" "docker" "maccel" "storage" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      prismlauncher
      protonup-qt
      alacritty
      vesktop
      vscodium
    ];
  };

  programs.steam.enable = true;
  programs.fish.enable = true;

  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  programs.thunar.plugins = with pkgs; [
    thunar-archive-plugin
    thunar-volman
  ];

  nixpkgs.config.allowUnfree = true;
  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    zen-browser.packages.${pkgs.system}.default
    xwayland-satellite
    docker-compose
  ];

 nix.gc = {
   automatic = true;
   dates = "weekly";
   options = "--delete-older-than 7d";
 };

 hardware.maccel = {
    enable = true; # disable mouse acceleration by setting to false
    enableCli = true;
    parameters = {
      mode = "linear";
      sensMultiplier = 1.0;
      acceleration = 9000.0;
      offset = 3.0;
      outputCap = 2.0;
    };
  };

  services.udisks2.enable = true;

  services.gvfs.enable = true;
  security.polkit.enable = true;

  system.stateVersion = "25.11";
}
