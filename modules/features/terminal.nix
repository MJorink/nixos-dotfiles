{ self, inputs, ... }: {
	flake.nixosModules.terminal = { pkgs, lib, ... }: {
		environment.systemPackages = with pkgs; [
			claude-code
			unzip
			p7zip
			wget
			fastfetch
		];
		
		environment.variables = {
			EDITOR = "micro";
			NH_FLAKE = "/home/jorink/nixos-dotfiles";
		};
	};
}
