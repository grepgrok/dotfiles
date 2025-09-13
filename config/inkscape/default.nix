{ pkgs, ... }:
let
    # https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=inkscape-extensions
    inkscapeExtensions = with pkgs.inkscape-extensions; [];
in {
    home.packages = with pkgs; [
        (inkscape-with-extensions.override { inherit inkscapeExtensions; })
    ];
}
