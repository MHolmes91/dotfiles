return {
  "ibhagwan/fzf-lua",
  keys = {
    -- Change from root to CWD by default
    { "<leader><space>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
    { "<leader>/", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
  },
}
