{
  config,
  pkgs,
  ...
}: {
  home = {
    packages = [pkgs.rclone];
    shellAliases = {
      "rclone-mount-all" = "systemctl --user restart rclone-mount-all.service";
    };
  };

  systemd.user.services.rclone-mount-all = {
    Unit = {
      Description = "Mount all rclone configurations";
      After = ["network-online.target"];
    };

    Service = let
      homeDir = config.home.homeDirectory;
    in {
      ExecStartPre = "${pkgs.writeShellScript "rclonePre" ''
        remotes=$(${pkgs.rclone}/bin/rclone --config=${homeDir}/.config/rclone/rclone.conf listremotes)
        for remote in $remotes;
        do
        name=$(/usr/bin/env echo "$remote" | /usr/bin/env sed "s/://g")
        /usr/bin/env mkdir -p ${homeDir}/"$name"
        done
      ''}";

      ExecStart = "${pkgs.writeShellScript "rcloneStart" ''
        remotes=$(${pkgs.rclone}/bin/rclone --config=${homeDir}/.config/rclone/rclone.conf listremotes)
        for remote in $remotes;
        do
        name=$(/usr/bin/env echo "$remote" | /usr/bin/env sed "s/://g")
        ${pkgs.rclone}/bin/rclone --config=${homeDir}/.config/rclone/rclone.conf --vfs-cache-mode writes --ignore-checksum mount "$remote" "$name" &
        done
      ''}";

      ExecStop = "${pkgs.writeShellScript "rcloneStop" ''
        remotes=$(${pkgs.rclone}/bin/rclone --config=${homeDir}/.config/rclone/rclone.conf listremotes)
        for remote in $remotes;
        do
        name=$(/usr/bin/env echo "$remote" | /usr/bin/env sed "s/://g")
        /usr/bin/env fusermount -u ${homeDir}/"$name"
        done
      ''}";

      Type = "forking";
    };

    Install.WantedBy = ["default.target"];
  };
}
