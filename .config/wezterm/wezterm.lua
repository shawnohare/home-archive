local wezterm = require('wezterm')

-- Define identity function on colors to make copying code from the
-- neovim Lush theme these colors are based on simple.
local function hsluv(val)
    return val
end
-- ---------------------------------------------------------------------------
-- palette
-- Colors are drawn from the okhsl(h, 100, l) color space
-- ---------------------------------------------------------------------------
--
-- okhsl(h, 100, l).
-- Static colors used in both light and dark modes.
local color = {
    -- okhsl hue values for color.
    hues = {
        red     = 025,
        orange  = 055,
        yellow  = 110,
        green   = 130,
        spring  = 155,
        cyan    = 185,
        blue    = 245,
        violet  = 290,
        magenta = 330,
        cerise  = 345,
        rose    = 360,
    },
    -- okhsl(h, 100, 55)
    l55 = {
        red     = hsluv('#f60029'),
        orange  = hsluv('#c76600'),
        yellow  = hsluv('#898a00'),
        green   = hsluv('#629600'), -- h=130
        spring  = hsluv('#009d5a'), -- h=155
        cyan    = hsluv('#00988c'),
        blue    = hsluv('#008ad9'),
        violet  = hsluv('#885eff'),
        magenta = hsluv('#d700d0'), -- h=330
        cerise  = hsluv('#e400a6'),
        rose    = hsluv('#ed007e'), -- h=360
        -- green   = hsluv('#4f9a00'),
        -- green   = hsluv('#009e48'), -- h=150
        -- violet  = hsluv('#716aff'),
    },
    -- okhsl(h, 100, 60)
    l60 = {
        red     = hsluv('#ff3b41'),
        orange  = hsluv('#da7000'),
        yellow  = hsluv('#979700'),
        green   = hsluv('#6ca500'), -- h=130,
        spring  = hsluv('#00ad63'), -- h=155,
        cyan    = hsluv('#00a79a'),  -- h=185
        blue    = hsluv('#0098ee'),
        violet  = hsluv('#9374ff'),
        magenta = hsluv('#eb00e4'),
        cerise  = hsluv('#f900b7'), -- h=345
        rose    = hsluv('#ff1f8b'),
        -- green   = hsluv('#57a900'), -- h=135
        -- green   = hsluv('#00af2f'), -- h=145,
        -- green   = hsluv('#00ae50'), -- h=150
    },
    -- okhsl(h, 100, 65)
    l65 = {
        red = hsluv('#ff625e'),
        orange = hsluv('#ed7b00'),
        yellow = hsluv('#a5a500'),
        green  = hsluv('#76b300'),
        spring  = hsluv('#00bc6c'), -- h=155
        cyan   = hsluv('#00b6a8'),
        blue   = hsluv('#1aa5ff'),
        violet = hsluv('#9e88ff'),
        magenta = hsluv('#ff0bf7'),
        rose    = hsluv('#ff5699'),
    },
    -- okhsl(h, 100, 75) for backgrounds
    l75 = {
        red     = hsluv('#ff9890'),
        orange  = hsluv('#ff9e57'),
        yellow  = hsluv('#c1c100'),
        green   = hsluv('#8ad200'), -- h=130
        spring  = hsluv('#00dc7f'), -- h=155
        cyan    = hsluv('#00d5c5'),
        blue    = hsluv('#75c1ff'),
        violet  = hsluv('#b8acff'),
        magenta = hsluv('#ff82f6'),
        cerise  = hsluv('#ff8cd0'),
        rose    = hsluv('#ff92b5'),
    },
    -- okhsl(h, 100, 80) for backgrounds
    l80 = {
        red     = hsluv('#ffafa7'),
        orange  = hsluv('#ffb37f'),
        yellow  = hsluv('#cfd000'),
        green   = hsluv('#95e100'),
        spring  = hsluv('#00ec89'),
        cyan    = hsluv('#00e5d3'),
        blue    = hsluv('#94ceff'),
        violet  = hsluv('#c5bdff'),
        magenta = hsluv('#ff9ff7'),
        rose    = hsluv('#ffaac4'),
    },
    -- okhsl(h, 100, 85)
    l85 = {
        red     = hsluv('#ffc4be'),
        orange  = hsluv('#ffc7a2'),
        yellow  = hsluv('#ddde00'),
        green   = hsluv('#9ff100'),
        spring  = hsluv('#00fc93'),
        cyan    = hsluv('#00f3ea'),
        blue    = hsluv('#b0daff'),
        violet  = hsluv('#d3ceff'),
        magenta = hsluv('#ffbaf8'),
        rose    = hsluv('#ffc1d2'),
    },
}

