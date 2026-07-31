{ self, inputs, ... }: {
	flake.nixosModules.base = {
		imports = [
			inputs.preservation.nixosModules.default
		];

		systemd.suppressedSystemUnits = [ "systemd-machine-id-commit.service" ];
		
		preservation = {
			enable = true;
			preserveAt."/persistent" = {
				directories = [
					"/var/lib/bluetooth"
					"/etc/NetworkManager/system-connections"
					"/etc/mullvad-vpn"
					{ directory = "/var/lib/nixos"; inInitrd = true; }
				];
				
				files = [
					{ file = "/etc/machine-id"; inInitrd = true; }
				];

				users = {
					jorink = {
						directories = [
							"nixos-dotfiles"
							"Downloads"
							"Documents"
							".ssh"
							".claude"
							".config/librewolf"
							".config/spotify"
							".config/micro"
							".config/Mullvad VPN"
							".local/state/noctalia"
							".local/state/wireplumber"
							".local/share/zsh"
							".local/share/keyrings"
							".local/share/me.proton.authenticator"
						];
						files = [
							".claude.json"
						];
					};
					root = {
						home = "/root";
						directories = [
							".ssh"
						];
						files = [
							"example"
						];
					};
				};
			};
		};		
	};
}
