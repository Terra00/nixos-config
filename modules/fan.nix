{
  pkgs,
  ...
}:
{
  # CoolerControl: coolercontrold daemon (with embedded web UI) + optional Qt6 desktop app.
  # It replaces the classic lm-sensors `fancontrol` service, which is deliberately NOT
  # enabled here: both would write the same PWM channels and fight over the fan speed.
  programs.coolercontrol.enable = true;

  # A few hwmon Super-I/O chips are only reachable through /dev/i2c-*.
  boot.kernelModules = [
    "i2c-dev"
  ];

  # nixpkgs only marks the unit as wanted by multi-user.target. The daemon additionally
  # needs modprobe (it auto-detects and loads it87/nct6775/w83627hf at startup), stress-ng
  # (built-in stress tests) and a state directory for its default data dir.
  systemd.services.coolercontrold = {
    path = [
      pkgs.kmod
      pkgs.stress-ng
    ];
    serviceConfig.StateDirectory = "coolercontrol";
  };
}