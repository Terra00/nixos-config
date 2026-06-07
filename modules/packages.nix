{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Core / System Utils
    git
    gh
    alejandra
    nil
    sops
    age
    curl
    wget
    pciutils
    usbutils
    # Modern CLI Tools
    eza
    bat
    fzf
    ripgrep
    zoxide
    fd
    nh
    nvd
    statix
  ];

environment.shellAliases = {
    rebuild-sys  = "cd ~/nixos-config && sudo nixos-rebuild switch --flake .#laptop";
    rebuild-home = "cd ~/nixos-config && home-manager switch --flake .#lele";
    rebuild-all  = "cd ~/nixos-config && sudo nixos-rebuild switch --flake .#laptop && home-manager switch --flake .#lele";
    update-all   = "cd ~/nixos-config && nix flake update && sudo nixos-rebuild switch --flake .#laptop && home-manager switch --flake .#lele";
    clean-all    = "sudo nix-collect-garbage -d && nix-collect-garbage -d && nix-store --gc";
    optimize-store = "nix-store --optimize";
    nvidia-run   = "nvidia-offload";
  };
}
