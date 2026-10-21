{ pkgs }:
{
  opencode-desktop = pkgs.callPackage ./opencode-desktop.nix { };
  filee = pkgs.callPackage ./filee.nix { };
  flc = pkgs.callPackage ./flc.nix { };
}