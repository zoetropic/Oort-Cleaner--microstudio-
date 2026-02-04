updateWin = function()
  audio.playMusic("oort_theme").stop()
  audio.playMusic("tchakrulo", 0.7)
  if keyboard.press.ENTER then
    audio.playMusic("tchakrulo").stop()
    mode = "menu"
  end
end

drawWin = function()
  screen.drawMap("space", 0, 0, 200, 200)
  screen.drawRoundRect(0,0,180,180,8,"rgb(255,255,255)")
  screen.drawSprite("voyager", 0, -40, 50, 50)
  screen.drawText("You've successfully cleared a corridor for the Voyager", 0, 80, 7, "rgb(255,255,255)")
  screen.drawText("probes to exit the Oort cloud, the massive cluster of", 0, 70, 7, "rgb(255,255,255)")
  screen.drawText("asteroids at the edge of the Sun's gravity well. Now the", 0, 60, 7, "rgb(255,255,255)")
  screen.drawText("space probes can continue their journey into the depths", 0, 50, 7, "rgb(255,255,255)")
  screen.drawText(" of space, carrying with them the Golden Records;", 0, 40, 7, "rgb(255,255,255)")
  screen.drawText("gold-plated phonograph records, enscribed with", 0, 30, 7, "rgb(255,255,255)")
  screen.drawText(" a sampling of humanity itself- Our anatomy,", 0, 20, 7 ,"rgb(255,255,255)")
  screen.drawText("our culture, and our hopes for a better tomorrow.", 0, 10, 7, "rgb(255,255,255)")
  screen.drawText("Thank you for playing.", 0, -10, 8, "rgb(255,255,255)")
  screen.setAlpha(getFlashValue())
  screen.drawText("Press enter to return to menu", 0, -75, 8, "rgb(255,255,255)")
end
