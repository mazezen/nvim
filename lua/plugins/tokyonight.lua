return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "storm",  -- storm 最饱和，night 更暗，moon 中间
      transparent = false,
    })
    vim.cmd.colorscheme("tokyonight")
  end,
}
