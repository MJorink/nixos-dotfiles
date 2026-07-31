{ self, inputs, ... }: {
	flake.nixosModules.base = { pkgs, ... }: {
		users.users = {
			jorink = {
				isNormalUser = true;
				#initialPassword = "12345"; # For system setup
				hashedPasswordFile = "/persistent/passwd";
				extraGroups = [ "wheel" "networkmanager" ];
				shell = pkgs.fish;
			};
		};
	};
}
