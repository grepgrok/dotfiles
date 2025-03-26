{ pkgs, ... }: {
    # This is required information for home-manager to do its job
    home = {
        stateVersion = "23.11";
        username = "ben";
        homeDirectory = "/Users/ben";
        packages = [
            pkgs.git
            pkgs.neovim
            pkgs.zathura
        ];

        # map `./config` dir to `~/.config` dir
        file.".config" = { source = ./config; recursive = true; };
    };

    xdg.enable = true; # Make programs use ~/.config

    programs.home-manager.enable = true;
    programs.zsh.enable = true;
}