-- okhsl(220, s=33|05, l)
local base = {
    -- experiment with different saturation levels
    -- saturation = 100
    -- l05s100 = hsluv('#000b0f'),
    -- l07s100 = hsluv('#041014'),
    -- l08s100 = hsluv('#00141b'),
    -- l10s100 = hsluv('#001a22'),
    -- l12s100 = hsluv('#001f28'),
    -- l15s100 = hsluv('#002732'),
    -- l20s100 = hsluv('#003441'),
    -- l25s100 = hsluv('#004151'),
    -- saturation = 50
    -- l08s50 = hsluv('#051318'),
    -- l10s50 = hsluv('#08191e'),
    -- l12s50 = hsluv('#0b1e24'),
    -- l15s50 = hsluv('#0f262d'),
    -- l20s50 = hsluv('#16333b'),
    -- l25s50 = hsluv('#1d3f4a'),
    -- darks, saturation = 33
    -- l05 = hsluv('#040a0c'),
    -- l06 = hsluv('#050d10'),
    -- l07 = hsluv('#071013'),
    l08 = hsluv('#081316'),
    l10 = hsluv('#0c181c'),
    l12 = hsluv('#101e22'),
    l15 = hsluv('#132328'),
    l20 = hsluv('#1e3238'),
    l25 = hsluv('#263e46'),
    -- mids and lights, saturation = 5
    l27 = hsluv('#3b4041'),
    l28 = hsluv('#3d4243'),
    l30 = hsluv('#424748'),
    l35 = hsluv('#4d5355'),
    l40 = hsluv('#595f61'),
    l45 = hsluv('#656c6e'),
    l50 = hsluv('#71787b'),
    l55 = hsluv('#7e8588'),
    l60 = hsluv('#8b9295'),
    l65 = hsluv('#989fa2'),
    l70 = hsluv('#a6adaf'),
    l75 = hsluv('#b4babc'),
    l80 = hsluv('#c2c8c9'),
    l85 = hsluv('#d1d5d7'),
    l90 = hsluv('#e0e3e4'),
    l93 = hsluv('#e9ebec'),
    l95 = hsluv('#f0f1f1'),
    l97 = hsluv('#f6f7f7'),
}



local light = {
    -- okhsl(220, 10, l)
    bg0 = base.l97,
    bg1 = base.l93,
    bg2 = base.l90,
    bg3 = base.l85,
    bg4 = base.l80,
    fg4 = base.l55,
    fg3 = base.l45,
    fg2 = base.l35,
    fg1 = base.l28,
    -- dim = color.l55,
    red = color.l55.red,
    orange = color.l55.orange,
    yellow = color.l55.yellow,
    green = color.l55.green,
    spring = color.l55.spring,
    cyan = color.l55.cyan,
    blue = color.l55.blue,
    violet = color.l55.violet,
    magenta = color.l55.magenta,
    rose = color.l55.rose,
    br = color.l65,
    hl = color.l85,
}

local dark = {
    -- okhsl(220, 100, l)
    bg0 = base.l08,
    bg1 = base.l12,
    bg2 = base.l15,
    bg3 = base.l20,
    bg4 = base.l25,
    fg4 = base.l45,
    fg3 = base.l55,
    fg2 = base.l65,
    fg1 = base.l75,
    fg0 = base.l90,
    -- dim = color.l55,
    red = color.l60.red,
    orange = color.l60.orange,
    yellow = color.l60.yellow,
    green = color.l60.green,
    spring = color.l60.spring,
    cyan = color.l60.cyan,
    blue = color.l60.blue,
    violet = color.l60.violet,
    magenta = color.l60.magenta,
    rose = color.l60.rose,
    br = color.l75,
    hl = color.l85,
}

local palette = dark



return {
    font = wezterm.font(
        "JetBrainsMono Nerd Font",
        { weight = 'Medium' }
    ),
    font_size = 14,
    bold_brightens_ansi_colors = false,
    -- dpi = 144.0,
    -- freetype_load_target = "Normal",
    -- freetype_render_target = "HorizontalLcd",
    -- hadalized dark color scheme
    colors = {
        -- The default text color
        foreground = palette.fg1,
        -- The default background color
        background = palette.bg0,


        -- Overrides the cell background color when the current cell is occupied by the
        -- cursor and the cursor style is set to Block
        -- cursor_bg = "#52ad70",
        cursor_bg = palette.fg3,
        -- Overrides the text color when the current cell is occupied by the cursor
        -- cursor_fg = "black",
        -- Specifies the border color of the cursor when the cursor style is set to Block,
        -- or the color of the vertical or horizontal bar when the cursor style is set to
        -- Bar or Underline.
        -- cursor_border = "#52ad70",

        -- the foreground color of selected text
        selection_fg = palette.fg0,
        -- the background color of selected text
        selection_bg = palette.bg3,

        -- The color of the scrollbar "thumb"; the portion that represents the current viewport
        scrollbar_thumb = palette.bg3,

        -- The color of the split lines between panes
        split = palette.bg3,

        ansi = {
            palette.fg3,
            palette.red,
            palette.green,
            palette.yellow,
            palette.blue,
            palette.magenta,
            palette.cyan,
            palette.fg1,
        },
        brights = {
            palette.fg2,
            palette.br.red,
            -- palette.red,
            palette.br.green,
            palette.br.yellow,
            palette.br.blue,
            palette.br.magenta,
            palette.br.cyan,
            palette.fg0
        },

        -- Arbitrary colors of the palette in the range from 16 to 255
        -- indexed = {[136] = "#af8700"},

        -- Since: nightly builds only
        -- When the IME, a dead key or a leader key are being processed and are effectively
        -- holding input pending the result of input composition, change the cursor
        -- to this color to give a visual cue about the compose state.
        compose_cursor = palette.orange,
    }
}
