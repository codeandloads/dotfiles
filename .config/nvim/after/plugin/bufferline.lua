local bufferline = require "bufferline"

bufferline.setup {
  options = {
    style_preset = bufferline.style_preset.minimal, -- or bufferline.style_preset.minimal,

    indicator = {
      icon = "▎", -- this should be omitted if indicator style is not 'icon'
      style = "none",
    },
  },
}
