Entity = {}

function Entity:new(id, y, x)
  local o = {}
  setmetatable(o, self)
  self.__index = self

  o.id = id
  assert (o.id ~= nil)
  o.x = x
  o.y = y
  o.falling = true
  o.vy = -6
  o.remove = false
  o.angle1 = rand:num() * 2 * math.pi
  o.angle2 = rand:num() * 2 * math.pi
  o.createTime = love.timer.getTime()
  
  return o
end

function Entity:draw(view)
    love.graphics.draw(images[self.id][1],
                       (self.x - view.x)*view.zoom + love.graphics.getWidth()/2,
                       (self.y - view.y - 0.5 + 0.2 * math.sin(2 * love.timer.getMicroTime() + self.angle1)) * view.zoom + love.graphics.getHeight()/2,
                       4 * love.timer.getMicroTime() + self.angle2,
                       view.zoom/32, view.zoom/32, view.zoom/4, view.zoom/4)
end
