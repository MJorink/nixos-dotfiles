{
  description = "NixOS";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mangowm = {
    	url = "github:mangowm/mango";
    	inputs.nixpkgs.follows = "nixpkgs";
    };
	fsel = {
		url = "github:Mjoyufull/fsel";
		inputs.nixpkgs.follows = "nixpkgs";
	};
  };

  outputs = { self, nixpkgs, home-manager, mangowm, fsel, ... }:
  {
    nixosConfigurations.NixOS = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        mangowm.nixosModules.mango
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.jorink = import ./home.nix;
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}
