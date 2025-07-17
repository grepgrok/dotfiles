rec {
    mkLib = extended: nixpkgs:
        nixpkgs.lib.extend
        (final: prev: extended // { my = lib { pkgs = nixpkgs; lib = final; }; });
    lib = { pkgs ? (import ../nixpkgs.nix) {}, lib ? pkgs.lib }: {
        replace = import ./replace.nix { inherit pkgs lib; };
    };
}
