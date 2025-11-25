local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<c-u>', '21gk', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<c-d>', '21gj', { noremap = false, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


if vim.g.vscode then
  vscode = require('vscode')
  map("n", "H",                 function () vscode.action('workbench.action.previousEditor') end, opts)
  map("n", "L",                 function () vscode.action('workbench.action.nextEditor') end, opts)
  map('n', '<C-a>',             function() vscode.action('editor.action.selectAll') end, opts)
  map("n", "<leader>=",         function () vscode.action('editor.action.formatDocument') end)

  -- general keymap
  map({"v"},      "<c-c>",      function () vscode.action('editor.action.clipboardCopyAction') end, opts)
  map({"n", "v"}, "<c-v>",      function () vscode.action('editor.action.clipboardPasteAction') end, opts)
  map({"n", "v"}, "<leader>e",  function () vscode.action('workbench.view.explorer') end)
  map({"n", "v"}, "<leader>ql", function () vscode.action('workbench.action.closeEditorsToTheRight') end)
  map({"n", "v"}, "<leader>qo", function () vscode.action('workbench.action.closeOtherEditors') end)
  map({"n", "v"}, "<leader>qh", function () vscode.action('workbench.action.closeEditorsToTheLeft') end)
  map({"n", "v"}, "]d",         function () vscode.action('editor.action.marker.next') end)
  map({"n", "v"}, "[d",         function () vscode.action('editor.action.marker.prev') end)
  map({"n", "v"}, "<leader>t",  function () vscode.action('workbench.action.terminal.toggleTerminal') end)
  map({"n", "v"}, "<leader>b",  function () vscode.action('editor.debug.action.toggleBreakpoint') end)
  map({"n", "v"}, "K",          function () vscode.action('editor.action.showHover') end)
  map({"n", "v"}, "<leader>a",  function () vscode.action('editor.action.quickFix') end)
  map({"n", "v"}, "<leader>sp", function () vscode.action('workbench.actions.view.problems') end)
  map({"n", "v"}, "<leader>cn", function () vscode.action('notifications.clearAll') end)
  map({"n", "v"}, "<leader>ff", function () vscode.action('workbench.action.quickOpen') end)
  map({"n", "v"}, "<leader>fr", function () vscode.action('revealFileInOS') vscode.action('remote-wsl.revealInExplorer')end)
  map({"n", "v"}, "<leader>cp", function () vscode.action('workbench.action.showCommands') end)
  map({"n", "v"}, "<leader>r",  function () vscode.action('code-runner.run') end)

  -- harpoon keymaps
  map({"n", "v"}, "<leader>ha", function () vscode.action('vscode-harpoon.addEditor') end)
  map({"n", "v"}, "<leader>ho", function () vscode.action('vscode-harpoon.editorQuickPick') end)
  map({"n", "v"}, "<leader>he", function () vscode.action('vscode-harpoon.editEditors') end)
  map({"n", "v"}, "<leader>h2", function () vscode.action('vscode-harpoon.gotoEditor1') end)
  map({"n", "v"}, "<leader>h3", function () vscode.action('vscode-harpoon.gotoEditor2') end)
  map({"n", "v"}, "<leader>h4", function () vscode.action('vscode-harpoon.gotoEditor3') end)
  map({"n", "v"}, "<leader>h5", function () vscode.action('vscode-harpoon.gotoEditor4') end)
  map({"n", "v"}, "<leader>h6", function () vscode.action('vscode-harpoon.gotoEditor5') end)
  map({"n", "v"}, "<leader>h7", function () vscode.action('vscode-harpoon.gotoEditor6') end)
  map({"n", "v"}, "<leader>h8", function () vscode.action('vscode-harpoon.gotoEditor7') end)
  map({"n", "v"}, "<leader>h9", function () vscode.action('vscode-harpoon.gotoEditor8') end)
  map({"n", "v"}, "<leader>h10",function () vscode.action('vscode-harpoon.gotoEditor9') end)

  -- project manager keymaps
  map({"n", "v"}, "<leader>pa", function () vscode.action('projectManager.saveProject') end)
  map({"n", "v"}, "<leader>po", function () vscode.action('projectManager.listProjectsNewWindow') end)
  map({"n", "v"}, "<leader>pe", function () vscode.action('projectManager.editProjects') end)
  map({"n", "v"}, "?",          function () vscode.action('workbench.action.quickTextSearch') end)
  -- code fold
  map("n", "zc",                function () vscode.action('editor.fold') end, opts)      -- close fold (unfold)
  map("n", "zC",                function () vscode.action('editor.foldRecursively') end, opts) -- unfold all sublevels
  map("n", "zo",                function () vscode.action('editor.unfold') end, opts)        -- open fold (fold one level)
  map("n", "zO",                function () vscode.action('editor.unfoldRecursively') end, opts) -- open fold recursively
  map("n", "za",                function () vscode.action('editor.foldToggle') end, opts)  -- toggle current fold
  map("n", "zA",                function () vscode.action('editor.foldRecursiveleToggle') end, opts) -- toggle recursively
  map("n", "zm",                function () vscode.action('editor.foldAll') end, opts)  -- fold more (collapse deeper)
  map("n", "zr",                function () vscode.action('editor.unfoldAll') end, opts) -- reduce fold (open some)
else 
  map("n", "H", "gt", opts)
  map("n", "L", "gT", opts)
  map('n', '<leader>=', 'ggVG=', opts)
  map('n', '<leader>qo', ':tabo<CR>', opts)
end

map('v', '<leader>y', "\"+y", opts)
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })
map("n", "<", "<<", opts)
map("n", ">", ">>", opts)
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map("n", "<Esc>", ":noh<cr>", { desc = "general clear highlights" })
