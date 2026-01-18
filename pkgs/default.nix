{ pkgs ? (import ../nixpkgs.nix) {} }:
{
    subs2cia = pkgs.callPackage ./subs2cia.nix {
        buildPythonPackage = pkgs.python3Packages.buildPythonPackage;
    };
}
