{
  stdenv,
  fetchurl,
  appimageTools,
  makeWrapper,
}: let
  version = "1.19.3";
  src = fetchurl {
    url = "https://github.com/anomalyco/opencode/releases/download/v${version}/opencode-desktop-linux-x86_64.AppImage";
    sha256 = "sha256-KvLAcDuWsS5op6CDNcsH+oS2PfvZgTacKQa9JHvZSX8=";
  };
  appimageContents = appimageTools.extract {
    inherit src;
    pname = "opencode-desktop";
    version = version;
  };
in
  appimageTools.wrapType2 {
    inherit src;
    pname = "opencode-desktop";
    inherit version;
    extraInstallCommands = ''
          mkdir -p $out/share/applications
          mkdir -p $out/share/icons/hicolor/32x32/apps
          mkdir -p $out/share/icons/hicolor/64x64/apps
          mkdir -p $out/share/icons/hicolor/128x128/apps
          cat > $out/share/applications/opencode.desktop <<DESKTOP
      [Desktop Entry]
      Name=OpenCode
      Exec=opencode-desktop --no-sandbox %U
      Terminal=false
      Type=Application
      Icon=ai.opencode.desktop
      StartupWMClass=ai.opencode.desktop
      Categories=Development;
      MimeType=x-scheme-handler/opencode;
      DESKTOP
          install -m 444 ${appimageContents}/usr/share/icons/hicolor/32x32/apps/ai.opencode.desktop.png $out/share/icons/hicolor/32x32/apps/ai.opencode.desktop.png
          install -m 444 ${appimageContents}/usr/share/icons/hicolor/64x64/apps/ai.opencode.desktop.png $out/share/icons/hicolor/64x64/apps/ai.opencode.desktop.png
          install -m 444 ${appimageContents}/usr/share/icons/hicolor/128x128/apps/ai.opencode.desktop.png $out/share/icons/hicolor/128x128/apps/ai.opencode.desktop.png
    '';
  }
