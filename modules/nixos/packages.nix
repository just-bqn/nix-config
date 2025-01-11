{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.anki-bin
    pkgs.caprine
    pkgs.discord
    pkgs.libreoffice-qt
    pkgs.mpv
    pkgs.obs-studio
    pkgs.obsidian
    pkgs.qbittorrent
    # pkgs.zen-browser

    pkgs.betterdiscordctl
    pkgs.cachix
    pkgs.devenv
    pkgs.fastfetch
    pkgs.fd
    pkgs.ffmpeg
    pkgs.git
    pkgs.hyfetch
    pkgs.nix-tree
    pkgs.p7zip
    pkgs.progress
    pkgs.rclone
    pkgs.ripgrep
    pkgs.rofimoji
    pkgs.tdf
    pkgs.texliveFull
    pkgs.typst
    pkgs.wl-clipboard
  ];
}
