initShip = function()
  ship = object
    x = 0
    y = 0
    rotation = 90
    speed = 0
    acceleration = 0.05
    top_speed = 2
    rotation_speed = 4
    vector = angleToVector(ship.rotation)
    velocity = [0, 0]
    alive = true
    delay = -1
    respawn = 1
  end
  warps = []
end

Warp = class
  constructor = function()
  x = 0
  y = 0
  active = false
  timer = -1
  end
end

  

updateShip = function()
  if ship.alive == true then
    
    if ship.respawn > 0 then
      ship.respawn -= 1/60
    end
    
    
    if keyboard.RIGHT then
      ship.rotation -= ship.rotation_speed
    end
  
    if keyboard.LEFT then
      ship.rotation += ship.rotation_speed
    end
  
    if keyboard.UP then
      ship.speed += ship.acceleration
      ship.vector = angleToVector(ship.rotation)
      ship.velocity[0] += ship.vector[0] * ship.acceleration
      ship.velocity[1] += ship.vector[1] * ship.acceleration
    end
    
    for warp in warps
      if warp.active == true then
        warp.timer += 1/60
        local index = warps.indexOf(warp)
        if warp.timer >= 0 then
          warp.active = false
          warps.remove(index)
        end
      end
    end
    
    for laser in lasers
      if laser.enemy == true and distance(laser.x, laser.y, ship.x, ship.y) <= 8 then
        shipDie()
      end
    end
    

    if keyboard.press.H then
      warp1 = new Warp()
      warp1.x = ship.x
      warp1.y = ship.y
      warp1.active = true
      warps.push(warp1)
      ship.x = randRange(-100,100)
      ship.y = randRange(-100,100)
      warp2 = new Warp()
      warp2.x = ship.x
      warp2.y = ship.y
      warp2.active = true
      warps.push(warp2)
    end
    
    ship.velocity[0] = clamp(ship.velocity[0], -2, ship.top_speed)
    ship.velocity[1] = clamp(ship.velocity[1], -2, ship.top_speed)
    ship.x += ship.velocity[0]
    ship.y += ship.velocity[1]
    wrap(ship, 0)
  elsif ship.alive == false then
    ship.delay -= 1/60
    if ship.delay <= 0 then
      initShip()
    end
  end
end

shipDie = function()
  audio.playSound("death")
  lives -= 1
  ship.alive = false
  ship.delay = 1
end

drawShip = function()
  if ship.alive == true then
    if ship.respawn > 0 then
      screen.setAlpha(getFlashValue(0.5))
      screen.setDrawRotation(ship.rotation)
      screen.drawSprite("ship", ship.x, ship.y, 16, 16)
      screen.setDrawRotation(0)
      
      if keyboard.UP then
        screen.setDrawRotation(ship.rotation)
        screen.drawSprite("thrust", ship.x, ship.y, 16, 16)
        screen.setDrawRotation(0)
        else sprites["thrust"].setFrame(0)
      end
      screen.setAlpha(1)
      sprites["death"].setFrame(0)
    
    elsif ship.respawn <= 0 then
      screen.setDrawRotation(ship.rotation)
      screen.drawSprite("ship", ship.x, ship.y, 16, 16)
      screen.setDrawRotation(0)
      sprites["death"].setFrame(0)
      
      if keyboard.UP then
        screen.setDrawRotation(ship.rotation)
        screen.drawSprite("thrust", ship.x, ship.y, 16, 16)
        screen.setDrawRotation(0)
      else sprites["thrust"].setFrame(0)
      end
    end
    
    for warp in warps
      if warp.active == true then
        screen.drawSprite("warp", warp.x, warp.y, 16, 16)
      end
    end
    
  elsif ship.alive == false then
    screen.setDrawRotation(ship.rotation)
    screen.drawSprite("death", ship.x, ship.y, 16, 16)
    screen.setDrawRotation(0)
  end
end