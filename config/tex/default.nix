{ pkgs, ... }:
{
    home.packages = with pkgs; [
        texlive.combined.scheme-full
        # lib.mkIf (!isMac) zathura
        skimpdf
        dbus
    ]
}
