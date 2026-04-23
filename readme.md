# What is this?
Just an archive of my personal Nix and Niri + Noctalia configs. Configuration.nix and config.kdl are built upon the base configurations.

# Features?
- Niri window manager + Noctalia shell, already mostly configured
- Zen browser as a flake
- Just software I tend to use
- Aliases for updating and rebuilding the system: "update" (rebuild boot) and "updaten" (rebuild switch)
- Mouse acceleration through maccel
- Docker mostly ready to go
- Declaratively configured theming, plugins and their dependencies, and the bar layout

# Installation through Git
- Run "cd /etc/nixos"
- Run "nix-shell -p git --run 'sudo rm -f configuration.nix && sudo git init && sudo git remote add origin https://github.com/Crendial/Nix-configs && sudo git pull origin main && sudo rm -rf .git && sudo rm -rf readme.md'"
- Change all the mentions of YOURUSER to your hostname/username with "sudo nano {filename}" or a text editor of your choice (e.g. Kate)
- Run "sudo nixos-rebuild boot --flake /etc/nixos/"
- Reboot the system

# Manual installation
- Delete auto generated configuration with "sudo rm -f /etc/nixos/configuration.nix"
- Recreate the files with "sudo nano /etc/nixos/{filename}" and copy + pasting. This includes config.kdl
- Make sure all mentions of YOURUSER are changed to your hostname
- Run "sudo nixos-rebuild boot --flake /etc/nixos/"
- Reboot the system

# After reboot
- Replace "nixos = nixpkgs.lib.nixosSystem {" line in flake.nix to "YOURUSER = nixpkgs.lib.nixosSystem {"
- In most cases (so far) home manager refuses to activate due to conflicting files, run "sudo nixos-rebuild switch" to get the home manager error and "rm {path/to/conflicting/file}" for all files mentioned in the error trace.
- Run "noctalia-shell" once to initialize it, after that you can either run it again or reboot as it starts on boot
- Run fastfetch --gen-config to, you know, generate a config.

# Niri installation (another OS)
- I noticed that the Nix flake version and stuff like the AUR version differ in functionailty
- Put config.kdl into ~/.config/niri
- Look into the file with your text editor of choice, there are separate commands for the launcher spawn keybind (Mod + Space) and Noctalia shell spawning at startup
- Assuming the defaults didn't work, uncomment the alternatives and remove/comment out the defaults

# Troubleshooting
- I haven't tested this stuff on too many systems so some things may still be problematic.
- As mentioned previously, I left in alternatives to some Noctalia based stuff, try those as needed

# Thanks for reading!
Feel free to use and fork any of this stuff, feedback always appreciated, why not improve upon this if it's public, right?
