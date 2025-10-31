{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Simply install just the packages
  environment.packages = with pkgs; [
    # User-facing stuff that you really really want to have
    # shells
    fish

    # code editors
    vim # or some other editor, e.g. nano or neovim
    helix

    # version control
    git
    gh

    # file managers
    yazi

    # nix helpers
    nix-search-cli
    devbox
    home-manager

    # linux common
    htop
    util-linux
    busybox
    openssh
    p7zip
    fzf

    # Some common stuff that people expect to have
    #procps
    #killall
    #diffutils
    #findutils
    #utillinux
    #tzdata
    #hostname
    #man
    #gnugrep
    #gnupg
    #gnused
    #gnutar
    #bzip2
    #gzip
    #xz
    #zip
    #unzip
  ];

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "24.05";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # setup user shell
  user.shell = "${pkgs.fish}/bin/fish";

  # Set your time zone
  time.timeZone = "Asia/Jakarta";

  # setup android integration
  android-integration = {
    am = {
      enable = true;
    };
    termux-open = {
      enable = true;
    };
    termux-open-url = {
      enable = true;
    };
    termux-reload-settings = {
      enable = true;
    };
    termux-setup-storage = {
      enable = true;
    };
  };
}
