{ stdenv, fetchurl, appimageTools, makeWrapper }:

let
  version = "1.19.3";
  src = fetchurl {
    url = "https://github.com/anomalyco/opencode/releases/download/v${version}/opencode-desktop-linux-x86_64.AppImage";
    sha256 = "sha256-KvLAcDuWsS5op6CDNcsH+oS2PfvZgTacKQa9JHvZSX8=";
  };
  appimageContents = appimageTools.extract { inherit src; pname = "opencode-desktop"; version = version; };
in
appimageTools.wrapType2 {
  inherit src;
  pname = "opencode-desktop";
  inherit version;
  extraInstallCommands = "";
}