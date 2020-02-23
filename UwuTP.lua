_addon.name = "EnemyInfo"
_addon.author = "Uwu/Darkdoom"
_addon.version = "1.0"


res			= require 'resources'
packets	= require 'packets'
files		= require 'files'
texts		= require 'texts'
          require 'strings'
          require 'actions'
          require 'tables'
          require 'sets'
          require 'chat'
          require 'pack'
          require 'logger'
config	= require('config')

-----------------------------------
defaults = {}
defaults.player = {}
defaults.player.pos = {}
defaults.player.stroke = {}
defaults.player.flags = {}
defaults.player.flags.bold = true
defaults.player.stroke.alpha = 200
defaults.player.stroke.width = 1
defaults.player.stroke.red = 0
defaults.player.stroke.blue = 0
defaults.player.stroke.green = 50
defaults.player.pos.x = 1259
defaults.player.pos.y = 403
defaults.player.text = {}
defaults.player.text.font = 'Segoe UI'
defaults.player.text.size = 11
defaults.player.text.alpha = 255
defaults.player.text.red = 119
defaults.player.text.green = 247
defaults.player.text.blue = 237
defaults.player.bg = {}
defaults.player.bg.alpha = 0
defaults.player.bg.red = 3
defaults.player.bg.green = 1
defaults.player.bg.blue = 1

defaults.p1 = {}
defaults.p1.pos = {}
defaults.p1.stroke = {}
defaults.p1.flags = {}
defaults.p1.flags.bold = true
defaults.p1.stroke.alpha = 200
defaults.p1.stroke.width = 1
defaults.p1.stroke.red = 0
defaults.p1.stroke.blue = 0
defaults.p1.stroke.green = 50
defaults.p1.pos.x = 1359
defaults.p1.pos.y = 403
defaults.p1.text = {}
defaults.p1.text.font = 'Segoe UI'
defaults.p1.text.size = 11
defaults.p1.text.alpha = 255
defaults.p1.text.red = 119
defaults.p1.text.green = 247
defaults.p1.text.blue = 237
defaults.p1.bg = {}
defaults.p1.bg.alpha = 0
defaults.p1.bg.red = 3
defaults.p1.bg.green = 1
defaults.p1.bg.blue = 1

defaults.p2 = {}
defaults.p2.pos = {}
defaults.p2.stroke = {}
defaults.p2.flags = {}
defaults.p2.flags.bold = true
defaults.p2.stroke.alpha = 200
defaults.p2.stroke.width = 1
defaults.p2.stroke.red = 0
defaults.p2.stroke.blue = 0
defaults.p2.stroke.green = 50
defaults.p2.pos.x = 1459
defaults.p2.pos.y = 403
defaults.p2.text = {}
defaults.p2.text.font = 'Segoe UI'
defaults.p2.text.size = 11
defaults.p2.text.alpha = 255
defaults.p2.text.red = 119
defaults.p2.text.green = 247
defaults.p2.text.blue = 237
defaults.p2.bg = {}
defaults.p2.bg.alpha = 0
defaults.p2.bg.red = 3
defaults.p2.bg.green = 1
defaults.p2.bg.blue = 1

defaults.p3 = {}
defaults.p3.pos = {}
defaults.p3.stroke = {}
defaults.p3.flags = {}
defaults.p3.flags.bold = true
defaults.p3.stroke.alpha = 200
defaults.p3.stroke.width = 1
defaults.p3.stroke.red = 0
defaults.p3.stroke.blue = 0
defaults.p3.stroke.green = 50
defaults.p3.pos.x = 1259
defaults.p3.pos.y = 503
defaults.p3.text = {}
defaults.p3.text.font = 'Segoe UI'
defaults.p3.text.size = 11
defaults.p3.text.alpha = 255
defaults.p3.text.red = 119
defaults.p3.text.green = 247
defaults.p3.text.blue = 237
defaults.p3.bg = {}
defaults.p3.bg.alpha = 0
defaults.p3.bg.red = 3
defaults.p3.bg.green = 1
defaults.p3.bg.blue = 1

defaults.p4 = {}
defaults.p4.pos = {}
defaults.p4.stroke = {}
defaults.p4.flags = {}
defaults.p4.flags.bold = true
defaults.p4.stroke.alpha = 200
defaults.p4.stroke.width = 1
defaults.p4.stroke.red = 0
defaults.p4.stroke.blue = 0
defaults.p4.stroke.green = 50
defaults.p4.pos.x = 1359
defaults.p4.pos.y = 503
defaults.p4.text = {}
defaults.p4.text.font = 'Segoe UI'
defaults.p4.text.size = 11
defaults.p4.text.alpha = 255
defaults.p4.text.red = 119
defaults.p4.text.green = 247
defaults.p4.text.blue = 237
defaults.p4.bg = {}
defaults.p4.bg.alpha = 0
defaults.p4.bg.red = 3
defaults.p4.bg.green = 1
defaults.p4.bg.blue = 1

