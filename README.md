# NixOS Configuration

La mia configurazione NixOS basata su Flakes.

## Stack

- NixOS Unstable
- Home Manager
- KDE Plasma 6
- NVIDIA Prime Offload
- PipeWire
- Flatpak
- SOPS-Nix

## Struttura

```text
.
├── flake.nix
├── home/
├── host/
└── modules/
```

## Utilizzo

Ricostruzione del sistema:

```bash
sudo nixos-rebuild switch --flake .#laptop
```

Ricostruzione Home Manager:

```bash
home-manager switch --flake .#lele
```

## Note

Questa configurazione è pensata per un laptop con grafica ibrida Intel + NVIDIA e utilizza SOPS-Nix per la gestione dei segreti.

## Licenza

Libera da utilizzare come fonte di ispirazione.
