-- You probably always want to set this in your vim file
if not vim.opt.background == "light" then
	vim.opt.background = "dark"
end
vim.g.colors_name = "moegi"

require("moegi").setup()
