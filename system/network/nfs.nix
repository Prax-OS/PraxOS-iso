{ pkgs, ... }:

{
    boot.initrd.supportedFilesystems = ["nfs"];
    boot.kernelModules = [ "kvm-intel" "nfs" ];
 
    environment.systemPackages = [pkgs.nfs-utils];

    services.gvfs.enable = true;

    services.rpcbind.enable = true; # needed for NFS
    systemd.mounts = [{
        type = "nfs";
        mountConfig = {
        Options = "noatime";
        };
        what = "192.168.254.200:/shit";
        where = "/mnt/shit";
    }];

    systemd.automounts = [{
        wantedBy = [ "multi-user.target" ];
        automountConfig = {
        TimeoutIdleSec = "600";
        };
        where = "/mnt/shit";
    }];
}