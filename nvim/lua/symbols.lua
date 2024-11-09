local M = {}

M.git = {
    UNSTAGED = "*",
    STAGED = "✓",
    UNMERGED = "&",
    RENAMED = "➜",
    DELETED = "-",
    UNTRACKED = "+",
    IGNORED = " ",
}

M.diagnostics = {
    ERROR = '!',
    WARN = 'w',
    INFO = 'i',
    HINT = '?',
}

return M
