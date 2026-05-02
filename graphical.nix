{ config, lib, pkgs, ... }:

{
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    obsidian
    google-chrome
    discord
    vscode
  ];
  
  networking.networkmanager.enable = true;
}
