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

  networking.hostName = "YOURUSER"; # Replace that.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Helsinki"; # change if needed

  # Select internationalisation properties.
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
 
  # Change Locale stuff if you're from somewhere else.

  # You can enable this if you still use X11.
  services.xserver.enable = false;

  programs.niri.enable = true;

  # Configure keymap in X11
  # Technically no need here but keeping it.
  services.xserver.xkb = {
    layout = "fi";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "fi";
  # Change based on keyboard

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
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
 
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.YOURUSER = {
    isNormalUser = true;
    description = "YOURUSER";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      pkgs.prismlauncher
      pkgs.protonup-qt
      pkgs.alacritty
      pkgs.vesktop
      pkgs.vscodium
    ];
  };

  programs.steam.enable = true;
  programs.fish.enable = true;
  nixpkgs.config.allowUnfree = true;
  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    zen-browser.packages.${pkgs.system}.default
    xwayland-satellite
    docker-compose
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

 nix.gc = {
   automatic = true;
   dates = "weekly";
   options = "--delete-older-than 7d";
 };

 hardware.maccel = {
    enable = true;
    enableCli = true;
    parameters = {
      mode = "linear";
      sensMultiplier = 1.0;
      acceleration = 9000.0;
      offset = 3.0;
      outputCap = 2.0;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
