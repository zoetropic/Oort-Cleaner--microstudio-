initUfos = function()
  ufos = []
  spawn = [-80, 80]
  ufoSound = 0
end

LilUFO = class
  constructor = function()
  sprite = "lilufo"
  x = 0
  y = 0
  rotation = 0
  rotation_speed = 1
  speed = 1
  vector = 0
  active = false
  delay = -1
  aim = 0
  laserTime = 1
  end
end

BigUFO = class
  constructor = function()
  sprite = "bigufo"
  x = 0
  y = 0
  rotation = 0
  rotation_speed = 0.7
  speed = 0.5
  vector = 0
  active = false
  delay = -1
  aim = 0
  laserTime = 1
  end
end

createLilUfo = function()
  ufo = new LilUFO
  ufo.x = spawn[round(random.next())]
  ufo.y = spawn[round(random.next())]
  ufo.vector = vectorSelector(ufo.x, ufo.y)
  ufo.active = true
  ufo.delay = 1
  ufos.push(ufo)
end

createBigUfo = function()
  ufo = new BigUFO
  ufo.x = spawn[round(random.next())]
  ufo.y = spawn[round(random.next())]
  ufo.vector = vectorSelector(ufo.x, ufo.y)
  ufo.active = true
  ufo.delay = 1
  ufos.push(ufo)
end

updateUfos = function()
  
//spawning rules for UFOS
  if score >= 20000 then
    stimer -= 1/60
    if score < 30000 then
      if stimer <= 0 then
      createBigUfo()
      ufoSound = audio.playSound("ufo1", 0.7, 1, 0, 1)
      stimer = 15
      end
    elsif score >= 30000 and score < 40000 then
      local choice = round(random.next())
      if stimer <= 0 then
        if choice == 0 then
          createBigUfo()
          ufoSound = audio.playSound("ufo1", 0.7, 1, 0, 1)
          stimer = 15
        elsif choice == 1 then
          createLilUfo()
          ufoSound = audio.playSound("ufo2", 0.7, 1, 0, 1)
          stimer = 15
        end
      end
    elsif score >= 40000 then
      if stimer <= 0 then
        createLilUfo()
        ufoSound = audio.playSound("ufo2", 0.7, 1, 0, 1)
        stimer = 15
      end
    end
  end
    
  if ufos.length == 0 then
    ufoSound.stop()
  end
  
  for ufo in ufos
    local index = ufos.indexOf(ufo)
    
    if ufo.active == true then
      //ufo travel
      ufo.x += ufo.vector[0]*ufo.speed
      ufo.y += ufo.vector[1]*ufo.speed
      ufo.rotation += ufo.rotation_speed
      ufo.aim = findAngle(ship.x, ship.y, ufo.x, ufo.y)
      print(ufo.aim)
      
      if ufo.x > 100 or ufo.x < -100 then
        ufoSound.stop()
        ufo.active = false
        ufos.remove(index)
      elsif ufo.y > 100 or ufo.y < -100 then
        ufoSound.stop()
        ufo.active = false
        ufos.remove(index)
      end
    
      //laser collision
      for laser in lasers
        local index2 = lasers.indexOf(laser)
        if laser.active == 1 and laser.enemy == false then
          if distance(ufo.x, ufo.y, laser.x, laser.y) < 14 and ufo.sprite == "bigufo" then
            audio.playSound("death")
            laser.active = 0
            ufo.active = false
            lasers.remove(index2)
            score += 1000
            ufoCounter += 1
          elsif distance(ufo.x, ufo.y, laser.x, laser.y) < 10 and ufo.sprite == "lilufo" then
            audio.playSound("death")
            laser.active = 0
            ufo.active = false
            lasers.remove(index2)
            score += 2500
            ufoCounter += 1
          end
        end
      end
      
      //fire's UFO laser at a set interval
      if ufo.laserTime > 0 then
        ufo.laserTime -= 1/60
      elsif ufo.laserTime <= 0 then
        fireEnemy()
        ufo.laserTime = 1
      end
      
    
    //timer to play death animation for ufos  
    elsif ufo.active == false then
      ufo.delay -= 1/60
      if ufo.delay <= 0 then
        ufos.remove(index)
      end
    end
  end
end

drawUfos = function()
  for ufo in ufos
    if ufo.active == true then
      screen.setDrawRotation(ufo.rotation)
      screen.drawSprite(ufo.sprite, ufo.x, ufo.y, 16, 16)
      screen.setDrawRotation(0)
      sprites["bigufo_death"].setFrame(0)
      sprites["lilufo_death"].setFrame(0)
    elsif ufo.active == false then
      if ufo.sprite == "lilufo" then
        screen.setDrawRotation(ufo.rotation)
        screen.drawSprite("lilufo_death", ufo.x, ufo.y, 16, 16)
        screen.setDrawRotation(0)
      elsif ufo.sprite == "bigufo" then
        screen.setDrawRotation(ufo.rotation)
        screen.drawSprite("bigufo_death", ufo.x, ufo.y, 16, 16)
        screen.setDrawRotation(0)
      end
    end
  end
end