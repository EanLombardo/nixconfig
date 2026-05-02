{ config, pkgs, ... }:
{
  # Install zsh and starship
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };

  # Configure starship prompt
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$all";
    };
  };

  home.stateVersion = "25.11";
}
