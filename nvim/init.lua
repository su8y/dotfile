local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', 'j', 'gj', opts)
vim.api.nvim_set_keymap('n', 'k', 'gk', opts)
vim.api.nvim_set_keymap('n', '<c-u>', '20gk', opts)
vim.api.nvim_set_keymap('n', '<c-d>', '20gj', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

map("n", "<", "<<", opts)
map("n", ">", ">>", opts)
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })
map('n', '<leader>qo', ':tabo<CR>', { remap = true })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

if vim.g.vscode then
  map("n", "H", "gt", opts)
  map("n", "L", "gT", opts)

  map('n', '<leader>=', '<Cmd>call VSCodeNotify("editor.action.formatDocument")<CR>', opts)
  -- general keymaps
  map({"n", "v"}, "<leader>e", "<cmd>lua require('vscode').action('workbench.view.explorer')<CR>")
  map({"n", "v"}, "<leader>ql", "<cmd>lua require('vscode').action('workbench.action.closeEditorsToTheRight')<CR>")
  map({"n", "v"}, "<leader>qh", "<cmd>lua require('vscode').action('workbench.action.closeEditorsToTheLeft')<CR>")
  map({"n", "v"}, "]d", "<cmd>lua require('vscode').action('editor.action.marker.next')<CR>")
  map({"n", "v"}, "[d", "<cmd>lua require('vscode').action('editor.action.marker.prev')<CR>")
  map({"n", "v"}, "<leader>t", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")
  map({"n", "v"}, "<leader>b", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
  map({"n", "v"}, "K", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
  map({"n", "v"}, "<leader>a", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
  map({"n", "v"}, "<leader>sp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
  map({"n", "v"}, "<leader>cn", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")
  map({"n", "v"}, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
  map({"n", "v"}, "<leader>cp", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
  map({"n", "v"}, "<leader>pr", "<cmd>lua require('vscode').action('code-runner.run')<CR>")
  map("n", "H", "<Cmd>lua require('vscode').action('workbench.action.previousEditor')<CR>", opts)
  map("n", "L", "<Cmd>lua require('vscode').action('workbench.action.nextEditor')<CR>", opts)

  -- harpoon keymaps
  map({"n", "v"}, "<leader>ha", "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>")
  map({"n", "v"}, "<leader>ho", "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>")
  map({"n", "v"}, "<leader>he", "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>")
  map({"n", "v"}, "<leader>h1", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>")
  map({"n", "v"}, "<leader>h2", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>")
  map({"n", "v"}, "<leader>h3", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>")
  map({"n", "v"}, "<leader>h4", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>")
  map({"n", "v"}, "<leader>h5", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor5')<CR>")
  map({"n", "v"}, "<leader>h6", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor6')<CR>")
  map({"n", "v"}, "<leader>h7", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor7')<CR>")
  map({"n", "v"}, "<leader>h8", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor8')<CR>")
  map({"n", "v"}, "<leader>h9", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor9')<CR>")

  -- project manager keymaps
  map({"n", "v"}, "<leader>pa", "<cmd>lua require('vscode').action('projectManager.saveProject')<CR>")
  map({"n", "v"}, "<leader>po", "<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<CR>")
  map({"n", "v"}, "<leader>pe", "<cmd>lua require('vscode').action('projectManager.editProjects')<CR>")
  map({"n", "v"}, "?", "<cmd>lua require('vscode').action('workbench.action.findInFiles')<CR>")
  map("n", "zc", "<Cmd>lua require('vscode').action('editor.fold')<CR>", opts)      -- close fold (unfold)
  map("n", "zC", "<Cmd>lua require('vscode').action('editor.foldRecursively')<CR>", opts) -- unfold all sublevels
  map("n", "zo", "<Cmd>lua require('vscode').action('editor.unfold')<CR>", opts)        -- open fold (fold one level)
  map("n", "zO", "<Cmd>lua require('vscode').action('editor.unfoldRecursively')<CR>", opts) -- open fold recursively
  map("n", "za", "<Cmd>lua require('vscode').action('editor.foldToggle')<CR>", opts)  -- toggle current fold
  map("n", "zA", "<Cmd>lua require('vscode').action('editor.foldRecursivelyToggle')<CR>", opts) -- toggle recursively
  map("n", "zm", "<Cmd>lua require('vscode').action('editor.foldAll')<CR>", opts)  -- fold more (collapse deeper)
  map("n", "zr", "<Cmd>lua require('vscode').action('editor.unfoldAll')<CR>", opts) -- reduce fold (open some)
else
  map("n", "H", "gt", opts)
  map("n", "L", "gT", opts)
  map('n', '<leader>=', 'ggVG=', opts)
end


