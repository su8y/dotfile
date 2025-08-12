-- 맵 리더 설정 (가장 먼저 설정하는 것이 좋음)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- 키맵 유틸리티 설정
local map = vim.keymap.set
-- 기본 옵션: non-recursive, silent
local base_opts = { noremap = true, silent = true }

---
--  बेसिक 에디터 매핑 (Neovim / VSCode 공통)
---

-- 줄바꿈시에도 시각적 이동 (j/k)
map('n', 'j', 'gj', { noremap = true, desc = "Move visual line down" })
map('n', 'k', 'gk', { noremap = true, desc = "Move visual line up" })

-- 스크롤 (20줄)
map('n', '<c-u>', '20gk', { noremap = true, silent = true, desc = "Scroll 20 lines up" })
map('n', '<c-d>', '20gj', { noremap = true, silent = true, desc = "Scroll 20 lines down" })

-- 인덴트 (Normal & Visual 모드)
map("n", "<", "<<", { noremap = true, silent = true, desc = "Decrease indent" })
map("n", ">", ">>", { noremap = true, silent = true, desc = "Increase indent" })
map("v", "<", "<gv", { noremap = true, silent = true, desc = "Decrease indent (Visual)" })
map("v", ">", ">gv", { noremap = true, silent = true, desc = "Increase indent (Visual)" })

-- 주석 (플러그인 매핑 호출을 위해 remap = true)
map("n", "<leader>/", "gcc", { remap = true, silent = true, desc = "Toggle comment" })
map("v", "<leader>/", "gc", { remap = true, silent = true, desc = "Toggle comment (Visual)" })

-- 검색 하이라이트 제거
map("n", "<Esc>", "<cmd>noh<CR>", { silent = true, desc = "Clear search highlights" })

-- 코드 포매팅 
map('n', '<leader>=', 'ggVG=', { noremap = true, silent = true, desc = "Format entire file" })

-- 탭 이동
map("n", "H", "gT", { remap = true, silent = true, desc = "Previous tab" })
map("n", "L", "gt", { remap = true, silent = true, desc = "Next tab" })

-- 다른 탭 모두 닫기
map('n', '<leader>qo', ':tabo<CR>', { remap = true, silent = true, desc = "Tab only (close others)" })


