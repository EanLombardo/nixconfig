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
      credential.helper = [ "cache --timeout 21600" ];
    };
  };

  programs.git-credential-oauth.enable = true;

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
    profiles.default = {
      extensions = [
        pkgs.vscode-extensions.dracula-theme.theme-dracula
        pkgs.vscode-extensions.vscodevim.vim
        pkgs.vscode-extensions.yzhang.markdown-all-in-one
        pkgs.vscode-extensions.bbenoist.nix
        (pkgs.vscode-utils.extensionFromVscodeMarketplace {
          name = "open-jj";
          publisher = "olup";
          version = "0.0.16";
          sha256 = "h9pm9CGPZXrpKpJm7w8lmiloUD7w7Qch4YDLGbRIg68=";
        })

      ];
      userSettings = {
        "git.enabled" = false;
      };
    };
  };


  home.stateVersion = "25.11";
}
