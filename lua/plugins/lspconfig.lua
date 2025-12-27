return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- 只加全局 LSP 快捷键（LspAttach 事件在服务器 attach 时触发）
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)          -- 跳转定义
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)                -- Hover 文档
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)      -- 实现
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)      -- 重命名（空格 rn）
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- Code Action（空格 ca）
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)          -- 引用
        
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format { async = true }
        end, opts)

        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)  -- 空格 e 显示当前行错误详情
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)   -- 空格 q 把所有错误放进 location list

      end,
    })
  end,
}
