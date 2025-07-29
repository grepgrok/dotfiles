# If home-manager as a shell command disappears, use this:
# nix run github:nix-community/home-manager -- switch --flake .
#
# Hint: you need `programs.home-manager.enable = true;`
# Hint: run `nix eval --impure --expr '(import <nixpkgs>{}).system'` to check current system for pkgs.system
{
    inputs,
    outputs,
    pkgs,
    lib,
    config,
    ...
} @ args:
let
    env = {
        defaultbrowser = "firefox"; # TODO: actually hook this up right
        isMac = (pkgs.system == "aarch64-darwin" || pkgs.system == "x86_64-darwin");
    };
in
{
    # This is required information for home-manager to do its job
    home = {
        stateVersion = "23.11"; # no touchy
        username = "ben";
        homeDirectory = "/Users/ben";
        # map `./modules/config` dir to `~/.config` dir
        file.".config" = { source = ./config; recursive = true; };
    };

    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.allowUnfreePredicate = _pkg: true;

    nixpkgs.overlays = [
        outputs.overlays.additions
        outputs.overlays.stable
    ];

    home.packages = with pkgs; [
        curl
        element-desktop
        fzf
        lazygit
        luarocks # Lua
        mkvtoolnix
        qbittorrent
        subs2cia
        wget

        zoom-us # TODO: islate this (and other privacy concerning apps)
        zotero
        #discord
    ];

    xdg.enable = true; # Tell programs to use ~/.config
    programs.home-manager.enable = true; # let home-manager manager itself

    home.activation = {
        defaultBrowser = lib.mkIf env.isMac (lib.hm.dag.entryAfter ["installPackages"] ''
            run echo "Setting default browser to ${env.defaultbrowser}"
            # set default browser
            run ${pkgs.defaultbrowser}/bin/defaultbrowser ${env.defaultbrowser}
        '');
    };

    imports = [
        ./config

        ./aesthetics/colors/swamp/light
        ./aesthetics/eyecandy/colorscripts.nix
        ./aesthetics/eyecandy/fastfetch.nix
    ];
}
