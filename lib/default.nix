rec {
    mkLib = home-manager: nixpkgs:
        nixpkgs.lib.extend
        (final: prev: home-manager.lib //
            { my = lib { pkgs = nixpkgs; lib = final; }; });
    lib = { pkgs ? (import ../nixpkgs.nix) {}, lib ? pkgs.lib }: {
        replace = import ./replace.nix { inherit pkgs lib; };
    };
}
