init = function()
  mode = "title"
  level = 1
  difficulty = 3
  score = 0
  lives = 2
  counter = 5000
  threshold = 5000
  asteroidCounter = 0
  ufoCounter = 0
  stimer = 5
  initMenu()
  initShip()
  initLaser()
  initAsteroids()
  initUfos()
end


update = function()
  /*this block handles the switching between screens because there's no switch
    cases in microscript */
  if mode == "title" then
    menuTheme = audio.playMusic("oortmenu", 0.5, 1)
    menuTheme.play()
    updateTitleScreen()
  elsif mode == "menu" then
    gameOver.stop()
    gameOver.setPosition(0)
    mainTheme.stop()
    mainTheme.setPosition(0)
    menuTheme.play()
    updateMainMenu()
  elsif mode == "pause" then
    ufoSound.stop()
    updatePauseMenu()
  elsif mode == "difficulty" then
    updateDifficultyMenu()
  elsif mode == "gameover" then
    mainTheme.stop()
    mainTheme.setPosition(0)
    gameOver = audio.playMusic("gameover", 0.5, 1)
    gameOver.play()
    ufoSound.stop()
    updateGameOver()
  elsif mode == "control" then
    updateControl()
  elsif mode == "credits" then
    updateCredits()
  elsif mode == "level" then
    initLaser()
    updateLevel()
  elsif mode == "win" then
    mainTheme.stop()
    mainTheme.setPosition(0)
    winTheme = audio.playMusic("tchakrulo", 0.5, 1)
    winTheme.play()
    updateWin()
  elsif mode == "play" then
    //switches music and resets previous track to the beginning
    mainTheme = audio.playMusic("oort_theme", 0.5, 1)
    menuTheme.stop()
    menuTheme.setPosition(0)
    mainTheme.play()
    
    
    updateShip()
    updateAsteroids()
    updateUfos()
    fireLaser()
    moveLaser()

    //level progression
    if asteroids.length == 0 then
      if score >= 100000 then
        mode = "win"
      else
        mode = "level"
        updateLevel()
      end
    end
    
    //moves to gameover screen when lives reach 0
    if lives < 1 then
      mode = "gameover"
      score = 0
    end
    
    //Adds a life to the total after reaching the threshold declared at init
    if score >= counter then
      lives += 1
      counter += threshold
      audio.playSound("newlife")
    end
    
    //pause function
    if keyboard.press.ESCAPE then
      mode = "pause"
    end
  end
end

draw = function()
  
  //Screen selection is done through the "mode" variable
  if mode == "title" then
    drawTitleScreen()
  
  elsif mode == "menu" then
    drawMainMenu()
  
  elsif mode == "control" then
    drawControl()
  
  elsif mode == "difficulty" then
    drawDifficultyMenu()
  
  elsif mode == "credits" then
    drawCredits()
    
  elsif mode == "gameover" then
    drawGameOver()
  
  elsif mode == "pause" then
    drawPauseMenu()
  
  elsif mode == "win" then
    drawWin()
    
  elsif mode == "level" then
    drawLevel()
  
  elsif mode == "play" then
  screen.drawMap("space", 0, 0, 200, 200)
  drawShip()
  drawLaser()
  drawAsteroids()
  drawUfos()
  screen.drawText(score, -80, 80, 6, "rgb(255,255,255)")
  
  //Handling the display for lives to avoid overflow
    local i = 0
    if lives <= 5 then
      while i < lives
        screen.setDrawRotation(90)
        screen.drawSprite("ship", -75-i*5, 70, 10, 10)
        screen.setDrawRotation(0)
        i += 1
      end
    if i == lives then
      i = 0
    end
    
    elsif lives > 5 then
      screen.setDrawRotation(90)
      screen.drawSprite("ship", -75-i*5, 70, 10, 10)
      screen.setDrawRotation(0)
      screen.drawText("x" + lives, -70, 70, 4, "rgb(255,255,255)")
    end
  end
end