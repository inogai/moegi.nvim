-- .lazy.lua - Auto-loaded by lazy.nvim for development
-- Preview highlight groups inline using mini.hipatterns
--
-- Based on: https://github.com/folke/tokyonight.nvim/blob/2642dbb83333e0575d1c3436e1d837926871c5fb/.lazy.lua
-- Copyright (c) 2021 Folke Lemaitre
-- Licensed under Apache-2.0
--
-- Modifications:
-- - Adapted for moegi.nvim colorscheme
-- - Changed hl_color to use background colors instead of marks
-- - Changed hl_group pattern to highlight commented lines as well
-- Copyright (c) 2025 inogai
--
-- This file remains under Apache-2.0 license (see below).
-- The rest of moegi.nvim is licensed under MIT.
--
-- SPDX-License-Identifier: Apache-2.0

local M = {
  module = "moegi",
  colorscheme = "moegi",
  opts = {},
  globals = { vim = vim },
  cache = {}, ---@type table<string, boolean>
}

function M.reset()
  M.cache = {}
  M.globals.C = require("moegi").get_palette()
end

---@param name string
---@param buf number
function M.hl_group(name, buf)
  return vim.api.nvim_buf_get_name(buf):find("kinds") and "LspKind" .. name or name
end

local function reload()
  for k in pairs(package.loaded) do
    if k:find("^" .. M.module) then
      package.loaded[k] = nil
    end
  end
  M.cache = {}
  require(M.module).setup(M.opts)
  M.reset()
  local colorscheme = vim.g.colors_name or M.colorscheme
  colorscheme = colorscheme:find(M.colorscheme) and colorscheme or M.colorscheme
  vim.cmd.colorscheme(colorscheme)
  local hi = require("mini.hipatterns")
  for _, buf in ipairs(require("mini.hipatterns").get_enabled_buffers()) do
    hi.update(buf)
  end
end
reload = vim.schedule_wrap(reload)

local augroup = vim.api.nvim_create_augroup("colorscheme_dev", { clear = true })
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  group = augroup,
  callback = reload,
})
vim.api.nvim_create_autocmd("BufWritePost", {
  group = augroup,
  pattern = "*/lua/" .. M.module .. "/**.lua",
  callback = reload,
})

return {
  {
    "nvim-mini/mini.hipatterns",
    opts = function(_, opts)
      local hi = require("mini.hipatterns")

      opts.highlighters = opts.highlighters or {}

      opts.highlighters = vim.tbl_extend("keep", opts.highlighters or {}, {
        hex_color = hi.gen_highlighter.hex_color({ priority = 2000 }),

        hl_group = {
          pattern = function(buf)
            return vim.api.nvim_buf_get_name(buf):find("lua/" .. M.module) and '^%s*-?-?%s*%[?"?()[%w%.@]+()"?%]?%s*='
          end,
          group = function(buf, match)
            local group = M.hl_group(match, buf)
            if group then
              if M.cache[group] == nil then
                M.cache[group] = false
                local hl = vim.api.nvim_get_hl(0, { name = group, link = false, create = false })
                if not vim.tbl_isempty(hl) then
                  hl.fg = hl.fg or vim.api.nvim_get_hl(0, { name = "Normal", link = false }).fg
                  M.cache[group] = true
                  vim.api.nvim_set_hl(0, group .. "Dev", hl)
                end
              end
              return M.cache[group] and group .. "Dev" or nil
            end
          end,
          extmark_opts = { priority = 2000 },
        },

        hl_color = {
          pattern = {
            "%f[%w]()C%.[%w_]+()%f[%W]",
          },
          group = function(_, match)
            local parts = vim.split(match, ".", { plain = true })
            local color = vim.tbl_get(M.globals, unpack(parts))
            return type(color) == "string" and require("mini.hipatterns").compute_hex_color_group(color, "bg")
          end,
          extmark_opts = { priority = 2000 },
        },
      })
    end,
  },
}
