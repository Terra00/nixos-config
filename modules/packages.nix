{
  pkgs,
  ...
}:
{
  environment.systemPackages = [
    # Core
    pkgs.git
    pkgs.gh
    pkgs.curl
    pkgs.wget
    pkgs.pciutils
    pkgs.usbutils

    # Nix tooling
    pkgs.alejandra
    pkgs.nh
    pkgs.nil
    pkgs.nvd
    pkgs.statix
    pkgs.age
    pkgs.sops

    # Modern CLI replacements
    pkgs.eza
    pkgs.bat
    pkgs.fzf
    pkgs.zoxide
    pkgs.ripgrep
    pkgs.fd
  ];

  environment.shellAliases = {
    rebuild-sys = "cd ~/nixos-config && sudo nixos-rebuild switch --flake .#laptop";
    rebuild-home = "cd ~/nixos-config && home-manager switch --flake .#lele";
    rebuild-all = "cd ~/nixos-config && sudo nixos-rebuild switch --flake .#laptop && home-manager switch --flake .#lele";
    update-all = "cd ~/nixos-config && nix flake update && sudo nixos-rebuild switch --flake .#laptop && home-manager switch --flake .#lele";
    clean-all = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
    optimize-store = "nix-store --optimize";
    nvidia-run = "nvidia-offload";
  };
}