defaults.p5 = {}
defaults.p5.pos = {}
defaults.p5.stroke = {}
defaults.p5.flags = {}
defaults.p5.flags.bold = true
defaults.p5.stroke.alpha = 200
defaults.p5.stroke.width = 1
defaults.p5.stroke.red = 0
defaults.p5.stroke.blue = 0
defaults.p5.stroke.green = 50
defaults.p5.pos.x = 1459
defaults.p5.pos.y = 503
defaults.p5.text = {}
defaults.p5.text.font = 'Segoe UI'
defaults.p5.text.size = 11
defaults.p5.text.alpha = 255
defaults.p5.text.red = 119
defaults.p5.text.green = 247
defaults.p5.text.blue = 237
defaults.p5.bg = {}
defaults.p5.bg.alpha = 0
defaults.p5.bg.red = 3
defaults.p5.bg.green = 1
defaults.p5.bg.blue = 1

defaults.enemy = {}
defaults.enemy.pos = {}
defaults.enemy.stroke = {}
defaults.enemy.flags = {}
defaults.enemy.flags.bold = true
defaults.enemy.stroke.alpha = 200
defaults.enemy.stroke.width = 1
defaults.enemy.stroke.red = 0
defaults.enemy.stroke.blue = 0
defaults.enemy.stroke.green = 50
defaults.enemy.pos.x = 850
defaults.enemy.pos.y = 219
defaults.enemy.text = {}
defaults.enemy.text.font = 'Segoe UI'
defaults.enemy.text.size = 13
defaults.enemy.text.alpha = 255
defaults.enemy.text.red = 20
defaults.enemy.text.green = 177
defaults.enemy.text.blue = 250
defaults.enemy.bg = {}
defaults.enemy.bg.alpha = 0
defaults.enemy.bg.red = 3
defaults.enemy.bg.green = 1
defaults.enemy.bg.blue = 1
settings = config.load('data\\settings.xml',defaults)



---------------------------------
text_box = texts.new(settings.player)
text_box2 = texts.new(settings.enemy)
text_box3 = texts.new(settings.p1)
text_box4 = texts.new(settings.p2)
text_box5 = texts.new(settings.p3)
text_box6 = texts.new(settings.p4)
text_box7 = texts.new(settings.p5)



function round(num, numDecimalPlaces)
  return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

function EnemyInfo()
  
  target = windower.ffxi.get_mob_by_target('t')
  
  if target ~= nil then
  
  target_hpp = target.hpp
  target_name = target.name
  
  end
  
end

function getinfo()
	
  local CurrentInfo = windower.ffxi.get_info()
	local CharacterInfo = windower.ffxi.get_player()
	
  if CurrentInfo.logged_in == true then
	
  in_combat = CharacterInfo.in_combat
  hpp = CharacterInfo.vitals.hpp
  mpp = CharacterInfo.vitals.mpp
  tp = CharacterInfo.vitals.tp
  status = CharacterInfo.status
  name = CharacterInfo.name
  
  local PartyInfo = windower.ffxi.get_party()
    
    if PartyInfo.p1 ~= nil then
    
    p1_tp = PartyInfo.p1.tp
    p1_hpp = PartyInfo.p1.hpp
    p1_mpp = PartyInfo.p1.mpp
    p1_name = PartyInfo.p1.name
    
    end
    
    if PartyInfo.p2 ~= nil then
    
    p2_tp = PartyInfo.p2.tp
    p2_name = PartyInfo.p2.name
    p2_hpp = PartyInfo.p2.hpp
    p2_mpp = PartyInfo.p2.mpp
    
    end
    
    if PartyInfo.p3 ~= nil then
    
    p3_tp = PartyInfo.p3.tp
    p3_name = PartyInfo.p3.name
    p3_hpp = PartyInfo.p3.hpp
    p3_mpp = PartyInfo.p3.mpp
  
    end
    
    if PartyInfo.p4 ~= nil then
    
    p4_tp = PartyInfo.p4.tp
    p4_name = PartyInfo.p4.name
    p4_hpp = PartyInfo.p4.hpp
    p4_mpp = PartyInfo.p4.mpp
  
    end
    
    if PartyInfo.p5 ~= nil then
    
    p5_tp = PartyInfo.p5.tp
    p5_name = PartyInfo.p5.name
    p5_hpp = PartyInfo.p5.hpp
    p5_mpp = PartyInfo.p5.mpp
    
    end 
    
    if PartyInfo.p0 ~= nil then
    
    p0_tp = PartyInfo.p0.tp
    p0_name = PartyInfo.p0.name
    p0_hpp = PartyInfo.p0.hpp
    p0_mpp = PartyInfo.p0.mpp
    
    end 
      
    elseif CurrentInfo.logged_in ~= true then
    
    end

end


