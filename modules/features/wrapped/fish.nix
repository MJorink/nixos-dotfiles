{ self, inputs, ... }: {
	flake.nixosModules.fish = { pkgs, lib, ... }: {
		programs.fish = {
			enable = true;
			package = self.packages.${pkgs.stdenv.hostPlatform.system}.myFish;
		};
	};


	perSystem = { pkgs, lib, ... }: {
		packages.myFish = inputs.wrapper-modules.wrappers.fish.wrap {
			inherit pkgs;
			runtimePkgs = [
				self.packages.${pkgs.stdenv.hostPlatform.system}.myStarship
				self.packages.${pkgs.stdenv.hostPlatform.system}.myYazi
				self.packages.${pkgs.stdenv.hostPlatform.system}.myGit
				self.packages.${pkgs.stdenv.hostPlatform.system}.myBtop
				pkgs.micro
				pkgs.nh
				pkgs.figlet
			];
			flags."--no-config" = false;
			shellAliases = {
				clr = "clear;~/nixos-dotfiles/modules/features/scripts/greeting.sh";
				batstat = "~/nixos-dotfiles/modules/features/scripts/batstat.sh";
				ls = "ls -a --color";
				yazi = "sudo yazi";
			};
			configFile.content = ''
			function fish_greeting
				if not status is-login
					if test -e ~/nixos-dotfiles/modules/features/scripts/greeting.sh
						~/nixos-dotfiles/modules/features/scripts/greeting.sh
					end
				end
			end

			if status is-interactive
				starship init fish | source
			end
			'';
		};
	};
}
