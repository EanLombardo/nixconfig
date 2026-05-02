{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.zsh.enable = true;
  users.users.ean = {
    isNormalUser = true;
    shell = pkgs.zsh;
  };

  home-manager.users.ean = {
    imports = [./home.nix];
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    wget
    git
    vim
    jujutsu
    github-cli
  ];

  system.stateVersion = "25.11"; 
}
