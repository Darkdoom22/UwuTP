local Distance_Helper = {}

function Distance_Helper.get()
  
  self = {}

  self.distance = function(id)
 
 if id ~= nil then
    
    local distance = 0
    local mob = windower.ffxi.get_mob_by_id(id)
    
    if mob ~= nil then
 
    distance = math.sqrt(mob.distance)
 
    return distance
    
    end
  
  end

  return 0
  
end

self.rotation = function(id)
  if id ~= nil then
    
    local rota = 0
  
     rota = windower.ffxi.get_mob_by_id(id).facing
     rot = math.deg(rota)
     
     return rot
     
  end
    
   return 0
   
 end
 
self.cardinal = function(rot)
   
   local cardinal = ""   
   if rot ~= nil then
     
    if rot >= 80 and rot <= 100 then
    
      cardinal = "S"
    
    end
    
    if rot <= 60 and rot >= 30 then
      
      cardinal = "SE"
    
    end
  
    if rot >= -10 and rot <= 10 then
      
      cardinal = "E"
      
    end
    
    if rot <= -30 and rot >= -60 then
      
      cardinal = "NE"
      
    end
    
    if rot <= -80 and rot >= -100 then
      
      cardinal = "N"
      
    end
    
    if rot <= - 120 and rot >= -160 then
      
      cardinal = "NW"
      
    end
    
    if rot >= 170 and rot >= -180 then
      
      cardinal = "W"
      
    end
    
    if rot >= 120 and rot <= 160 then
    
      cardinal = "SW"
    
    end
    
     return cardinal 
  
   end
   
   return 0
   
 end
 
 self.round = function(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

return self
 
end
return Distance_Helper.get()

 
   