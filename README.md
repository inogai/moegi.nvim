# moegi.nvim

A replica of the [moegi](https://github.com/moegi-design/vscode-theme) theme for neovim. Very alpha stage. Depends on [lush.nvim](https://github.com/rktjmp/lush.nvim).

## Sample Setup

### `lazy.nvim`

```lua
  {
    "inogai/moegi.nvim",
    dependencies = {
      "rktjmp/lush.nvim",
    },
    config = function()
      vim.o.background = "dark" -- or "light" for light mode
      vim.cmd([[colorscheme moegi]])
    end,
  },
```
