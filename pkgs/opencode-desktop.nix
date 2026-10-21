{ stdenv, fetchurl, appimageTools, makeWrapper }:

let
  version = "1.19.3";
  src = fetchurl {
    url = "https://github.com/anomalyco/opencode/releases/download/v${version}/opencode-desktop-linux-x86_64.AppImage";
    sha256 = "sha256-KvLAcDuWsS5op6CDNcsH+oS2PfvZgTacKQa9JHvZSX8=";
  };
  appimageContents = appimageTools.extractType2 { inherit src; };
in
appimageTools.wrapType2 {
  inherit src;
  pname = "opencode-desktop";
  inherit version;
  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/opencode.desktop $out/share/applications/opencode.desktop
    install -m 444 -D ${appimageContents}/opencode.png $out/share/icons/hicolor/512x512/apps/opencode.png
  '';
}