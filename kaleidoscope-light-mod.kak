# Kaleidoscope: colorblind-friendly light colorscheme
# https://personal.sron.nl/~pault/

evaluate-commands %sh{
    # NOTE: tone down black and white for aesthetics,
    # ideally those should be pure #000 and #FFF
    black="rgb:1C1C1C"
    white="rgb:FDFDFD"

    # Regular text
    bright_blue="rgb:4477AA"
    bright_cyan="rgb:66CCEE"
    bright_green="rgb:228833"
    bright_yellow="rgb:CCBB44"
    bright_red="rgb:EE6677"
    bright_purple="rgb:AA3377"
    bright_grey="rgb:BBBBBB"

    # Emphasis
    high_contrast_blue="rgb:004488"
    high_contrast_yellow="rgb:DDAA33"
    high_contrast_red="rgb:BB5566"

    # High contrast alternative text
    vibrant_orange="rgb:EE7733"
    vibrant_blue="rgb:0077BB"
    vibrant_cyan="rgb:33BBEE"
    vibrant_magenta="rgb:EE3377"
    vibrant_red="rgb:CC3311"
    vibrant_teal="rgb:009988"
    vibrant_grey="rgb:BBBBBB"

    # Darker text with no red
    muted_rose="rgb:CC6677"
    muted_indigo="rgb:332288"
    muted_sand="rgb:DDCC77"
    muted_green="rgb:117733"
    muted_cyan="rgb:88CCEE"
    muted_wine="rgb:882255"
    muted_teal="rgb:44AA99"
    muted_olive="rgb:999933"
    muted_purple="rgb:AA4499"
    muted_pale_grey="rgb:DDDDDD"

    # Low contrast background colors
    light_blue="rgb:77AADD"
    light_orange="rgb:EE8866"
    light_yellow="rgb:EEDD88"
    light_pink="rgb:FFAABB"
    light_cyan="rgb:99DDFF"
    light_mint="rgb:44BB99"
    light_pear="rgb:BBCC33"
    light_olive="rgb:AAAA00"
    light_grey="rgb:DDDDDD"

    # Pale background colors, black foreground
    pale_blue="rgb:BBCCEE"
    pale_cyan="rgb:CCEEFF"
    pale_green="rgb:CCDDAA"
    pale_yellow="rgb:EEEEBB"
    pale_red="rgb:FFCCCC"
    pale_grey="rgb:DDDDDD"

    # Dark background colors, white foreground
    dark_blue="rgb:222255"
    dark_cyan="rgb:225555"
    dark_green="rgb:225522"
    dark_yellow="rgb:666633"
    dark_red="rgb:663333"
    dark_grey="rgb:555555"

    # NOTE: Do not use any color that hasn't been defined above (no hardcoding)
    cat <<EOF

    # For Code
    # set-face global keyword ${muted_indigo}
    set-face global keyword ${dark_grey}
    set-face global attribute ${muted_purple}
    # set-face global type ${vibrant_blue}
    set-face global type ${muted_olive}
    # set-face global string ${muted_wine}
    set-face global string ${dark_grey}
    # set-face global value ${muted_rose}
    set-face global value ${dark_grey}
    # set-face global meta ${muted_olive}
    set-face global meta ${dark_grey}
    set-face global builtin ${muted_indigo}+b
    # set-face global module ${vibrant_orange}
    set-face global module ${dark_grey}
    # set-face global comment ${muted_green}+i
    set-face global comment ${dark_grey}+i
    set-face global documentation comment
    # set-face global function Default
    set-face global function ${muted_wine}
    set-face global operator Default
    set-face global variable Default

    # For markup
    set-face global title ${muted_indigo}+b
    set-face global header ${high_contrast_blue}
    set-face global block ${vibrant_magenta}
    set-face global mono ${vibrant_red}
    set-face global link ${vibrant_blue}+u
    set-face global list Default
    set-face global bullet +b

    # Built-in faces
    set-face global Default ${black},${white}
    set-face global PrimarySelection ${black},${pale_blue}+fg
    set-face global SecondarySelection ${black},${pale_cyan}+fg
    set-face global PrimaryCursor ${white},${dark_blue}+fg
    set-face global SecondaryCursor ${white},${dark_cyan}+fg
    set-face global PrimaryCursorEol ${white},${dark_grey}+fg
    set-face global SecondaryCursorEol ${white},${vibrant_grey}+fg

    set-face global StatusLine ${white},${dark_grey}
    set-face global StatusLineMode ${black},${pale_blue}
    set-face global StatusLineInfo ${black},${muted_sand}
    set-face global StatusLineValue ${vibrant_orange},${muted_sand}+b
    set-face global StatusCursor ${black},${high_contrast_yellow}
    set-face global Prompt ${black},${muted_sand}
    set-face global MenuForeground ${black},${muted_sand}
    set-face global MenuBackground ${black},${pale_grey}
    set-face global MenuInfo ${high_contrast_blue}+i

    set-face global LineNumbers ${black},${pale_grey}
    set-face global LineNumbersWrapped ${black},${vibrant_grey}+i
    set-face global LineNumberCursor ${white},${dark_grey}+b
    set-face global MatchingChar ${white},${dark_grey}
    set-face global Whitespace ${vibrant_grey}+f
    set-face global WrapMarker ${vibrant_grey}+f

    set-face global Information ${black},${muted_sand}
    set-face global Error ${white},${vibrant_red}
    set-face global DiagnosticError ${high_contrast_red}
    set-face global DiagnosticWarning ${high_contrast_yellow}
    set-face global BufferPadding ${vibrant_grey}

EOF
}