if vim.g.vscode then
  -- ===============================
  --  VSCode Neovim Extension Mappings
  -- ===============================

  -- VSCode action 호출을 위한 헬퍼 함수
  local function vsc(action)
    return string.format("<cmd>lua require('vscode').action('%s')<CR>", action)
  end

  -- 각 매핑에 사용할 기본 옵션 (desc는 개별 추가)
  local opts = { noremap = true, silent = true }

  -- 1. 포맷팅 & 일반
  map('n', '<leader>=', vsc('editor.action.formatDocument'), { noremap = true, silent = true, desc = "Format document" })
  map({"n", "v"}, "K", vsc('editor.action.showHover'), { noremap = true, silent = true, desc = "Show hover" })
  map({"n", "v"}, "<leader>a", vsc('editor.action.quickFix'), { noremap = true, silent = true, desc = "Quick fix" })
  map({"n", "v"}, "?", vsc('workbench.action.findInFiles'), { noremap = true, silent = true, desc = "Find in files" })

  -- 2. 탐색기 & 에디터(탭) 이동
  map({"n", "v"}, "<leader>e", vsc('workbench.view.explorer'), { noremap = true, silent = true, desc = "Toggle explorer" })
  map({"n", "v"}, "<leader>ql", vsc('workbench.action.closeEditorsToTheRight'), { noremap = true, silent = true, desc = "Close editors to the right" })
  map({"n", "v"}, "<leader>qh", vsc('workbench.action.closeEditorsToTheLeft'), { noremap = true, silent = true, desc = "Close editors to the left" })

  -- 3. 터미널 & 실행
  map({"n", "v"}, "<leader>t", vsc('workbench.action.terminal.toggleTerminal'), { noremap = true, silent = true, desc = "Toggle terminal" })
  map({"n", "v"}, "<leader>pr", vsc('code-runner.run'), { noremap = true, silent = true, desc = "Code runner: Run" })

  -- 4. 진단 & 알림 (Diagnostics)
  map({"n", "v"}, "]d", vsc('editor.action.marker.next'), { noremap = true, silent = true, desc = "Next diagnostic" })
  map({"n", "v"}, "[d", vsc('editor.action.marker.prev'), { noremap = true, silent = true, desc = "Previous diagnostic" })
  map({"n", "v"}, "<leader>sp", vsc('workbench.actions.view.problems'), { noremap = true, silent = true, desc = "Show problems view" })
  map({"n", "v"}, "<leader>cn", vsc('notifications.clearAll'), { noremap = true, silent = true, desc = "Clear all notifications" })

  -- 5. 디버깅
  map({"n", "v"}, "<leader>b", vsc('editor.debug.action.toggleBreakpoint'), { noremap = true, silent = true, desc = "Toggle breakpoint" })

  -- 6. 빠른 열기 & 커맨드 팔레트
  map({"n", "v"}, "<leader>ff", vsc('workbench.action.quickOpen'), { noremap = true, silent = true, desc = "Find file (Quick Open)" })
  map({"n", "v"}, "<leader>cp", vsc('workbench.action.showCommands'), { noremap = true, silent = true, desc = "Show command palette" })

  -- 7. Harpoon (VSCode Extension)
  map({"n", "v"}, "<leader>ha", vsc('vscode-harpoon.addEditor'), { noremap = true, silent = true, desc = "Harpoon: Add editor" })
  map({"n", "v"}, "<leader>ho", vsc('vscode-harpoon.editorQuickPick'), { noremap = true, silent = true, desc = "Harpoon: Quick pick" })
  map({"n", "v"}, "<leader>he", vsc('vscode-harpoon.editEditors'), { noremap = true, silent = true, desc = "Harpoon: Edit editors" })
  map({"n", "v"}, "<leader>h1", vsc('vscode-harpoon.gotoEditor1'), { noremap = true, silent = true, desc = "Harpoon: Go to editor 1" })
  map({"n", "v"}, "<leader>h2", vsc('vscode-harpoon.gotoEditor2'), { noremap = true, silent = true, desc = "Harpoon: Go to editor 2" })
  map({"n", "v"}, "<leader>h3", vsc('vscode-harpoon.gotoEditor3'), { noremap = true, silent = true, desc = "Harpoon: Go to editor 3" })
  map({"n", "v"}, "<leader>h4", vsc('vscode-harpoon.gotoEditor4'), { noremap = true, silent = true, desc = "Harpoon: Go to editor 4" })
  map({"n", "v"}, "<leader>h5", vsc('vscode-harpoon.gotoEditor5'), { noremap = true, silent = true, desc = "Harpoon: Go to editor 5" })
  map({"n", "v"}, "<leader>h6", vsc('vscode-harpoon.gotoEditor6'), { noremap = true, silent = true, desc = "Harpoon: Go to editor 6" })
  map({"n", "v"}, "<leader>h7", vsc('vscode-harpoon.gotoEditor7'), { noremap = true, silent = true, desc = "Harpoon: Go to editor 7" })
  map({"n", "v"}, "<leader>h8", vsc('vscode-harpoon.gotoEditor8'), { noremap = true, silent = true, desc = "Harpoon: Go to editor 8" })
  map({"n", "v"}, "<leader>h9", vsc('vscode-harpoon.gotoEditor9'), { noremap = true, silent = true, desc = "Harpoon: Go to editor 9" })

  -- 8. Project Manager (VSCode Extension)
  map({"n", "v"}, "<leader>pa", vsc('projectManager.saveProject'), { noremap = true, silent = true, desc = "Project: Save project" })
  map({"n", "v"}, "<leader>po", vsc('projectManager.listProjectsNewWindow'), { noremap = true, silent = true, desc = "Project: Open project" })
  map({"n", "v"}, "<leader>pe", vsc('projectManager.editProjects'), { noremap = true, silent = true, desc = "Project: Edit projects" })

  -- 9. 폴딩 (Folding)
  map("n", "zc", vsc('editor.fold'), { noremap = true, silent = true, desc = "Fold" })
  map("n", "zC", vsc('editor.foldRecursively'), { noremap = true, silent = true, desc = "Fold recursively" })
  map("n", "zo", vsc('editor.unfold'), { noremap = true, silent = true, desc = "Unfold" })
  map("n", "zO", vsc('editor.unfoldRecursively'), { noremap = true, silent = true, desc = "Unfold recursively" })
  map("n", "za", vsc('editor.foldToggle'), { noremap = true, silent = true, desc = "Toggle fold" })
  map("n", "zA", vsc('editor.foldRecursivelyToggle'), { noremap = true, silent = true, desc = "Toggle fold recursively" })
  map("n", "zm", vsc('editor.foldAll'), { noremap = true, silent = true, desc = "Fold all" })
  map("n", "zr", vsc('editor.unfoldAll'), { noremap = true, silent = true, desc = "Unfold all" })

else
end