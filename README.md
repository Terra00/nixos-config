# NixOS Configuration

La mia configurazione NixOS basata su Flakes.

## Stack

- NixOS Unstable
- Home Manager
- KDE Plasma 6
- NVIDIA Prime Offload
- PipeWire
- CoolerControl
- Flatpak
- SOPS-Nix

## Struttura

```text
.
├── flake.nix
├── files/
├── home/lele.nix
├── host/laptop/
└── modules/
    ├── desktop.nix
    ├── fan.nix
    ├── nvidia.nix
    ├── packages.nix
    └── system.nix
```

## Utilizzo

Formattazione del codice (alejandra, esposta come `formatter` nella flake):

```bash
nix fmt
```

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

## Ventole

Il controllo delle ventole è gestito da CoolerControl (`programs.coolercontrol` in `modules/fan.nix`): il demone `coolercontrold` rileva i chip Super-I/O e i connettori hwmon, e i profili si configurano dall'interfaccia web su `https://localhost:11987` (certificato self-signed) o dall'app desktop. Il servizio `fancontrol` di lm-sensors non è abilitato di proposito, perché i due demoni scriverebbero sugli stessi canali PWM.

## Licenza

Libera da utilizzare come fonte di ispirazione.
