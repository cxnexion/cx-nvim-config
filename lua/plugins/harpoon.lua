return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    -- Add file to harpoon
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, {desc = "Open harpoon telescope windows"})

    local wk = require("which-key")
    wk.add({{"<leader>a", desc = "Add Buffer to Harpoon" }})

    -- Open harpoon menu
    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    -- Open harpoon telescope menu
    vim.keymap.set("n", "<C-h>", function()
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end
        require("telescope.pickers").new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({ results = file_paths }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        }):find()
      end
      toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon window" })

    -- Navigate between marked files
    vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)

    vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
  end
}
