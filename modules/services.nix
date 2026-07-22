{ pkgs, ... }:

{
  services.pipewire = {
     enable = true;
     pulse.enable = true;
   };

  services.displayManager.ly.enable = true;

  services.tumbler.enable = true;

  services.undervolt = {
  	enable = true;
  	coreOffset = -80;
  	uncoreOffset = -80;
  	gpuOffset = -80;
  	temp = 90;
  	useTimer = true;
  };
  
  services.auto-cpufreq = {
  	enable = true;
  	settings = {
  		charger = {
  			governor = "performance";
  			turbo = "auto";
  		};
  		battery = {
  			governor = "powersave";
  			turbo = "never";
  		};
  	};
  };

  services.mullvad-vpn = {
  	enable = true;
  	package = pkgs.mullvad-vpn;
  };
}
