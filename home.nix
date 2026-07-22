{ config, ... }:

let
	dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
	create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
	configs = {
		dconf = "dconf";
		dunst = "dunst";
		foot = "foot";
		fsel = "fsel";
		"gtk-3.0" = "gtk-3.0";
		"gtk-4.0" = "gtk-4.0";
		Kvantum = "Kvantum";
		mango = "mango";
		micro = "micro";
		qt5ct = "qt5ct";
		qt6ct = "qt6ct";
		starship = "starship";
		swaylock = "swaylock";
		waybar = "waybar";
		scripts = "scripts";
	};
in

{
  home.username = "jorink";
  home.homeDirectory = "/home/jorink";
  home.stateVersion = "26.05";

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
    	set fish_greeting
    	~/.config/scripts/greeting.sh
    	starship init fish | source
    '';
    shellAliases = {
      clr = "clear;~/.config/scripts/greeting.sh";
      ls = "ls -a --color";
      nrs = "sudo nixos-rebuild switch --flake /home/jorink/nixos-dotfiles#NixOS && fsel --refresh-cache";
    };
  };
  
  xdg.configFile = builtins.mapAttrs
  	(name: subpath: {
  		source = create_symlink "${dotfiles}/${subpath}";
  		recursive = true;
  	})
  	configs;
}
