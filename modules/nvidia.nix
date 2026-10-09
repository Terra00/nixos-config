{
  # Hybrid Intel iGPU + NVIDIA laptop running PRIME render offload.
  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];

  hardware.nvidia = {
    # Since driver 560 the default is `null` and the module requires an explicit choice.
    open = false;

    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };
  };
}
