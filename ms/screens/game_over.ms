updateGameOver = function()
  if keyboard.press.ENTER then
    mode = "menu"
  end
end

drawGameOver = function()
  screen.clear
  screen.drawMap("space", 0, 0, 200, 200)
  screen.drawText("Game Over!", 0, 30, 12, "rgb(255,255,255)")
  screen.setAlpha(getFlashValue())
  screen.drawText("Press Enter to Return to Menu", 0, -10, 4, "rgb(255,255,255)")
end