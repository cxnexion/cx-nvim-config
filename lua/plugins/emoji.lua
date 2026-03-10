return {
  "ziontee113/icon-picker.nvim",
  dependencies = {
    "stevearc/dressing.nvim",
    "folke/which-key.nvim",
  },
  config = function()
    require("icon-picker").setup({ disable_legacy_commands = true })

    vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", { desc = "Insert Icon" })
    vim.keymap.set("n", "<leader>fi", "<cmd>IconPickerNormal<cr>", { desc = "Find Icon" })
  end,
}
