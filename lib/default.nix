lib: pkgs:
rec {
    replace = import ./replace.nix { inherit lib pkgs; };
}
