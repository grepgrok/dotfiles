# Packages

This contains extra packages that I need to personally build. It should be as easy
as importing each as so (here, for `subs2cia`):

```home.nix
imports = [
    # ...
    ./pkgs/subs2cia.nix
]
```

## Shells and Home Packages

A lot of these could equally be used as a shell (e.g. for testing) or brought in
as a Home Manager package:

```nix
pkgs.mkShell { buildInputs = [ subs2cia ]; }

# OR

{ home.packages = [ subs2cia ]; }
```

## PyPI

The [Python Package Index](https://pypi.org/) (PyPI) contains a wide variety of
programs that can be installed. This should be easy enough as using `pkgs.fetchPypi`.
Of course, it's not. Well, it is... but you have to hook things up. That's what
files like `subs2cia.nix` are doing: they use
[`pkgs.python[version].buildPythonPackage`](https://nixos.org/manual/nixpkgs/stable/#python)
to download things. Definitely check out some of the existing files for reference
on how to do things.

### SHA256

A few notes here though, `pkgs.fetchPypi` wants a `sha256` the easiest (re: only,
as far as I know) way to get this is to just build it and check the error message.
This is kind of as straightforwards as

```subs2cia.nix
# ...
src = pkgs.fetchPypi {
    inherit pname version;
    sha256 = "";
}
```

and running `nix-shell`, `nix-build`, or `home-manager switch` (depending on what
else is going on to get to this). You'll get an error message along the lines of

```bash
error: hash mismatch in fixed-output derivation '/nix/store/b2g2kd4n3w6q06cxazrwm29irq3g5chs-subs2cia-0.5.0.tar.gz.drv':
         specified: sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
            got:    sha256-Noj7rJA5GiwgCGYoqH8dtxkvNRyD7PxutCfSFdGrLRU=
```

then just go *yoink* on that sha hash after `got:`.
