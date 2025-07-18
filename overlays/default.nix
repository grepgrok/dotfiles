{ inputs }:
{
    additions = final: _prev: import ../pkgs { pkgs = final; inherit inputs; };
    stable = final: _prev: { stable = import inputs.nixpkgs-stable { inherit (final) system config; }; };
}
