{ config, lib, pkgs, ... }:

{

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.zsh.enable = true;
  users.users.ean = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = ["wheel"];
  };

  home-manager.users.ean = {
    imports = [./home.nix];
  };

  environment.systemPackages = with pkgs; [
    wget
    vim
    github-cli
    git
    jujutsu
    gemini-cli
  ];

  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";

  system.stateVersion = "25.11"; 
}
