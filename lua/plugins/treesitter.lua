return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",  -- 自动更新 parsers
  lazy = false,         -- treesitter 不支持懒加载，必须立即加载
  opts = {
    ensure_installed = {
      "lua", "vim", "vimdoc", "query",
      "bash", "c", "cpp", "css", "html",
      "javascript", "typescript", "tsx",
      "json", "jsonc", "markdown", "markdown_inline",
      "python", "rust", "toml", "yaml",
      "go", "java", "php", "swift",
    },
    auto_install = true,     -- 自动安装缺失 parser（推荐，需要 tree-sitter CLI）
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    -- 应用配置（新版直接用 setup）
    require("nvim-treesitter").setup(opts)

    -- 可选：同步更新 parsers（首次安装时强制同步）
    -- require("nvim-treesitter.install").update({ with_sync = true })
  end,
}
