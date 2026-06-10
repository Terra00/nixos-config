{ pkgs, ... }:
{
  home.username = "lele";
  home.homeDirectory = "/home/lele";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    kdePackages.kate
    obsidian
    _64gram
    bitwarden-desktop
    vlc
    google-chrome
    fastfetch
    ani-cli
    firefox
  ];

  programs.git = {
    enable = true;
    settings.user = {
      name = "Terra00";
      email = "terracciano.raffaele00@gmail.com";
    };
  };

  programs.firefox = {
    enable = true;
    profiles.lele = {
      isDefault = true;
      settings = {
        "browser.aboutConfig.showWarning" = false;
        "browser.startup.homepage" = "about:home";
      };
    };
  };
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
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
}
