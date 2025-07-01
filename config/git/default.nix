{ pkgs, lib, ... }:
{
    programs.git = {
        enable = true;
        userName = "Ben Olson";
        userEmail = "ben.k.olson@gmail.com";
        extraConfig = {
            credential.helper = lib.mkIf (pkgs.system == "aarch64-darwin") "osxkeychain";
            init.defaultBranch = "main";
        };
    };
}
