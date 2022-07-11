# Example configs
#
# https://github.com/lrewega/nix-configs/blob/nix-darwin/darwin-configuration.nix
# https://github.com/MatthiasBenaets/nixos-config/blob/master/darwin.org
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

  system = {
    defaults = {
      # NSGlobalDomain = { };
      dock = {
        autohide = true;
        orientation = "bottom";
          tilesize = int
      };
      finder = {
        AppleShowAllFiles = true;

      };
      trackpad = {
        Clicking = true;
        TrackpadRightClick = true;
      };
    };
      keyboard = {
        enableKeyMapping = true;
        remapCapsLockToEscape = true;
      };
  };

  # TODO: Is this an option yet?
  # security.pam.enableSudoTouchIdAuth = true;
}
