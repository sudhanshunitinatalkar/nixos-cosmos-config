{ config, lib, pkgs, ... }:

{
  imports =
  [
    ./hardware-configuration.nix
    ./nvidia.nix
  ];

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05";

  # flakes
  # Enable flakes and the new nix command
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages;

  # Define your hostname.
  networking.hostName = "cosmos";
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;

  # Services configuration
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.printing.enable = true;
  services.pipewire.enable = true;
  services.pipewire.pulse.enable = true;
  services.openssh.enable = true;

  # localisation
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.cosmicdust =
  {
     isNormalUser = true;
     extraGroups = [ "wheel" ];
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs;
  [
    vim
    wget
    curl
    git
    kdePackages.sddm-kcm
  ];



  programs.firefox.enable = true;
  programs.kdeconnect.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPortRanges = [ { from = 1714; to = 1764; }  ];
  networking.firewall.allowedUDPPortRanges = [ { from = 1714; to = 1764; }  ];

}
