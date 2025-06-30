MiniPairs = require("mini.pairs")

-- TODO: apparently the better way to handle `', ``'', \(\), and \[\] is with snippets

MiniPairs.map_buf(0, "i", "`", { action = "open", pair = "`'", neigh_pattern = "[^\\]." })
MiniPairs.map_buf(0, "i", "'", { action = "close", pair = "`'", neigh_pattern = "[^\\]." })
