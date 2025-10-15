local ls = require("luasnip")
local utils = require("luasnip-latex-snippets.util.utils")
local pipe = utils.pipe
local is_math = utils.with_opts(utils.is_math, false)
local no_backslash = utils.no_backslash

local decorator = {
    wordTrig = false,
    condition = pipe({
        is_math,
        no_backslash,
    }),
    trigEngine = "vim",
    priority = 5000,
}

local s = ls.extend_decorator.apply(ls.snippet, decorator) --[[@as function]]
local f = ls.function_node
local t = ls.text_node

-- First list: controlled snippets (show up as autocomplete options)
-- Second list: autosnippets
return {
    s({ trig = "@w", name = "omega" }, t("\\omega ")),
}, {
    s(
        -- \C explicitly tells vim to be case sensitive
        { trig = "\\C\\([NZQRSTKCF]\\)\\1", name = "math blackboard bold", priority = 4000 },
        f(function(_, snip)
            return "\\mathbb{" .. snip.captures[1] .. "}"
        end, {})
    ),
    s(
        { trig = "\\C\\([P]\\)\\1", name = "math caligraphic" },
        f(function(_, snip)
            return "\\mathcal{" .. snip.captures[1] .. "}"
        end, {})
    ),
    s(
        { trig = "\\\\mathbb{\\(.*\\)}\\1", name = "math blackboard bold -> caligraphic" },
        f(function(_, snip)
            return "\\mathcal{" .. snip.captures[1] .. "}"
        end, {})
    ),
    s(
        { trig = "\\\\mathcal{\\(.*\\)}\\1", name = "math caligraphic -> blackboard bold" },
        f(function(_, snip)
            return "\\mathbb{" .. snip.captures[1] .. "}"
        end, {})
    ),

    s({ trig = "cup", name = "set union" }, t("\\cup ")),
    s({ trig = "cap", name = "set intersection" }, t("\\cap ")),
    s({ trig = "eset", name = "emptyset" }, t("\\emptyset ")),
    s({ trig = "00", name = "emptyset" }, t("\\emptyset ")),
    s(
        { trig = "\\(\\%[,]\\)\\.\\.\\.", name = "dots" },
        f(function(_, snip)
            local prefix = snip.captures[1] == "," and ", " or ""
            return prefix .. "\\dots "
        end, {})
    ),
    s({ trig = "\\\\dots ,", name = "comma dots", condition = is_math }, t("\\dots,")),

    -- TODO: liminf -> \liminf NOT lim\inf
    --parse({ trig = "liminf", name = "liminf", priority = 0 }, "\\liminf_{${1:n} \\to ${2:\\infty}} "),
}
