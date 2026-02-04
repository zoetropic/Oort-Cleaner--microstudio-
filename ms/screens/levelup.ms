updateLevel = function()
  audio.playMusic("oortmenu").stop()
  audio.playMusic("gameover").stop()
  if keyboard.press.ENTER then
    level += 1
    asteroidCounter = 0
    ufoCounter = 0
    mode = "play"
    initAsteroids()
    initShip()
    initLaser()
  end
end

drawLevel = function()
  screen.drawMap("space", 0, 0, 200, 200)
  screen.drawRoundRect(0,0,180,180,8,"rgb(255,255,255)")
  screen.drawText("Level " + level + " comlete!", 0, 70, 6, "rgb(255,255,255)")
  screen.drawText("Asteroids destroyed: " + asteroidCounter, 0, 40, 6, "rgb(255,255,255)")
  screen.drawText("UFOs destroyed: " + ufoCounter, 0, 0, 6, "rgb(255,255,255)")
  screen.setAlpha(getFlashValue())
  screen.drawText("Press Enter to Continue", 0, -40, 6, "rgb(255,255,255)")
  screen.setAlpha(1)
end
