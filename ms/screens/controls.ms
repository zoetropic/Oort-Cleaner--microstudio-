updateControl = function()
  if keyboard.press.ENTER then mode = "menu" end
end

drawControl = function()
  screen.drawMap("space", 0, 0, 200, 200)
  screen.drawRoundRect(0,0,180,180,8,"rgb(255,255,255)")
  screen.drawText("Press ⬅ or ➡ to rotate", -40,60, 4, "rgb(255,255,255)")
  screen.drawSprite("rotate", 40, 60, 16, 16)
  screen.drawText("Press ⬆ for thrust", -48, 40, 4, "rgb(255,255,255)")
  screen.drawSprite("thrust", 40, 40, 16, 16)
  screen.drawText("Press space to shoot", -42, 20, 4,"rgb(255,255,255)")
  screen.drawSprite("shoot", 40, 20, 16, 16)
  screen.drawText("Press H for Hyperdrive:", -39, -10, 4,"rgb(255,255,255)")
  screen.drawRoundRect(40, -20, 50, 50 4)
  screen.drawSprite("hyperdrive",40,-20, 50, 50)
  screen.setAlpha(getFlashValue())
  screen.drawText("Press enter to return to menu", 0, -80, 4, "rgb(255,255,255")
end

