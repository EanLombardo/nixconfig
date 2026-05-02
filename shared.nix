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

  environment.systemPackages = with pkgs; [
    wget
    vim
    github-cli
    git
    jujutsu
    gemini-cli
  ];

  system.stateVersion = "25.11"; 
}
