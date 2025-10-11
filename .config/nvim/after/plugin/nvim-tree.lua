local tree = require("nvim-tree")

tree.setup({
  renderer = {
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = true,
        git = true
      }
    }
  }
})
