{ ... }:
{
    programs.firefox = {
        enable = true;
    };

    /*! ERROR
     * Activating checkLinkTargets
     * Please do one of the following:
     * - Move or remove the files below and try again.
     * - In standalone mode, use 'home-manager switch -b backup' to back up
     *   files automatically.
     * - When used as a NixOS or nix-darwin module, set
     *     'home-manager.backupFileExtension'
     *   to, for example, 'backup' and rebuild.
     * Existing file '/Users/ben/Library/Application Support/Firefox/profiles.ini' would be clobbered
     */
    # stylix.targets.firefox.profileNames = [ "default" ];
}
