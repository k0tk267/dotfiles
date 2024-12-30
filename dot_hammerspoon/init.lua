j-- https://github.com/asmagill/hs._asm.spaces
-- https://zenn.dev/yanskun/articles/change-terminal-emulator#2.-%E3%82%A2%E3%82%AF%E3%83%86%E3%82%A3%E3%83%96%E3%81%AA%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%81%A7%E8%A1%A8%E7%A4%BA%E3%81%99%E3%82%8B
local spaces = require("hs.spaces")

function MoveActiveScreen(app)
  local window = app:focusedWindow()

  local focused = spaces.focusedSpace()

  spaces.moveWindowToSpace(window:id(), focused)
  window:focus()
end

hs.hotkey.bind({"option"}, "space", function()
  hs.keycodes.setMethod('Alphanumeric (Google)')

  local alacritty = hs.application.find('alacritty')
  if alacritty == nil then
    hs.application.launchOrFocus("/Applications/Alacritty.app")
  elseif alacritty:isFrontmost() then
    alacritty:hide()
  else
    MoveActiveScreen(alacritty)
  end
end)