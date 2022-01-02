{ config, pkgs, lib, ... }:

{
  home.packages = [
    pkgs.tree
    pkgs.bat
  ];

  programs.git = {
    enable = true;
    userName = "Brock Morrison";
    userEmail = "brock@seintofficial.com";
  };
}
