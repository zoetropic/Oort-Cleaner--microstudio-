initLaser = function()
  lasers = []
end

Laser = class
  constructor = function()
  sprite = ["laser", "ufolaser"]
  x = 0
  y = 0
  speed = 5
  vector = 0
  active = 0
  timer = 0
  enemy = false
  end  
end

fireLaser = function()
  if ship.alive == true then
    if keyboard.press.SPACE then
      audio.playSound("pew")
      laser = new Laser()
      laser.sprite = "laser"
      laser.x = ship.x
      laser.y = ship.y
      laser.vector = angleToVector(ship.rotation)
      laser.active = 1
      lasers.push(laser)
    end
  end
end

fireEnemy = function()
  audio.playSound("pew")
  laser = new Laser()
  laser.sprite = "ufolaser"
  laser.x = ufo.x
  laser.y = ufo.y
  laser.vector = angleToVector(ufo.aim)
  laser.active = 1
  laser.enemy = true
  laser.speed = 2.5
  lasers.push(laser)
end


moveLaser = function()
    for laser in lasers
        laser.x += laser.vector[0] * laser.speed
        laser.y += laser.vector[1] * laser.speed
        wrap(laser)
      if laser.timer < 1 then
        laser.timer += 1/60
      elsif laser.timer >= 1 then
        laser.active = 0
        lasers.remove(lasers.indexOf(laser))
      end
    end
end

drawLaser = function()
  for laser in lasers
    if laser.active == 1 then
    screen.drawSprite(laser.sprite, laser.x, laser.y, 16, 16)
    end
  end
end
