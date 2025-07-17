{ inputs }:
{
    additions = final: prev: import ../pkgs { pkgs = prev; inherit inputs; };
}
