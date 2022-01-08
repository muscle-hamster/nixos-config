{ config, pkgs, lib, ... }:

{
  home.packages = [
    pkgs.tree
    pkgs.bat
    pkgs.ripgrep
  ];

  programs.neovim = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "Brock Morrison";
    userEmail = "brock@seintofficial.com";
  };
}
