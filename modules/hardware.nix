{ pkgs, ... }:

{
  hardware.cpu.x86.msr.enable = true;
  hardware.graphics.enable = true;

  environment.systemPackages = with pkgs; [
    intel-compute-runtime-legacy1
    intel-media-driver
  ];
}
