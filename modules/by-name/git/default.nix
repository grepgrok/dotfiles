{ pkgs, lib, config, ... }:
{
    config = lib.mkIf config.programs.git.enable {
        programs.git.settings = {
            user.name = "Ben Olson";
            user.email = "ben.k.olson@gmail.com";
            credential.helper = lib.mkIf (pkgs.system == "aarch64-darwin") "osxkeychain";
            init.defaultBranch = "main";
        };
    };
}
