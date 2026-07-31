{ self, inputs, ... }: {
	flake.nixosConfigurations.NixPad = inputs.nixpkgs.lib.nixosSystem {
		modules = [
			self.nixosModules.hostNixPad
		];
	};
	flake.nixosModules.hostNixPad = { lib, ... }: {
		networking.hostName = "NixPad";
		imports = [
			self.nixosModules.base
			self.nixosModules.terminal
			self.nixosModules.desktop
			self.nixosModules.debloat
		];
	};
}
