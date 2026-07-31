{ self, inputs, ... }: {
	flake.nixosModules.debloat = { lib, pkgs, ... }: {
		programs.bash.enable = false;
	};
}
