return {
  "ibhagwan/fzf-lua",
  keys = {
    -- Change from root to CWD by default
    { "<leader><space>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
    { "<leader>/", LazyVim.pick("grep_project", { root = false }), desc = "Grep (cwd)" },
  },
}
