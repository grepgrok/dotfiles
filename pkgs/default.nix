{ pkgs ? (import ../nixpkgs.nix) {}, inputs }:
let
    buildPythonPackage = pkgs.python3Packages.buildPythonPackage;
in rec {
    subs2cia = pkgs.callPackage ./subs2cia.nix { inherit buildPythonPackage; };
    #chapterize-audiobooks = pkgs.callPackage ./chapterize-audiobooks.nix {
    #    inherit buildPythonPackage;
    #    vosk = pkgs.callPackage ./python-modules/vosk {
    #        inherit buildPythonPackage;
    #        vosk = vosk-api;
    #    };
    #};
    #vosk-api = pkgs.callPackage ./vosk { };
}
