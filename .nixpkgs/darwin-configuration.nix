{ pkgs, lib, ... }:
{
  environment.variables = {
    NIX_DARWIN_CONFIG_SET="1";
  };
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [
        pkgs.ripgrep
        pkgs.vim
    ];
  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;


  programs.zsh.enable = true;
  # Fonts
  fonts.fontDir.enable = true;
  # fonts.fonts = [
  #    recursive
  #    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  #  ];

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;
  # TODO: Is this an option yet?
  # security.pam.enableSudoTouchIdAuth = true;
}
