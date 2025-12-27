return {
  "leoluz/nvim-dap-go",
  dependencies = { "mfussenegger/nvim-dap" },
  config = function()
    require("dap-go").setup({
      delve = {
        port = "38697",
      },
      -- 关键：关闭 Treesitter 依赖，用正则查找测试
      dap_configurations = {
        {
          type = "go",
          name = "Debug",
          request = "launch",
          program = "${fileDirname}",
        },
        {
          type = "go",
          name = "Debug test (go.mod)",
          request = "launch",
          mode = "test",
          program = "./${relativeFileDirname}",
        },
      },
      -- 禁用 Treesitter 测试查找
      test_runner = "go",  -- 用 go test 命令代替 Treesitter
    })

    vim.keymap.set("n", "<leader>dt", require("dap-go").debug_test, { desc = "Debug Nearest Test" })
  end,
}