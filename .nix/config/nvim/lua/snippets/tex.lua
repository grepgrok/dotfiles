local ls = require("luasnip")
local utils = require("luasnip-latex-snippets.util.utils")
local pipe = utils.pipe
local is_math = utils.is_math
local no_backslash = utils.no_backslash

local decorator = {
    wordTrig = false,
    condition = pipe({ is_math, no_backslash }),
    trigEngine = "vim",
    priority = 10,
}

local parse = ls.extend_decorator.apply(ls.parser.parse_snippet, decorator) --[[@as function]]
local s = ls.extend_decorator.apply(ls.snippet, decorator) --[[@as function]]
local f = ls.function_node
local t = ls.text_node

-- set a higher priority (defaults to 0 for most snippets)
-- local snip = s(
--     {
--         trig = "\\([NZQRSTKC]\\)\\1",
--         name = "math blackboard bold",
--         trigEngine = "vim",
--         condition = utils.pipe({ utils.is_math, utils.no_backslash }),
--         priority = 10,
--     },
--     f(function(_, snip)
--         return "\\mathbb{" .. snip.captures[1] .. "}"
--     end, {})
-- )
--
-- ls.add_snippets("tex", { snip }, {
--     type = "autosnippets",
-- })

-- First list: controlled snippets (show up as autocomplete options)
-- Second list: autosnippets
return {}, {
    s(
        { trig = "\\([NZQRSTKC]\\)\\1", name = "math blackboard bold" },
        f(function(_, snip)
            return "\\mathbb{" .. snip.captures[1] .. "}"
        end, {})
    ),
    s(
        { trig = "\\([P]\\)\\1", name = "math caligraphic" },
        f(function(_, snip)
            return "\\mathcal{" .. snip.captures[1] .. "}"
        end, {})
    ),
    s(
        { trig = "\\\\mathbb{\\(.*\\)}\\1", name = "math bold -> caligraphic" },
        f(function(_, snip)
            return "\\mathcal{" .. snip.captures[1] .. "}"
        end, {})
    ),
    s(
        { trig = "\\\\mathcal{\\(.*\\)}\\1", name = "math caligraphic -> bold" },
        f(function(_, snip)
            return "\\mathbb{" .. snip.captures[1] .. "}"
        end, {})
    ),

    parse({ trig = "cup", name = "set union" }, "\\cup "),
    parse({ trig = "cap", name = "set intersection" }, "\\cap "),
    parse({ trig = "eset", name = "emptyset" }, "\\emptyset "),
    parse({ trig = "00", name = "emptyset" }, "\\emptyset "),

    -- TODO: liminf -> \liminf NOT lim\inf
    parse({ trig = "liminf", name = "liminf", priority = 0 }, "\\liminf_{${1:n} \\to ${2:\\infty}} "),
}
