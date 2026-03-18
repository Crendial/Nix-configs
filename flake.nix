{
  description = "flake for Crenu";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    noctalia.url = "github:noctalia-dev/noctalia-shell";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{
    self, 
    nixpkgs, 
    home-manager,
    zen-browser,
    noctalia,
    ...
   }: {
    nixosConfigurations = {
      Crenu = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; inherit zen-browser; };
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.crenu = import ./home.nix;
            home-manager.extraSpecialArgs = { inherit inputs; };
          }
        ];
      };
    };
  };
}
