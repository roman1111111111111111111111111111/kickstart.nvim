-- From any snippet file, source `get_visual` from global helper functions file
local helpers = require 'snippets.luasnip-helper-funcs'
local get_visual = helpers.get_visual
local in_mathzone = helpers.in_mathzone
local in_textzone = helpers.in_textzone
local line_begin = require('luasnip.extras.expand_conditions').line_begin

-- Abbreviations used in this article and the LuaSnip docs
local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

return {
  -- rr snippet, auto-expand, outside math zone only
  s(
    { trig = '([^%a])rr', regTrig = true, wordTrig = false, snippetType = 'autosnippet', condition = in_textzone },
    fmta('<>\\ref{<>}', {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),

  -- cc snippet, auto-expand, outside math zone only
  s(
    { trig = '([^%a])cc', regTrig = true, wordTrig = false, snippetType = 'autosnippet', condition = in_textzone },
    fmta('<>\\cite{<>}', {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),

  s(
    {
      trig = 'template',
      snippetType = 'snippet',
      name = 'LaTeX Document Template',
      dscr = 'Basic LaTeX document structure',
    },
    fmta(
      [[
  \documentclass{article}

  \usepackage[utf8]{inputenc}
  \usepackage{amsmath, amssymb}
  \usepackage{graphicx}
  \usepackage{hyperref}

  \title{<>}
  \author{<>}
  \date{\today}

  \begin{document}

  \maketitle

  <>

  \end{document}
  ]],
      {
        i(1, 'Title Here'),
        i(2, 'Roman'),
        i(0),
      }
    )
  ),
  -- Chapter command, auto-expand, only at the beginning of a line
  s(
    { trig = 'chap', snippetType = 'autosnippet', condition = line_begin },
    fmta('\\chapter{<>}', {
      d(1, get_visual),
    })
  ),

  -- Section command, auto-expand, only at the beginning of a line
  s(
    { trig = 'sec', snippetType = 'autosnippet', condition = line_begin },
    fmta('\\section{<>}', {
      d(1, get_visual),
    })
  ),
  s(
    { trig = 'subs', snippetType = 'autosnippet', condition = line_begin },
    fmta('\\subsection{<>}', {
      d(1, get_visual),
    })
  ),
  s(
    { trig = '([%a])fat', regTrig = true, wordTrig = false, snippetType = 'autosnippet', condition = in_mathzone },
    fmta('\\boldsymbol{<>}', {
      f(function(_, snip)
        return snip.captures[1]
      end),
    })
  ),
  s(
    { trig = '([^%w])fat', regTrig = true, wordTrig = false, snippetType = 'autosnippet', condition = in_mathzone },
    fmta('\\boldsymbol{<>}', {
      d(1, get_visual),
    })
  ),

  s(
    { trig = '([^%s])sub', regTrig = true, wordTrig = false, snippetType = 'autosnippet', condition = in_mathzone },
    fmta('<>_{<>}', {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),
}
