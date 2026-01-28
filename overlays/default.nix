{ inputs }:
[
    # Additions
    (final: _prev: import ../pkgs { pkgs = final; })

    # Stable
    (final: _prev: { stable = import inputs.nixpkgs-stable {
        inherit (final) config;
        inherit (final.stdenv.hostPlatform) system;
    }; })
]
