# Nix-based Dotfiles

This is my managing of dotfiles and other configurations based with Nix.

To update things, use the following from this `/etc/nix-darwin` directory:

```bash
darwin-rebuild build --flake .#Borealis
```

## Structure

While not currently needed, the structure is set up to allow better modularity
in the future (largely bc that's what most people seem to do and it makes sense).
Basically everything lives under `modules`, except the flake. The flake basically
connects machines/systems/hosts to their appropriate configurations. I'm not
100% how this works but I'm pretty sure its based off checking the current hostname
and using the respective configuration in `flake.nix`. For example, on my MacBook
Borealis, it will select `darwinConfigurations."Borealis"`.

`hosts` manages... hosts. Devices in the network. In principle, this could be your
stuff on a big server like with DigitalOcean Droplets, a virtual machine, or, more
practically probably, your laptop. My MacBook is called "Borealis" so we have
`hosts/Borealis`. Now, these manage more system-wide settings. Things like printers,
(internet) networking, etc. If you think "this feels very operating system-y" then
it probably belongs here.

`home-manager` on the other hand manages user homes. Most prototypically,
dotfiles/config(uration) files. These are the things that individual people might
like to have to work with. Styling (Neo)Vim, terminals, browsers, music, git, etc.
Generally, each profile in `home-manager` should be usable across hosts without
having to change anything. Note that specifically this is for Home Manager
configurations. But that's pretty broad.

## Colors

### Swamp

| Wezterm Role  | Hex     | HSL                    | Origin            |
|---------------|---------|------------------------|-------------------|
| Foreground    | #ebe0bb | hsl(39,  88.8%, 45.5%) | base06            |
| Background    | #242015 | hsl(40,  33.8%, 73.3%) |            base00 |
| Active FG     | #242015 | hsl(40,  33.8%, 73.3%) | base00            |
| Active BG     | #db930d | hsl(39,  88.8%, 45.5%) | base0c            |
| Inactive FG   | #d2c3a4 | hsl(40,  33.8%, 73.3%) | base05            |
| Inactive BG   | #3a3124 | hsl(35,  23.4%, 18.4%) |            base01 |
| Cursor FG     | #211d13 | hsl(43,  26.9%, 10.2%) | ANSI 00           |
| Cursor BG     | #b8a58C | hsl(34,  23.7%, 63.5%) |            base04 |
| Cursor Border | #d2c3a4 | hsl(40,  33.8%, 73.3%) | base05            |
| Selection FG  | #3a3124 | hsl(35,  23.4%, 18.4%) | base01            |
| Selection BG  | #d2c3a4 | hsl(40,  33.8%, 73.3%) | base05            |
| ANSI 00       | #211d13 | hsl(43,  26.9%, 10.2%) |                   |
| Bright 08     | #ebe0bb | hsl(46,  54.5%, 82.7%) |            base06 |
| ANSI 01       | #a82d56 | hsl(340, 57.7%, 41.8%) |            base0a |
| Bright 09     | #96294d | hsl(340, 57.1%, 37.5%) | darkened   base0a |
| ANSI 02       | #7a7653 | hsl(54,  19.0%, 40.2%) |            base0b |
| Bright 10     | #736f4e | hsl(54,  19.2%, 37.8%) | darkened   base0b |
| ANSI 03       | #db930d | hsl(39,  88.8%, 45.5%) |            base0c |
| Bright 11     | #e69a0e | hsl(39,  88.5%, 47.8%) | darkened   base0c |
| ANSI 04       | #91506c | hsl(334, 28.9%, 44.1%) |            base0e |
| Bright 12     | #80465f | hsl(334, 29.3%, 38.8%) | darkened   base0e |
| ANSI 05       | #c1666b | hsl(357, 42.3%, 57.8%) |            base0d |
| Bright 13     | #b05d61 | hsl(357, 34.4%, 52.7%) | darkened   base0d |
| ANSI 06       | #508991 | hsl(187, 28.9%, 44.1%) | lightened  base0f |
| Bright 14     | #61a0a8 | hsl(187, 29.0%, 52.0%) |            base0f |
| ANSI 07       | #d2c3a4 | hsl(40,  33.8%, 73.3%) |            base05 |
| Bright 15     | #d2c3a4 | hsl(40,  33.8%, 73.3%) |            base05 |

This is 8 functional + 8 highlights

| Neovim Role | Hex     | HSL                    | Notes            |
|-------------|---------|------------------------|------------------|
| base00      | #242015 | hsl(44,  26.3%, 11.2%) | BG               |
| base01      | #3A3124 | hsl(35,  23.4%, 18.4%) | BG2              |
| base02      | #4D3F32 | hsl(29,  21.3%, 24.9%) | BG3              |
| base03      | #5F4E41 | hsl(26,  18.8%, 31.4%) | Comments         |
| base04      | #B8A58C | hsl(34,  23.7%, 63.5%) | *                |
| base05      | #D2C3A4 | hsl(40,  33.8%, 73.3%) | FG               |
| base06      | #EBE0BB | hsl(46,  54.5%, 82.7%) |                  |
| base07      | #F1E9D0 | hsl(45,  54.1%, 88.0%) |                  |
| base08      | #DB930D | hsl(39,  88.8%, 45.5%) | Variables        |
| base09      | #EBE0BB | hsl(46,  54.5%, 82.7%) | numbers = base06 |
| base0A      | #A82D56 | hsl(340, 57.7%, 41.8%) | Classes          |
| base0B      | #7A7653 | hsl(54,  19.0%, 40.2%) | Strings          |
| base0C      | #DB930D | hsl(39,  88.8%, 45.5%) | Support = base08 |
| base0D      | #C1666B | hsl(357, 42.3%, 57.8%) | Functions        |
| base0E      | #91506C | hsl(334, 28.9%, 44.1%) | Keywords         |
| base0F      | #61A0A8 | hsl(187, 29.0%, 52.0%) | Parentheses      |

| Nam's Color Schema | Value   | Notes                       |
|--------------------|---------|-----------------------------|
| Name               | Swamp   |                             |
| Wallpaper          | .jpg    |                             |
| Neofetchpic        | .png    |                             |
| Foreground         | #ebe0bb |                             |
| CursorColor        | #b8a58c |                             |
| Background         | #242015 |                             |
| Background 2       | #3a3124 | More Background             |
| Background 3       | #4d3f32 | Split lines and frame lines |
| Contrast           | #d2c3a4 |                             |
| Cursorline         | #d2c3a4 |                             |
| Comment            | #5f4e41 |                             |
| Darker             | #211d13 |                             |
| Lighter            | #f1e9d0 |                             |
| Color 00           | #242015 | Black                       |
| Color 08           | #3a3124 |                             |
| Color 01           | #a82d56 | Red                         |
| Color 09           | #96294d |                             |
| Color 02           | #7a7653 | Green                       |
| Color 10           | #736f4e |                             |
| Color 03           | #db930d | Yellow                      |
| Color 11           | #e69a0e |                             |
| Color 04           | #91506c | Blue                        |
| Color 12           | #80465f |                             |
| Color 05           | #c1666b | Magenta                     |
| Color 13           | #b05d61 |                             |
| Color 06           | #508991 | Cyan/Teal                   |
| Color 14           | #61a0a8 |                             |
| Color 07           | #b8a58c | White                       |
| Color 15           | #d2c3a4 |                             |

Swamp colors:

| Light Hex | Dark Hex  | Note                 |
|-----------|-----------|----------------------|
| #1d2021   | #211d13   | DarkHard             |
| #282828   | #242015   | Dark1 / BG           |
| #3c3836   | #3a3124   | Dark2                |
| #504945   | #4d3f32   | Dark3                |
| #665c54   | #5f4e41   | Dark4                |
| #7c6f64   | #725c4f   | Dark5                |
| #928374   | #856a5d   | Dark6 / DarkGrey     |
| #a89984   | #9f8875   | Light5 / LightGrey   |
| #bdae93   | #b8a58c   | Light4               |
| #d5c4a1   | #d2c3a4   | Light3               |
| #ebdbb2   | #ebe0bb   | Light2 / FG          |
| #fbf1c7   | #f1e9d0   | Light1               |
| #d65d0e   | #b06733   | DarkOrange           |
| #fe8019   | #ba6d36   | Orange               |
| #d79921   | #db930d   | DarkYellow           |
| #fabd2f   | #e69a0e   | Yellow               |
| #458588   | #91506c   | DarkBlue             |
| #83a598   | #80465f   | Blue                 |
| #98971a   | #7a7653   | DarkGreen            |
| #b8bb26   | #736f4e   | Green                |
| #b16286   | #c1666b   | DarkMagenta          |
| #d3869b   | #b05d61   | Magenta              |
| #cc241d   | #96294d   | DarkRed              |
| #fb4934   | #a82d56   | Red                  |
| #689d6a   | #508991   | DarkCyan             |
| #8ec07c   | #61a0a8   | Cyan                 |

## On Applications

I think this is what's going on with Applications: First, Nix-Darwin sets up the
system. Among this is creating (empty) things (files or directories) in
`/run/current-system/sw -> /nix/store/[hash]-system-path` (creates in `...system-path`
and links `...sw -> ...sysem-path`) based on `environment.pathsToLink`. Now then,
Home-Manager downloads the file in the nix store (with the crazy hash
`nix/store/[hash]-home-manager-path/...`; see `home.packages`). Home-Manager then
links the `/run/current-system/sw/...` file structure (the `...`) to
`/nix/store/[hash]-user-environment/... <- /etc/static/profiles/per-user/$USER
<- /etc/profiles/per-user/$USER`. Finally, things get linked appropriately in
`/Users/$USER`. Importantly for us here, we get
`/Users/$USER/Applications/Home\ Manager\ Apps` (which are actually directly
linked to the original files in the nix store).

## TODO

- need to clear out some More
- make the update thing more in line with nix
- the functions are more typically nix-able (maybe, or a bashrc is the answer)
- move to zsh
- make zsh pretty
- get TeX back
- find a way to nicely "subclass" home-manager from darwin.
  - updating darwin stuff should update home-manager but should be able to update
  home-manager without dealing with darwin
  - I don't think this is really possible. Switching darwin needs sudo but that
  is exactly what I want to not have to do. I think I need to fully separate out
  home manager a la [Reckenrode](https://github.com/reckenrode/nixos-configs/blob/main/flake.nix)
- appropriate modules across hosts and user profiles
