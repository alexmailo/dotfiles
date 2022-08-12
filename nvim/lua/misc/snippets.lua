local ls = require"luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l
local postfix = require("luasnip.extras.postfix").postfix

ls.add_snippets("all", {
	s("ternary", {
		i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
	})
})
ls.add_snippets("html", {
	s("!!", {
		t({'<html lang="en">', ' ','<head>','\t<meta charset="UTF-8">', '\t<meta name="viewport" content="width=device-width, initial-scale=1.0">',  "\t<title>"}),
		i(1, "title"),
		t({ "</title>", '\t<link rel="stylesheet" href="style.css">', '</head>', ' ',
			'<body>', '\t<script src="main.js" defer></script>', '\t<h1> Hello World</h1>', '</body>', ' ',
		'</html>'}),
	})
})
