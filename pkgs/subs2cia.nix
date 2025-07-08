# https://nixos.wiki/wiki/Packaging/Python
{ pkgs, ... }:
let
    pname = "subs2cia";
    version = "0.5.0";
in
pkgs.python3Packages.buildPythonPackage {
    inherit pname version;
    src = pkgs.fetchPypi {
        inherit pname version;
        sha256 = "sha256-Noj7rJA5GiwgCGYoqH8dtxkvNRyD7PxutCfSFdGrLRU=";
    };
    format = "pyproject";
    build-system = [ pkgs.python3Packages.setuptools ];
    propagatedBuildInputs = with pkgs.python3Packages; [
        ffmpeg-python
        pycountry
        pysubs2
        setuptools
        tqdm
        pandas
        gevent
        colorlog
    ];
}
