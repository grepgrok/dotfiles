# Nix-based Dotfiles

This is my managing of dotfiles and other configurations based with Nix.

To update things, use the following from this `~/.nix` directory:

```bash
home-manager switch --flake .
```

## Colors

### Swamp

| Wezterm Role  | Hex     | HSL                     | Notes               |
|---------------|---------|-------------------------|---------------------|
| Foreground    | #ebe0bb |                         | Bright 08           |
| Background    | #242015 |                         |                     |
| Active FG     | #242015 |                         | Matches Background  |
| Active BG     | #db930d |                         |                     |
| Inactive FG   | #d2c3a4 |                         | Matches Bright 15   |
| Inactive BG   | #3a3124 |                         |                     |
| Cursor FG     | #211d13 |                         | ANSI 00             |
| Cursor BG     | #b8a58C |                         |                     |
| Cursor Border | #d2c3a4 |                         | Matches Inactive FG |
| Selection FG  | #3a3124 |                         | Matches Inactive BG |
| Selection BG  | #d2c3a4 |                         | Matches Inactive FG |
| ANSI 00       | #211d13 |                         |                     |
| Bright 08     | #ebe0bb |                         |                     |
| ANSI 01       | #a82d56 |                         |                     |
| Bright 09     | #96294d |                         |                     |
| ANSI 02       | #7a7653 |                         |                     |
| Bright 10     | #736f4e |                         |                     |
| ANSI 03       | #db930d |                         |                     |
| Bright 11     | #e69a0e |                         |                     |
| ANSI 04       | #91506c |                         |                     |
| Bright 12     | #80465f |                         |                     |
| ANSI 05       | #c1666b |                         |                     |
| Bright 13     | #b05d61 |                         |                     |
| ANSI 06       | #508991 |                         |                     |
| Bright 14     | #61a0a8 |                         |                     |
| ANSI 07       | #d2c3a4 |                         |                     |
| Bright 15     | #d2c3a4 |                         |                     |

This is 8 functional + 8 highlights

| Neovim Role | Hex     | Notes         |
|-------------|---------|---------------|
| base00      | #242015 | BG            |
| base01      | #3A3124 | BG2           |
| base02      | #4D3F32 | BG3           |
| base03      | #5F4E41 | Comments      |
| base04      | #B8A58C |               |
| base05      | #D2C3A4 | FG            |
| base06      | #EBE0BB |               |
| base07      | #F1E9D0 |               |
| base08      | #DB930D | Variables     |
| base09      | #EBE0BB | numbers       |
| base0A      | #A82D56 | Classes       |
| base0B      | #7A7653 | Strings       |
| base0C      | #DB930D | Support       |
| base0D      | #C1666B | Functions     |
| base0E      | #91506C | Keywords      |
| base0F      | #61A0A8 | Parentheses   |

| Nam's Color Schema    | Value         | Notes             |
|-----------------------|---------------|-------------------|
| Name                  | Swamp         |                   |
| Wallpaper             | .jpg          |                   |
| Neofetchpic           | .png          |                   |
| Foreground            | #ebe0bb       |                   |
| CursorColor           | #d7e0e0       |                   |
| Background            | #242015       |                   |
| Bg2                   | #101a1b       | More Background   |
| Bg3                   | #0e1718       |                   |
| Contrast              | #111a1b       |                   |
| Cursorline            | #111a1b       |                   |
| Comment               | #505758       |                   |
| Darker                | #080c0d       |                   |
| Color 00              | #242015       | Black             |
| Color 08              | #253336       |                   |
| Color 01              | #df5b61       | Red               |
| Color 09              | #f16269       |                   |
| Color 02              | #6ec587       | Green             |
| Color 10              | #8dd5a0       |                   |
| Color 03              | #de8c6a       | Orange/Yellow     |
| Color 11              | #e59575       |                   |
| Color 04              | #659bdb       | Blue              |
| Color 12              | #739bdf       |                   |
| Color 05              | #c167d9       | Magenta           |
| Color 13              | #d16ee0       |                   |
| Color 06              | #6fd1d5       | Cyan/Teal         |
| Color 14              | #7bd3e0       |                   |
| Color 07              | #c5d7d7       | White             |
| Color 15              | #cedcd9       |                   |
