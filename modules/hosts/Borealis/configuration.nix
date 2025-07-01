{ pkgs, ... }: {
    users.users.ben.home = "/Users/ben";

    nix.settings.experimental-features = "nix-command flakes";

    security.pam.services.sudo_local.touchIdAuth = true;

    # Bachwards compatibility
    system.stateVersion = 6;

    imports = [
        ./settings/environment.nix
    ];
}
