{ self, inputs, ... }: {
	flake.nixosModules.base = {
		services = {
			auto-cpufreq = {
				enable = true;
				settings.charger = {
					governor = "performance";
					turbo = "auto";
				};
				settings.battery = {
					governor = "powersave";
					turbo = "never";
				};
			};
			mullvad-vpn.enable = true;
		};
	};
}
