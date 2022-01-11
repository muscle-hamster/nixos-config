{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    tree
    bat
    ripgrep
    rofi
    htop
    watch
    fzf
  ];

  programs.zsh = {
    enable = true;
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
      ];
    };
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };

  # fonts.fontconfig = {
    # enable = true;
  # };

  home.sessionVariables = {
    LANG="en_US.UTF-8";
    EDITOR="vim";
  };

  programs.neovim = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "Brock Morrison";
    userEmail = "brock@seintofficial.com";

    extraConfig = {
      color.ui = true;
    };
  };

  # programs.i3status = {
    # modules = {
      # ipv6.enable = false;
      # "battery all".enable = false;
    # };
  # };
}
