{ stdenv, fetchurl, autoPatchelfHook, makeWrapper, glib, nss, nspr, atk, at-spi2-atk, cups, dbus, expat, libdrm, libxkbcommon, mesa, xorg, gtk3, pango, cairo, alsa-lib, libinput, icu, openssl }:

let
  version = "2.0.0";
  src = fetchurl {
    url = "https://github.com/KnifeLemon/Filee/releases/download/v${version}/Filee-${version}-linux-x64.tar.gz";
    sha256 = "sha256-40pvlGT6w6903WRq9U16dc/6ywZPvhHZhwGodOaKFwo=";
  };
in
stdenv.mkDerivation {
  pname = "filee";
  inherit version src;
  nativeBuildInputs = [ autoPatchelfHook makeWrapper ];
  buildInputs = [ glib nss nspr atk at-spi2-atk cups dbus expat libdrm libxkbcommon mesa xorg.libX11 xorg.libXcomposite xorg.libXdamage xorg.libXext xorg.libXfixes xorg.libXrandr xorg.libXt xorg.libXtst libinput gtk3 pango cairo alsa-lib icu openssl ];
  autoPatchelfIgnoreMissingDeps = [ "liblttng-ust.so.0" ];
  installPhase = ''
    mkdir -p $out/bin $out/opt/filee
    cp -r ./* $out/opt/filee/
    makeWrapper $out/opt/filee/Filee $out/bin/filee --set DOTNET_SYSTEM_GLOBALIZATION_INVARIANT 1 --set DOTNET_OPENSSL_VERSION_OVERRIDE 3
  '';
}