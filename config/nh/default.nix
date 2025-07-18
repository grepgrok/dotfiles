{ ... }:
{
    programs.nh = {
        enable = true;
        clean.enable = true;
        clean.extraArgs = "--keep-since 1w --keep 3";
    };
}
