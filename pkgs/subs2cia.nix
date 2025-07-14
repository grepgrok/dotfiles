# https://nixos.wiki/wiki/Packaging/Python
{ pkgs ? import <nixpkgs> { }, ...}:
let
    subs2cia = pkgs.python3Packages.buildPythonPackage rec {
        pname = "subs2cia";
        version = "0.5.0";

        src = pkgs.fetchPypi {
            inherit pname version;
            # The easiest way to get the sha256 is to build it and let it fail
            # the error message should include the correct sha256
            sha256 = "sha256-Noj7rJA5GiwgCGYoqH8dtxkvNRyD7PxutCfSFdGrLRU=";
        };

        format = "pyproject";
        build-system = [ pkgs.python3Packages.setuptools ];

        # Added to $PYTHONPATH
        # think, requirements.txt
        pythonPath = with pkgs.python3Packages; [
            ffmpeg-python
            pycountry
            pysubs2
            setuptools
            tqdm
            pandas
            gevent
            colorlog
        ];

        # ffmpeg-python needs ffmpeg to be in $PATH
        # this does that
        propagatedBuildInputs = [ pkgs.ffmpeg ];
    };
in
# pkgs.mkShell { buildInputs = [ subs2cia ]; }
{ home.packages = [ subs2cia ]; }

