{ pkgs, pkgs-texlive, ... }:
{
    home.packages = with pkgs; [
        # lib.mkIf (!isMac) zathura
        skimpdf
        dbus
        stable.texlive.combined.scheme-full # the actual texlive has a tendency to be unstable
    ];
}
