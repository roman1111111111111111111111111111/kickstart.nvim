-- ~/.config/nvim/lua/luasnip-helper-funcs.lua
local M = {}

-- Be sure to explicitly define these LuaSnip node abbreviations!
local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node

function M.get_visual(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1, ''))
  end
end

-- Function from your example: check if in math zone using VimTeX
function M.in_mathzone()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

-- Negation of in_mathzone: expand only outside math zones
function M.in_textzone()
  return not M.in_mathzone()
end

return M


