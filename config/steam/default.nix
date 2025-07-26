# https://wiki.nixos.org/wiki/Steam
{ pkgs, ...}:
{
    # home.packages = [ pkgs.steam ]; # this is only available on Linux...
    # We just download steam by hand TODO: nix-darwin config?
    /*
     * https://discourse.nixos.org/t/error-the-option-programs-steam-does-not-exist/48510/2
     * programs.steam has a number of option (like these firewall items) that require permissions
     * higher than basic Home Manager is allowed. These would have to be moved to nix-darwin
     * or configuration.nix
     */
    # programs.steam = {
    #     enable = true;
    #     remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    #     dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    # };

    # Optional: If you encounter amdgpu issues with newer kernels (e.g., 6.10+ reported issues),
    # you might consider using the LTS kernel or a known stable version.
    # boot.kernelPackages = pkgs.linuxPackages_lts; # Example for LTS

    # Tip: For improved gaming performance, you can also enable GameMode:
    # programs.gamemode.enable = true;
}
