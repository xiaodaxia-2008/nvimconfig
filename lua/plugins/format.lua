return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- Conform will run multiple formatters sequentially
      python = { "isort", "black" },
      -- Conform will run the first available formatter
      javascript = { "prettierd", "prettier", stop_after_first = true },
      cpp = { "clang-format" },
    },
  },
}
