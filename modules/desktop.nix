{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "it";
    };

    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;

    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
      # pulse.enable already defaults to true.
    };

    fprintd.enable = true;
    flatpak.enable = true;
  };

  console.keyMap = "it2";
}
