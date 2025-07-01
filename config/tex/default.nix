{ pkgs, pkgs-chrjabs, ... }:
{
    home.packages = [
        # lib.mkIf (!isMac) zathura
        pkgs-chrjabs.texlive.combined.scheme-basic
        pkgs.skimpdf
        pkgs.dbus
    ];
}
