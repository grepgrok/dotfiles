local ls = require("luasnip")
local f = ls.function_node
local utils = require("luasnip-latex-snippets.util.utils")

-- this is NOT the right way to do this, but it works
local functionify = function(f, opts)
    return f(opts)
end
local not_math = functionify(utils.not_math)
local is_math, no_backslash, pipe = utils.is_math, utils.no_backslash, utils.pipe

local decorator = {
    wordTrig = false,
    condition = pipe({ is_math, no_backslash }),
    trigEngine = "pattern",
}

local parse = ls.extend_decorator.apply(ls.parser.parse_snippet, decorator) --[[@as function]]
local s = ls.extend_decorator.apply(ls.snippet, decorator) --[[@as function]]

-- set a higher priority (defaults to 0 for most snippets)
-- ls.add_snippets("tex", { snip }, {
--   type = "autosnippets",
-- })

-- First list: controlled snippets (show up as autocomplete options)
-- Second list: autosnippets
return {}, {
    s(
        { trig = "([NZQRSTK])\\1", wordTrig = false, regTrig = true, name = "math blackboard bold", priority = 10 },
        f(function(_, snip)
            return string.format("\\mathbb{%s}", snip.captures[1])
        end, {})
    ),
    s(
        { trig = "([P])\\1", wordTrig = false, regTrig = true, name = "math caligraphic", priority = 10 },
        f(function(_, snip)
            return string.format("\\mathcal{%s}", snip.captures[1])
        end, {})
    ),
    s(
        { trig = "\\\\mathbb{(.*)}\\1", wordTrig = false, regTrig = true, name = "math bold", priority = 10 },
        f(function(_, snip)
            return string.format("\\mathcal{%s}", snip.captures[1])
        end, {})
    ),
    s(
        { trig = "\\\\mathcal{(.*)}\\1", wordTrig = false, regTrig = true, name = "math caligraphic", priority = 10 },
        f(function(_, snip)
            return string.format("\\mathbb{%s}", snip.captures[1])
        end, {})
    ),

    parse({ trig = "cup", name = "set union", priority = 10 }, "\\cup "),
    parse({ trig = "cap", name = "set intersection", priority = 10 }, "\\cap "),
    parse({ trig = "eset", name = "emptyset", priority = 10 }, "\\emptyset "),
    parse({ trig = "00", name = "emptyset", priority = 10 }, "\\emptyset "),
}
