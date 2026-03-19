# What is this?
Just an archive of my personal Nix and Niri + Noctalia configs. Configuration.nix and config.kdl are built upon the base configurations.

# Features?
- Niri window manager + Noctalia shell, already mostly configured
- Zen browser as a flake
- Just software I tend to use
- An alias for updating and rebuilding the system: "update"

# Installation (NixOS)
- Read through .nix files and at the very least change every part that says YOURUSER to your actual user
- Copy and paste the .nix files into /etc/nixos/
- run "sudo nixos-rebuild switch --flake /etc/nixos/"
- If that doesn't work, change "switch" into "boot" and restart
- Run a Niri session and change the base config.kdl to the one provided
- Run "noctalia-shell" once to initialize it, after that you can either run it again or reboot as it starts on boot
- Run fastfetch --gen-config to, you know, generate a config.

# Installation (Another OS)
This section exists just for the Niri config.
- I noticed that the Nix flake version and stuff like the AUR version differ in functionailty
- Look into config.kdl, there are seperate commands for the launcher spawn keybind (Mod + Space) and Noctalia shell spawning at startup
- Assuming the defaults didn't work, uncomment the alternatives and remove/comment out the defaults
- Should be the same otherwise.

# Troubleshooting
- I haven't tested this stuff on too many systems so some things may still be problematic.
- As mentioned previously, I left in alternatives to some Noctalia based stuff, try those as needed

# Thanks for reading!
Feel free to use and fork any of this stuff, feedback always appreciated, why not improve upon this if it's public, right?
