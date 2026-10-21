{ stdenv, fetchurl, appimageTools }:

let
  version = "8.0.0";
  src = fetchurl {
    url = "https://github.com/phenomen/flc/releases/download/flc-v${version}/FLC_${version}_amd64.AppImage";
    sha256 = "sha256-hIR+KMfmzsXhYDbTJh9KKpJilKUMWWobDtsdxGGPMKQ=";
  };
in
appimageTools.wrapType2 {
  inherit src;
  pname = "flc";
  inherit version;
}