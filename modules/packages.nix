{ lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "spotify"
      "steam"
      "steam-unwrapped"
      "claude-code"
   ];
	
  programs.mango.enable = true;
  programs.steam.enable = true;
  programs.waybar.enable = true;
  programs.fish.enable = true;
  programs.dconf.enable = true;

  programs.thunar = {
  	enable = true;
	plugins = with pkgs; [
		thunar-archive-plugin
	];
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-wlr ];
  };
  
  environment.systemPackages = with pkgs; [
	brightnessctl
	btop
	claude-code
	cliphist
	dunst
	figlet
	file-roller
	foot
	fsel
	git
	git-credential-oauth
	grim
	librewolf
	micro
	nwg-look
	p7zip
	parole
	ristretto
	slurp
	spotify
	starship
	swaybg
	swaylock
	unzip
	wget
	wl-clip-persist
	wl-clipboard
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.terminess-ttf
    nerd-fonts.ubuntu
    nerd-fonts.ubuntu-mono
  ];
}
