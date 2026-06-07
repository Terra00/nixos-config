{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Europe/Rome";
  i18n.defaultLocale = "it_IT.UTF-8";

  networking.networkmanager.enable = true;
  hardware.enableAllFirmware = true;
  nixpkgs.config.allowUnfree = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age = {
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = false;
    };
  };
}
