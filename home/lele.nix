{
  pkgs,
  ...
}:
{
  home = {
    username = "lele";
    homeDirectory = "/home/lele";
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;

  home.packages = [
    # Editors / viewers
    pkgs.kdePackages.kate
    pkgs.obsidian
    pkgs.foliate
    pkgs.stirling-pdf-desktop

    # Browsers (firefox comes from programs.firefox)
    pkgs.google-chrome

    # Communication
    pkgs._64gram
    pkgs.bitwarden-desktop

    # Media
    pkgs.vlc
    pkgs.ani-cli

    # Office
    pkgs.onlyoffice-desktopeditors

    # System monitoring
    pkgs.kdePackages.ksystemstats
    pkgs.kdePackages.plasma-thunderbolt

    # Misc
    pkgs.fastfetch
  ];

  programs = {
    git = {
      enable = true;
      settings.user = {
        name = "Terra00";
        email = "terracciano.raffaele00@gmail.com";
      };
    };

    firefox = {
      enable = true;
      profiles.lele = {
        isDefault = true;
        settings = {
          "browser.aboutConfig.showWarning" = false;
          "browser.startup.homepage" = "about:home";
        };
      };
    };

    vscode = {
      enable = true;
      profiles.default = {
        extensions = with pkgs.vscode-extensions; [
          jnoortheen.nix-ide
          mkhl.direnv
          arrterian.nix-env-selector
        ];
        userSettings = {
          "nix.enableLanguageServer" = true;
          "nix.serverPath" = "nil";
          "editor.formatOnSave" = true;
          "git.confirmSync" = false;
          "git.enableSmartCommit" = true;
        };
      };
    };
  };

  xdg.configFile."fastfetch" = {
    source = ../files/fastfetch;
    recursive = true;
  };
}
