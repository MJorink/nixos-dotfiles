{ pkgs, ... }:

{
  imports =
    [
      ./modules/hardware-configuration.nix
	  ./modules/hardware.nix
      ./modules/packages.nix
      ./modules/services.nix
      ./modules/network.nix
    ];

  security.sudo.wheelNeedsPassword = false;
  security.pam.services.swaylock = {};
  
  users.users.jorink = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };

  nix.gc = {
  	automatic = true;
  	dates = "daily";
  	options = "--delete-older-than 14d";
  };

  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  time.timeZone = "Europe/Amsterdam";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "26.05";
}