function DisplayBox()
  
  local p1tp = p1_tp
   
  new_text = 
  name .. "\n"
  .. "[HP%] " .. hpp .. "\n"
  .. "[MP%] " .. mpp .. "\n"
  .. "[TP] " .. tp .. "\n"

    if p1_name ~= nil then    
    
    new_text3 = 
    p1_name .. "\n"
    .. "[HP%] " .. p1_hpp .. "\n"
    .. "[MP%] " .. p1_mpp .. "\n"
    .. "[TP] " .. p1_tp .. "\n"
    
    text_box3:text(new_text3)
    text_box3:visible(true)
    
    end
    
    if p2_name ~= nil then
    
    new_text4 = 
    p2_name .. "\n"
    .. "[HP%] " .. p2_hpp .. "\n"
    .. "[MP%] " .. p2_mpp .. "\n"
    .. "[TP] " .. p2_tp .. "\n"
    
    text_box4:text(new_text4)
    text_box4:visible(true)
  
    end  
  
    if p3_name ~= nil then
     
    new_text5 = 
    p3_name .. "\n"
    .. "[HP%] " .. p3_hpp .. "\n"
    .. "[MP%] " .. p3_mpp .. "\n"
    .. "[TP] " .. p3_tp .. "\n"
    
    text_box5:text(new_text5)
    text_box5:visible(true)
 
    end  
  
    if p4_name ~= nil then
     
    new_text6 = 
    p4_name .. "\n"
    .. "[HP%] " .. p4_hpp .. "\n"
    .. "[MP%] " .. p4_mpp .. "\n"
    .. "[TP] " .. p4_tp .. "\n"
    
    text_box6:text(new_text6)
    text_box6:visible(true)
    
    end  
  
    if p5_name ~= nil then
     
    new_text7 = 
    p5_name .. "\n"
    .. "[HP%] " .. p5_hpp .. "\n"
    .. "[MP%] " .. p5_mpp .. "\n"
    .. "[TP] " .. p5_tp .. "\n"
    
    text_box7:text(new_text7)
    text_box7:visible(true)
  
    end  
  
    if hpp < 33 then
  
    text_box:color(244, 40, 40)
  
    elseif tp > 1000 then
    
    text_box:color(177, 75, 251)
    
    elseif tp < 1000 then
    
    text_box:color(119, 247, 237)
    
    elseif mpp < 20 then
    
    text_box:color(235, 158, 25)
    
    end  
    

    if p1_hpp < 33 then
    
    text_box3:color(244, 40, 40)
    
    elseif p1_tp > 1000 then
    
    text_box3:color(177, 75, 251)
    
    elseif p1_tp < 1000 and p1_mpp > 20 then
    
    text_box3:color(119, 247, 237)
    
    elseif p1_mpp < 20 and p1_tp < 1000 then
    
    text_box3:color(235, 158, 25)
    
    end  
    
    if p2_hpp < 33 then
    
    text_box4:color(244, 40, 40)
    
    elseif p2_tp > 1000 then
    
    text_box4:color(177, 75, 251)
    
    elseif p2_tp < 1000 and p2_mpp > 20 then
    
    text_box4:color(119, 247, 237)
    
    elseif p2_mpp < 20 and p2_tp < 1000 then
    
    text_box4:color(235, 158, 25)
    
    end  
    
    if p3_hpp < 33 then
    
    text_box5:color(244, 40, 40)
    
    elseif p3_tp > 1000 then
    
    text_box5:color(177, 75, 251)
    
    elseif p3_tp < 1000 and p3_mpp > 20 then
    
    text_box5:color(119, 247, 237)
    
    elseif p3_mpp < 20 and p3_tp < 1000 then
    
    text_box5:color(235, 158, 25)
    
    end
    
    if p4_hpp < 33 then
    
    text_box6:color(244, 40, 40)
    
    elseif p4_tp > 1000 then
    
    text_box6:color(177, 75, 251)
    
    elseif p4_tp < 1000 and p4_mpp > 20 then
    
    text_box6:color(119, 247, 237)
    
    elseif p4_mpp < 20 and p4_tp < 1000 then
    
    text_box6:color(235, 158, 25)
    
    end
    
    if p5_hpp < 33 then
    
    text_box7:color(244, 40, 40)
    
    elseif p5_tp > 1000 then
    
    text_box7:color(177, 75, 251)
    
    elseif p5_tp < 1000 and p5_mpp > 20 then
    
    text_box7:color(119, 247, 237)
    
    elseif p5_mpp < 20 and p5_tp < 1000 then
    
    text_box7:color(235, 158, 25)
    
    end
    

    text_box:text(new_text)
    text_box:visible(true)
    
    if target ~= nil then
    
    local target_distance = math.sqrt(target.distance)
    
    new_text2 = 
    (tostring(target_name)) .. "\n"
    .. "[HP%] " .. target_hpp .. "\n"
    .. "[Distance] " .. round(target_distance, 1) .. "\n"
    
    text_box2:text(new_text2)
    text_box2:visible(true)
    
      if target_hpp > 66 then
      text_box2:color(79, 246, 202)
    
      elseif target_hpp > 34 and target_hpp < 65 then
      text_box2:color(244, 149, 40)
    
      elseif target_hpp < 33 then
      text_box2:color(244, 40, 40)
    
      end
    
      elseif target == nil then
      
      text_box2:visible(false) 
    
      end
  
end
  

    


windower.register_event('prerender', function()
    getinfo()
    EnemyInfo()
    DisplayBox()
    end)
