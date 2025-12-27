return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").setup({
      plugins = { marks = true, registers = true },
      win = { border = "rounded" },
    })
  end,
}
