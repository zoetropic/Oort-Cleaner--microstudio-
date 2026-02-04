updateTitleScreen = function()
  if keyboard.SPACE then
    mode = "menu"
  end
end

drawTitleScreen = function()
   screen.setFont("RetroGaming")
   screen.drawMap("space", 0, 0, 200, 200)
   screen.drawSprite("logo", 0, 20, 200, 50)
   screen.setAlpha(getFlashValue())
   screen.drawText("Press Space to Start", 0, -50, 4, "rgb(255,255,255)")
end
