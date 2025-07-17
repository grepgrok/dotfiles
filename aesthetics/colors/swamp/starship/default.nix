{ pkgs, lib, ... }:
{
    programs.starship.settings = lib.mapAttrsRecursive (_: lib.mkForce) {
        # gruvbox-raindbow
        os.style = "bg:color_orange fg:color_bg1";
        username.style_user = "bg:color_orange fg:color_bg1";
        username.style_root = "bg:color_orange fg:color_bg1";
        directory.style = "fg:color_bg1 bg:color_yellow";
    };
}
