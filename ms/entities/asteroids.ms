initAsteroids = function()
  asteroid_sprites = ["asteroid1", "asteroid2", "asteroid3", "asteroid4"]
  asteroids = []
  
    i = 0
    while i < (level + difficulty)
    Asteroid.createAsteroid()
    i = i+1
    end
    
end

Asteroid = class
  
  constructor = function()
  sprite = asteroid_sprites[0]
  x = randRange(-100, 100)
  y = randRange(-100, 100)
  vector = angleToVector(randRange(-360, 360))
  rotation = randRange(0, 360)
  speed = randRange(0.1, 0.5)
  rotation_speed = randRange(-1, 1)
  end

  createAsteroid = function()
    asteroid = new Asteroid()
    if asteroid.x <= 20 and asteroid.x >= -20 then
      asteroid.x = randRange(-100,100)
    end
    if asteroid.y <= 20 and asteroid.y >= -20 then
      asteroid.y = randRange(-100, 100)
    end
    asteroids.push(asteroid)
  end

/*Creates two new asteroid objects with properties sourced from the asteroid
  passed into the function, and then removes the index entry of the original asteroid */
  splitAsteroid = function(asteroid)
  audio.playSound("boom")
  local i = 0
  local index = asteroids.indexOf(asteroid)
  local a = asteroids[index]
  local s = asteroid_sprites.indexOf(a.sprite)
    if s < 3 then while i < 2
      asteroid = new Asteroid()
      asteroid.sprite = asteroid_sprites[s+1]
      asteroid.x = a.x + randRange(-10, 10)
      //had to add this block to fix split asteroids from being spawned out of bounds
      if asteroid.x >= 100 then
        asteroid.x = 90
      elsif asteroid.x <= -100 then
        asteroid.x = -90
      end
      asteroid.y = a.y + randRange(-10, 10)
      if asteroid.y >= 100 then
        asteroid.y = 90
      elsif asteroid.y <= -100 then
        asteroid.y = -90
      end
      asteroid.vector = angleToVector(randRange(-360, 360))
      asteroid.speed = a.speed * randRange(1, 1.5)
      asteroids.push(asteroid)
      i = i + 1
    end
    asteroids.remove(index)
    i = 0
    end
    if s == 3 then
      asteroids.remove(index)
      audio.playSound("bigboom", 0.5)
      i = 0
    end
  end
end

  

updateAsteroids = function()
    //asteroid movement
    for asteroid in asteroids
        //asteroid travel
        asteroid.x += asteroid.vector[0] * asteroid.speed
        asteroid.y += asteroid.vector[1] * asteroid.speed
        
        //asteroid rotation
        asteroid.rotation += asteroid.rotation_speed
        
        //asteroid boundary wrapping
        wrap(asteroid, 14)
      
      //laser collision and asteroid spliting
      for laser in lasers
        if asteroid.sprite == "asteroid1" then
          if distance(laser.x, laser.y, asteroid.x, asteroid.y) < 14
            and laser.active == 1 then
              laser.active = 0
              local index = lasers.indexOf(laser)
              lasers.remove(index)
              Asteroid.splitAsteroid(asteroid)
              
              /* prevents the player from getting points for asteroids split by
                 ufo lasers */
              if laser.enemy == false then
                score += 25
                asteroidCounter += 1
              end
            end
        
        elsif asteroid.sprite == "asteroid2" then
          if distance(laser.x, laser.y, asteroid.x, asteroid.y) < 12
            and laser.active == 1 then
              local index = lasers.indexOf(laser)
              laser.active = 0
              lasers.remove(index)
              Asteroid.splitAsteroid(asteroid)
              
              if laser.enemy == false then
                score += 50
                asteroidCounter += 1
              end
            end
        
        elsif asteroid.sprite == "asteroid3" then
          if distance(laser.x, laser.y, asteroid.x, asteroid.y) < 10
            and laser.active == 1 then
              local index = lasers.indexOf(laser)
              laser.active = 0
              lasers.remove(index)
              Asteroid.splitAsteroid(asteroid)
              
              if laser.enemy == false then
                score += 100
                asteroidCounter += 1
              end
            end
        
        elsif asteroid.sprite == "asteroid4" then
          if distance(laser.x, laser.y, asteroid.x, asteroid.y) < 8
            and laser.active == 1 then
              local index = lasers.indexOf(laser)
              laser.active = 0
              lasers.remove(index)
              Asteroid.splitAsteroid(asteroid)
              
              if laser.enemy == false then
                score += 150
                asteroidCounter += 1
              end
            end
          end
      end
      
    //ship and ufo collision logic
      if asteroid.sprite == "asteroid1" then
        if distance(ship.x, ship.y, asteroid.x, asteroid.y) < 14 and ship.alive then
          if ship.respawn <= 0 then
            shipDie()
          end
        elsif distance(ufo.x, ufo.y, asteroid.x, asteroid.y) < 14 and ufo.active then
          local index = ufos.indexOf(ufo)
          ufo.active = false
          ufoSound.stop()
          ufos.remove(index)
          Asteroid.splitAsteroid(asteroid)
        end
      end
  
      if asteroid.sprite == "asteroid2" then
        if distance(ship.x, ship.y, asteroid.x, asteroid.y) < 12 and ship.alive then
          if ship.respawn <= 0 then
            shipDie()
          end
        elsif distance(ufo.x, ufo.y, asteroid.x, asteroid.y) < 12 and ufo.active then
          local index = ufos.indexOf(ufo)
          ufo.active = false
          ufoSound.stop()
          ufos.remove(index)
          Asteroid.splitAsteroid(asteroid)
        end
      end
  
      if asteroid.sprite == "asteroid3" then
        if distance(ship.x, ship.y, asteroid.x, asteroid.y) < 10 and ship.alive then
          if ship.respawn <= 0 then
            shipDie()
          end
        elsif distance(ufo.x, ufo.y, asteroid.x, asteroid.y) < 10 and ufo.active then
          local index = ufos.indexOf(ufo)
          ufo.active = false
          ufoSound.stop()
          ufos.remove(index)
          Asteroid.splitAsteroid(asteroid)
        end
      end
  
      if asteroid.sprite == "asteroid4" then
        if distance(ship.x, ship.y, asteroid.x, asteroid.y) < 8 and ship.alive then
          if ship.respawn <= 0 then
            shipDie()
          end
        elsif distance(ufo.x, ufo.y, asteroid.x, asteroid.y) < 8 and ufo.active then
          local index = ufos.indexOf(ufo)
          ufo.active = false
          ufoSound.stop()
          ufos.remove(index)
          Asteroid.splitAsteroid(asteroid)
        end
      end
    end
  end

drawAsteroids = function()
  for asteroid in asteroids
  screen.setDrawRotation(asteroid.rotation)
  screen.drawSprite(asteroid.sprite, asteroid.x, asteroid.y, 32, 32)
  screen.setDrawRotation(0)
  end
end