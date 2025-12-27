-- 额外：mason-lspconfig（桥接 mason 和 lspconfig）
return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",         -- Lua（对应原来错误的 "lua"）
        "gopls",          -- Go（对应原来错误的 "go"）
        "pyright",        -- Python（推荐，比 pylsp 更快更好，对应 "python"）
        "rust_analyzer",  -- Rust（对应 "rust"）
        "ts_ls",          -- TypeScript / JavaScript（对应 "javascript", "typescript", "tsx"）
        "html",           -- HTML（对应 "html"）
        "cssls",          -- CSS（对应 "css"）
        "jsonls",         -- JSON（对应 "json", "jsonc"）
        "yamlls",         -- YAML（对应 "yaml", "toml" 中的 toml 需要单独的 taplo）
        "bashls",         -- Bash / Shell 脚本（对应 "bash"）
        "dockerls",       -- Dockerfile（对应 "dockerfile"）
        "marksman",       -- Markdown（对应 "markdown", "markdown_inline"）
        "taplo",          -- TOML（专门的 TOML LSP，对应 "toml"）
        "jdtls",          -- Java（对应 "java"）
        "phpactor",       -- PHP（对应 "php"，推荐的 PHP LSP）
        "kotlin_language_server",  -- Kotlin（对应 "kotlin"）
        "sqlls",          -- SQL（通用 SQL LSP，对应 "sql"）
        "clangd",         -- C / C++（对应 "c", "cpp"，强烈推荐）
        "protols",        -- Protobuf（对应 "proto"，如果你经常写 .proto 文件）
      },
      automatic_installation = true,  -- 自动安装
    })
  end,
}
