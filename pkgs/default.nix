{ pkgs ? (import ../nixpkgs.nix) {}, inputs }:
{
    subs2cia = pkgs.callPackage ./subs2cia.nix {
        buildPythonPackage = pkgs.python3Packages.buildPythonPackage;
    };
}
