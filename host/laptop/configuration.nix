{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system.nix
    ../../modules/nvidia.nix
    ../../modules/desktop.nix
    ../../modules/packages.nix
  ];

  networking.hostName = "nixos";

  security.pam.services.login.enableGnomeKeyring = true;

  users.users.lele = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  system.stateVersion = "26.05";
}
