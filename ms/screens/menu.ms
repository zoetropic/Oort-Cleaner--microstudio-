initMenu = function()
  
  pause = new Menu()
  pause.items = [
    "Resume",
    "Reset",
    "Main Menu"]
  
  main = new Menu()
  main.items = [
    "Play",
    "Controls",
    "Difficulty",
    "Title Screen",
    "Credits"]
  
  diff = new Menu()
  diff.items = [
    "Easy",
    "Normal",
    "Hard"]
end

Menu = class
  
  constructor = function()
  items = []
  cursor = 0
  end

end

/*This would have been better as a switch case but microScript doesn't support
  switch cases so enjoy this massive if/elsif statement */
processMenuRequest = function(request)
  if request == "Resume" then
    mode = "play"
    ufoSound.play()
  elsif request == "Reset" then
    mode = "play"
    level = 1
    score = 0
    lives = 2
    ufoCounter = 0
    asteroidCounter = 0
    ufoSound.stop()
    initShip()
    initAsteroids()
    initUfos()
  elsif request == "Main Menu" then
    mode = "menu"
    level = 1
  elsif request == "Play" then
    mode = "play"
    level = 1
    score = 0
    lives = 2
    ufoCounter = 0
    asteroidCounter = 0
    ufoSound.stop()
    initShip()
    initAsteroids()
    initUfos()
  elsif request == "Controls" then
    mode = "control"
  elsif request == "Difficulty" then
    mode = "difficulty"
  elsif request == "Credits" then
    mode = "credits"
  elsif request == "Title Screen" then
    mode = "title"
  elsif request == "Easy" then
    difficulty = 1
    initAsteroids()
    mode = "menu"
  elsif request == "Normal" then
    difficulty = 3
    mode = "menu"
    initAsteroids()
  elsif request == "Hard" then
    difficulty = 5
    mode = "menu"
    initAsteroids()
  end
end

updatePauseMenu = function()
  if keyboard.press.ENTER then
    processMenuRequest(pause.items[pause.cursor])
  elsif keyboard.press.DOWN then
    pause.cursor += 1
    if pause.cursor >= pause.items.length then
      pause.cursor = 0
      end
  elsif keyboard.press.UP then
    pause.cursor -= 1
    if pause.cursor < 0 then
      pause.cursor = pause.items.length - 1
    end
  end
end

updateMainMenu = function()
  if keyboard.press.ENTER then
    processMenuRequest(main.items[main.cursor])
  elsif keyboard.press.DOWN then
    main.cursor += 1
    if main.cursor >= main.items.length then
      main.cursor = 0
      end
  elsif keyboard.press.UP then
    main.cursor -= 1
    if main.cursor < 0 then
      main.cursor = main.items.length - 1
    end
  end
end

updateDifficultyMenu = function()
  if keyboard.press.ENTER then
    processMenuRequest(diff.items[diff.cursor])
  elsif keyboard.press.DOWN then
    diff.cursor += 1
    if diff.cursor >= diff.items.length then
      diff.cursor = 0
      end
  elsif keyboard.press.UP then
    diff.cursor -= 1
    if diff.cursor < 0 then
      diff.cursor = diff.items.length - 1
    end
  end
end

drawPauseMenu = function()
  screen.drawMap("space", 0, 0, 200, 200)
  screen.drawText("Game Paused", 0, 60, 12, "rgb(255,255,255)")
  local i = 0
  for item in pause.items
    if i == pause.cursor then
      screen.setAlpha(getFlashValue())
      screen.drawText(item, 0, 25-25*i, 6, "rgb(227,176,76)")
      screen.drawSprite("ship", -60-5*i, 25-25*i, 16, 16)
    else
      screen.setAlpha(0.6)
      screen.drawText(item, 0, 25-25*i, 4, "rgb(255,255,255)")
    end
    screen.setAlpha(1)
    i += 1
  end
end

drawMainMenu = function()
  screen.drawMap("space", 0, 0, 200, 200)
  screen.drawText("Main Menu", 0, 60, 12, "rgb(255,255,255)")
  local i = 0
  for item in main.items
    if i == main.cursor then
      screen.setAlpha(getFlashValue())
      screen.drawText(item, 0, 25-25*i, 6, "rgb(227,176,76)")
      screen.drawSprite("ship", -22-5*i, 25-25*i, 16, 16)
    else
      screen.setAlpha(0.6)
      screen.drawText(item, 0, 25-25*i, 4, "rgb(255,255,255)")
    end
    screen.setAlpha(1)
    i += 1
  end
end
  
drawDifficultyMenu = function()
  screen.drawMap("space", 0, 0, 200, 200)
  screen.drawText("Select Difficulty", 0, 60, 12, "rgb(255,255,255)")
  local i = 0
  for item in diff.items
    if i == diff.cursor then
      screen.setAlpha(getFlashValue())
      screen.drawText(item, 0, 25-25*i, 6, "rgb(227,176,76)")
      screen.drawSprite("ship", -25, 25-25*i, 16, 16)
    else
      screen.setAlpha(0.6)
      screen.drawText(item, 0, 25-25*i, 4, "rgb(255,255,255)")
    end
    screen.setAlpha(1)
    i += 1
  end
end