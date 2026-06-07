{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system.nix
    ../../modules/nvidia.nix
    ../../modules/desktop.nix
    ../../modules/packages.nix
  ];

  security.pam.services.login.enableGnomeKeyring = true;
  networking.hostName = "nixos";
  users.users.lele = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };
  system.stateVersion = "24.11";
}
