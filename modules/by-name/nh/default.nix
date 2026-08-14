{ lib, config, ... }:
{
  config = lib.mkIf config.programs.nh.enable {
    programs.nh = {
      clean.enable = true;
    };
  };
}
