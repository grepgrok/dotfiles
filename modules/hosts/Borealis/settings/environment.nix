{ pkgs, ... }: {
    environment = {
        shells = with pkgs; [ zsh bash ];
        systemPackages = [ pkgs.coreutils ];
        systemPath = [ "/usr/local/bin" ];
        pathsToLink = [ "/Applications" ]; # symlinks /run/current-system/sw
    };
}
