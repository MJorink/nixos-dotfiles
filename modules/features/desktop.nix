{ self, inputs, ... }: {
	flake.nixosModules.desktop = { pkgs, lib, ... }: {
		imports = [
			self.nixosModules.mango
		];
		
		environment.systemPackages = with pkgs; [
			librewolf
			spotify
			proton-authenticator
			mpv
			bibata-cursors
			prismlauncher
		];
		
		fonts.packages = with pkgs; [
			nerd-fonts.ubuntu
			nerd-fonts.ubuntu-mono
		];

		services.mullvad-vpn.gui.enable = true;
		services.displayManager.ly.enable = true;
		services.pipewire.enable = true;
		services.pipewire.pulse.enable = true;
	};
}
