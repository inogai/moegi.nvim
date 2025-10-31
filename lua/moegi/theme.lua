--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

local lush, U, C, c = require("moegi")._init()

package.loaded["moegi.theme.base"] = nil
package.loaded["moegi.theme.syntax"] = nil
package.loaded["moegi.theme.lsp"] = nil
package.loaded["moegi.theme.treesitter"] = nil

local specs = {
  require("moegi.theme.base"),
  require("moegi.theme.syntax"),
  require("moegi.theme.lsp"),
  require("moegi.theme.treesitter"),
}

vim
  .iter(c.integrations)
  :filter(function(_, v)
    return v ~= false
  end)
  :each(function(k, _)
    package.loaded["moegi.theme.integrations." .. k] = nil
    local ok, spec = pcall(require, "moegi.theme.integrations." .. k)
    if ok and spec then
      table.insert(specs, spec)
    end
  end)

return lush.merge(specs)
