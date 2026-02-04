updateCredits = function()
  
  if keyboard.press.ENTER then
    mode = "menu"
  end
end

drawCredits = function()
  screen.drawMap("space", 0, 0, 200, 200)
  screen.drawRoundRect(0,0,180,180,8,"rgb(255,255,255)")
  screen.drawText("Programming: Hek80", 0, 80, 6, "rgb(255,255,255)")
  screen.drawText("Pixel art: Hek80", 0, 60, 6, "rgb(255,255,255)")
  screen.drawText("Sound design: Hek80", 0, 40, 6, "rgb(255,255,255)")
  screen.drawText("Music: Hek80", 0, 20, 6, "rgb(255,255,255)")
  screen.drawText(" 'Tchakrulo', Georgia S.S.R Chorus ", 0, 0, 6, "rgb(255,255,255)")
  screen.drawText("recorded for Radio Moscow ca. 1957", 0, -10. 4)
  screen.drawText("Special Thanks to:", 0, -30, 6, "rgb(255,255,255)")
  screen.drawText("Mom - Design Consultant", 0, -50, 6, "rgb(255,255,255)")
  screen.setAlpha(getFlashValue())
  screen.drawText("Press enter to return to menu", 0, -70, 6, "rgb(255,255,255")
  screen.setAlpha(0.7)
  screen.drawText("Totally not a ripoff of: ASTEROIDS - ©ATARI 1979  ", 0, -85, 3)
end

