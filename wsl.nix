{ config, lib, pkgs, ... }:

{
  wsl.enable = true;
  wsl.defaultUser = "ean";
  programs.nix-ld.enable = true;
}
