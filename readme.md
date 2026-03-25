# What is this?
Just an archive of my personal Nix and Niri + Noctalia configs. Configuration.nix and config.kdl are built upon the base configurations.

# Features?
- Niri window manager + Noctalia shell, already mostly configured
- Zen browser as a flake
- Just software I tend to use
- An alias for updating and rebuilding the system: "update"

# Installation through Git
- Run "cd /etc/nixos"
- Run "nix-shell -p git --run "rm -f configuration.nix && git init && git remote add origin https://github.com/Crendial/Nix-configs && git pull origin main && rm -rf .git && rm -rf readme.md"
- Change all the mentions of YOURUSER to your hostname/username with "sudo nano {filename}"
- Run "sudo nixos-rebuild boot --flake /etc/nixos/"
- Reboot the system

# Manual installation
- Delete auto generated configuration with "sudo rm -f /etc/nixos/configuration.nix"
- Recreate the files with "sudo nano /etc/nixos/{filename}" and copy + pasting. This includes config.kdl
- Make sure all mentions of YOURUSER are changed to your hostname
- Run "sudo nixos-rebuild boot --flake /etc/nixos/"
- Reboot the system

# After reboot
- Run "noctalia-shell" once to initialize it, after that you can either run it again or reboot as it starts on boot
- Run fastfetch --gen-config to, you know, generate a config.

# Niri installation (another OS)
- I noticed that the Nix flake version and stuff like the AUR version differ in functionailty
- Put config.kdl into ~/.config/niri
- Look into the file with your text editor of choice, there are seperate commands for the launcher spawn keybind (Mod + Space) and Noctalia shell spawning at startup
- Assuming the defaults didn't work, uncomment the alternatives and remove/comment out the defaults

# Troubleshooting
- I haven't tested this stuff on too many systems so some things may still be problematic.
- As mentioned previously, I left in alternatives to some Noctalia based stuff, try those as needed

# Thanks for reading!
Feel free to use and fork any of this stuff, feedback always appreciated, why not improve upon this if it's public, right?
