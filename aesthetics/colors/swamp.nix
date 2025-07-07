{}:
rec {
    name = "swamp";

    darkHard = "211d13";    #211d13
    dark1 = "242015";       #242015
    dark2 = "3a3124";       #3a3124
    dark3 = "4d3f32";       #4d3f32
    dark4 = "5f4e41";       #5f4e41
    dark5 = "725c4f";       #725c4f
    dark6 = "856a5d";       #856a5d
    light5 = "9f8875";      #9f8875
    light4 = "b8a58c";      #b8a58c
    light3 = "d2c3a4";      #d2c3a4
    light2 = "ebe0bb";      #ebe0bb
    light1 = "f1e9d0";      #f1e9d0
    darkOrange = "b06733";  #b06733
    orange = "ba6d36";      #ba6d36
    darkYellow = "db930d";  #db930d
    yellow = "e69a0e";      #e69a0e
    darkBlue = "91506c";    #91506c
    blue = "80465f";        #80465f
    darkGreen = "7a7653";   #7a7653
    green = "736f4e";       #736f4e
    darkMagenta = "c1666b"; #c1666b
    magenta = "b05d61";     #b05d61
    darkRed = "96294d";     #96294d
    red = "a82d56";         #a82d56
    darkCyan = "508991";    #508991
    cyan = "61a0a8";        #61a0a8

    # Wezterm
    foreground = light2;
    background = dark1; #1d1a11
    darker = dark2;     #15130c
    mbg = dark3;           #242015
    accent = darkYellow;
    cursorColor = light2;
    comment = darkGreen;
    color0 = dark1;     # Black
    color8 = dark2;     # Bright Black
    color1 = darkRed;     # Red
    color9 = red;     # Bright Red
    color2 = darkGreen;     # Green
    color10 = green;    # Bright Green
    color3 = darkYellow;     # Yellow
    color11 = yellow;    # Bright Yellow
    color4 = darkBlue;     # Blue
    color12 = blue;    # Bright Blue
    color5 = darkMagenta;     # Magenta
    color13 = magenta;    # Bright Magenta
    color6 = darkCyan;     # Cyan
    color14 = cyan;    # Bright Cyan
    color7 = light2;     # White
    color15 = light1;    # Bright White

    # Base16 colors
    # https://alex-courtis.github.io/base16-site/
    base00 = dark1;         # Default Background
    base01 = dark2;         # Lighter Background (Used for status bars, line number and folding marks)
    base02 = dark3;         # Selection Background
    base03 = dark4;         # Comments, Invisibles, Line Highlighting
    base04 = light4;        # Dark Foreground (Used for status bars)
    base05 = light3;        # Default Foreground, Caret, Delimiters, Operators
    base06 = light2;        # Light Foreground (Not often used)
    base07 = light1;        # Light Background (Not often used)
    base08 = darkYellow;    # Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
    base09 = light2;        # Integers, Boolean, Constants, XML Attributes, Markup Link Url
    base0A = red;           # Classes, Markup Bold, Search Text Background
    base0B = darkGreen;     # Strings, Inherited Class, Markup Code, Diff Inserted
    base0C = darkYellow;    # Support, Regular Expressions, Escape Characters, Markup Quotes
    base0D = darkMagenta;   # Functions, Methods, Attribute IDs, Headings
    base0E = darkBlue;      # Keywords, Storage, Selector, Markup Italic, Diff Changed
    base0F = cyan;          # Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>

    # foreground = light2;
    # background = dark1;
    # bg2 = dark2;
    # bg3 = dark3;
    # base00 = dark1;
    # base08 = dark2;
    # base01 = red;
    # base09 = darkRed;
    # base02 = darkGreen;
    # base10 = green;
    # base03 = darkYellow;
    # base11 = yellow;
    # base04 = darkBlue;
    # base12 = blue;
    # base05 = darkMagenta;
    # base13 = magenta;
    # base06 = darkCyan;
    # base14 = cyan;
    # base07 = light3;
    # base15 = light2;

    # comment = dark4;
    # cursorColor = light4;
    # cursorLine = light3;
    # contrast = light3;
    # darker = darkHard;
}
