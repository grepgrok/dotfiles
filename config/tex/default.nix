{ pkgs, pkgs-texlive, ... }:
{
    home.packages = with pkgs; [
        # lib.mkIf (!isMac) zathura
        skimpdf
        dbus
    ] ++ [ pkgs.texlive.combined.scheme-full ];
}
