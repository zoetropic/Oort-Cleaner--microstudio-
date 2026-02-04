/* takes an angle in degrees and returns a vector in the form of a list [x, y].
The elements [x, y] of this direction vector can then be multiplied by a 
certain speed (in pixels per frame) to move an entity on the screen */
angleToVector = function(angle)
  return [cosd(angle), sind(angle)]
end

/* keep a value within a set range, useful for keeping a player on the screen etc.
NOTE: returns the new value, does not automatically change it */
clamp = function(value, lower_limit, upper_limit)
  local val = max(value, lower_limit)
  val = min(val, upper_limit)
  return val
end

//finds the angle between two points (and converst to degrees), used to aim and point vectors
findAngle = function(x1, y1, x2, y2)
  local a = x2 - x1
  local b = y2 - y1
  local c = atan2(b, a)
  d = (c * 57.2958) + 180
  return d
end

// find the distance between object 1 and object 2
distance = function(x1, y1, x2, y2)
  local a = x2 - x1
  local b = y2 - y1
  local c = sqrt(pow(a, 2) + pow(b, 2))
  return c
end

// returns a number that moves smoothly between .4 and 1
// very useful for flashing text if used to set the alpha each frame
getFlashValue = function(seconds_per_flash = 1.5)
  return pow(cos(system.time()/1000*PI/seconds_per_flash), 2) * 0.6 + .4
end

// returns a random number (float/with decimals) within the range [low, high]
randRange = function(low, high)
  return (high - low) * random.next() + low
end

vectorSelector = function(x, y)
  local sum = x + y
  if sum == 160 then
    return angleToVector(randRange(180, 270))
  elsif sum == 0 then
    if x == -80 then
      return angleToVector(randRange(270, 360))
    elsif y == -80 then
      return angleToVector(randRange(90, 180))
    end
  elsif sum == -160 then
    return angleToVector(randRange(0, 90))
  end
end


// makes the object wrap around the screen when moving off the edge
// note: object must have x and y fields (variables)
wrap = function(obj, leeway = 0)
  if obj.x + leeway < -screen.width/2 then
    obj.x = screen.width/2 + leeway
  elsif obj.x - leeway > screen.width/2 then
    obj.x = -screen.width/2 - leeway
  end 
  if obj.y + leeway < -screen.height/2 then
    obj.y = screen.height/2 + leeway
  elsif obj.y - leeway > screen.height/2 then
    obj.y = -screen.height/2 - leeway
  end 
end