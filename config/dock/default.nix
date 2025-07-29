{ config, pkgs, lib, ... }:
let
    checkInstalled = pkg: pathing: lib.mkIf (builtins.elem pkg config.home.packages) pathing;
in
{
    imports = [ ./dock ];

    # https://github.com/dustinlyons/nixos-config/blob/8a14e1f0da074b3f9060e8c822164d922bfeec29/modules/darwin/home-manager.nix#L74
    my.dock = {
        enable = true;
        username = config.home.username;
        entries = [
            (lib.mkIf config.programs.firefox.enable
                { path = "${pkgs.firefox}/Applications/Firefox.app/"; })
            (checkInstalled pkgs.spotify
                { path = "${pkgs.spotify}/Applications/Spotify.app/"; })
            { path = "/Applications/Discord.app/"; }
            { path = "/System/Applications/Messages.app/"; }
            { path = "/Applications/Signal.app/"; }
            # { path = "/Applications/Steam.app/"; }
            (lib.mkIf config.programs.wezterm.enable
                { path = "${pkgs.wezterm}/Applications/Wezterm.app/"; }) # should be whatever is the current terminal
            { path = "/Applications/Anki.app/"; }
            { path = "/Applications/Obsidian.app/"; }
            # { path = "/Applications/Notability.app/"; }
            { path = "/System/Applications/Notes.app/"; }
        ];
    };
}
