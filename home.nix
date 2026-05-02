{ config, pkgs, ... }:
let
  name = "Ean Lombardo";
  workEmail = "eanlombardo@google.com";
in
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

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

  programs.git = {
    enable = true;
    settings = {
      user.name = name;
      user.email = workEmail;
    };
  };

  programs.jujutsu = {
    enable = true;
    settings = {
      user.name = name;
      user.email = workEmail;
    };
  };

  programs.gemini-cli = {
    enable = true;
  };

  programs.vscode = {
    enable = true;
  };

  home.stateVersion = "25.11";
}
