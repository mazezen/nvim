return {
  "williamboman/mason.nvim",
  cmd = "Mason",  -- 懒加载，只有运行 :Mason 时加载
  config = function()
    require("mason").setup({
      ensure_installed = {},
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
  end,
}

