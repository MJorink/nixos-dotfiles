{
  networking.hostName = "NixOS";
  networking.wireless = {
  	enable = true;
  	networks."Jorink-Priv".psk = "AlphaOmega2017";
  };
}
