_addon.name = "UwuTP"
_addon.author = "Uwu/Darkdoom"
_addon.version = "1.2"


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

Enmity = "None"
action = "None"

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

defaults.playermove = {}
defaults.playermove.pos = {}
defaults.playermove.stroke = {}
defaults.playermove.flags = {}
defaults.playermove.flags.bold = true
defaults.playermove.stroke.alpha = 200
defaults.playermove.stroke.width = 1
defaults.playermove.stroke.red = 0
defaults.playermove.stroke.blue = 0
defaults.playermove.stroke.green = 50
defaults.playermove.pos.x = 1259
defaults.playermove.pos.y = 480
defaults.playermove.text = {}
defaults.playermove.text.font = 'Segoe UI'
defaults.playermove.text.size = 11
defaults.playermove.text.alpha = 255
defaults.playermove.text.red = 119
defaults.playermove.text.green = 247
defaults.playermove.text.blue = 237
defaults.playermove.bg = {}
defaults.playermove.bg.alpha = 0
defaults.playermove.bg.red = 3
defaults.playermove.bg.green = 1
defaults.playermove.bg.blue = 1

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
defaults.p1.pos.x = 1409
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

defaults.p1move = {}
defaults.p1move.pos = {}
defaults.p1move.stroke = {}
defaults.p1move.flags = {}
defaults.p1move.flags.bold = true
defaults.p1move.stroke.alpha = 200
defaults.p1move.stroke.width = 1
defaults.p1move.stroke.red = 0
defaults.p1move.stroke.blue = 0
defaults.p1move.stroke.green = 50
defaults.p1move.pos.x = 1409
defaults.p1move.pos.y = 480
defaults.p1move.text = {}
defaults.p1move.text.font = 'Segoe UI'
defaults.p1move.text.size = 11
defaults.p1move.text.alpha = 255
defaults.p1move.text.red = 119
defaults.p1move.text.green = 247
defaults.p1move.text.blue = 237
defaults.p1move.bg = {}
defaults.p1move.bg.alpha = 0
defaults.p1move.bg.red = 3
defaults.p1move.bg.green = 1
defaults.p1move.bg.blue = 1

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
defaults.p2.pos.x = 1559
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

defaults.p2move = {}
defaults.p2move.pos = {}
defaults.p2move.stroke = {}
defaults.p2move.flags = {}
defaults.p2move.flags.bold = true
defaults.p2move.stroke.alpha = 200
defaults.p2move.stroke.width = 1
defaults.p2move.stroke.red = 0
defaults.p2move.stroke.blue = 0
defaults.p2move.stroke.green = 50
defaults.p2move.pos.x = 1559
defaults.p2move.pos.y = 480
defaults.p2move.text = {}
defaults.p2move.text.font = 'Segoe UI'
defaults.p2move.text.size = 11
defaults.p2move.text.alpha = 255
defaults.p2move.text.red = 119
defaults.p2move.text.green = 247
defaults.p2move.text.blue = 237
defaults.p2move.bg = {}
defaults.p2move.bg.alpha = 0
defaults.p2move.bg.red = 3
defaults.p2move.bg.green = 1
defaults.p2move.bg.blue = 1

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

defaults.p3move = {}
defaults.p3move.pos = {}
defaults.p3move.stroke = {}
defaults.p3move.flags = {}
defaults.p3move.flags.bold = true
defaults.p3move.stroke.alpha = 200
defaults.p3move.stroke.width = 1
defaults.p3move.stroke.red = 0
defaults.p3move.stroke.blue = 0
defaults.p3move.stroke.green = 50
defaults.p3move.pos.x = 1259
defaults.p3move.pos.y = 580
defaults.p3move.text = {}
defaults.p3move.text.font = 'Segoe UI'
defaults.p3move.text.size = 11
defaults.p3move.text.alpha = 255
defaults.p3move.text.red = 119
defaults.p3move.text.green = 247
defaults.p3move.text.blue = 237
defaults.p3move.bg = {}
defaults.p3move.bg.alpha = 0
defaults.p3move.bg.red = 3
defaults.p3move.bg.green = 1
defaults.p3move.bg.blue = 1

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
defaults.p4.pos.x = 1409
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

defaults.p4move = {}
defaults.p4move.pos = {}
defaults.p4move.stroke = {}
defaults.p4move.flags = {}
defaults.p4move.flags.bold = true
defaults.p4move.stroke.alpha = 200
defaults.p4move.stroke.width = 1
defaults.p4move.stroke.red = 0
defaults.p4move.stroke.blue = 0
defaults.p4move.stroke.green = 50
defaults.p4move.pos.x = 1409
defaults.p4move.pos.y = 580
defaults.p4move.text = {}
defaults.p4move.text.font = 'Segoe UI'
defaults.p4move.text.size = 11
defaults.p4move.text.alpha = 255
defaults.p4move.text.red = 119
defaults.p4move.text.green = 247
defaults.p4move.text.blue = 237
defaults.p4move.bg = {}
defaults.p4move.bg.alpha = 0
defaults.p4move.bg.red = 3
defaults.p4move.bg.green = 1
defaults.p4move.bg.blue = 1

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
defaults.p5.pos.x = 1559
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

defaults.p5move = {}
defaults.p5move.pos = {}
defaults.p5move.stroke = {}
defaults.p5move.flags = {}
defaults.p5move.flags.bold = true
defaults.p5move.stroke.alpha = 200
defaults.p5move.stroke.width = 1
defaults.p5move.stroke.red = 0
defaults.p5move.stroke.blue = 0
defaults.p5move.stroke.green = 50
defaults.p5move.pos.x = 1559
defaults.p5move.pos.y = 580
defaults.p5move.text = {}
defaults.p5move.text.font = 'Segoe UI'
defaults.p5move.text.size = 11
defaults.p5move.text.alpha = 255
defaults.p5move.text.red = 119
defaults.p5move.text.green = 247
defaults.p5move.text.blue = 237
defaults.p5move.bg = {}
defaults.p5move.bg.alpha = 0
defaults.p5move.bg.red = 3
defaults.p5move.bg.green = 1
defaults.p5move.bg.blue = 1


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

defaults.enemymove = {}
defaults.enemymove.pos = {}
defaults.enemymove.stroke = {}
defaults.enemymove.flags = {}
defaults.enemymove.flags.bold = true
defaults.enemymove.stroke.alpha = 200
defaults.enemymove.stroke.width = 1
defaults.enemymove.stroke.red = 0
defaults.enemymove.stroke.blue = 0
defaults.enemymove.stroke.green = 50
defaults.enemymove.pos.x = 850
defaults.enemymove.pos.y = 313
defaults.enemymove.text = {}
defaults.enemymove.text.font = 'Segoe UI'
defaults.enemymove.text.size = 14
defaults.enemymove.text.alpha = 255
defaults.enemymove.text.red = 20
defaults.enemymove.text.green = 177
defaults.enemymove.text.blue = 250
defaults.enemymove.bg = {}
defaults.enemymove.bg.alpha = 0
defaults.enemymove.bg.red = 3
defaults.enemymove.bg.green = 1
defaults.enemymove.bg.blue = 1


settings = config.load('data\\settings.xml',defaults)



---------------------------------
text_box = texts.new(settings.player)
text_box2 = texts.new(settings.enemy)
text_box3 = texts.new(settings.p1)
text_box4 = texts.new(settings.p2)
text_box5 = texts.new(settings.p3)
text_box6 = texts.new(settings.p4)
text_box7 = texts.new(settings.p5)
text_box8 = texts.new(settings.enemymove)
text_box9 = texts.new(settings.playermove)
text_box10 = texts.new(settings.p1move)
text_box11 = texts.new(settings.p2move)
text_box12 = texts.new(settings.p3move)
text_box13 = texts.new(settings.p4move)
text_box14 = texts.new(settings.p5move)


windower.register_event("incoming chunk", function(id, original, modified, injected, blocked)
    
    if id == 0x028 then
    
    local p = packets.parse("incoming", original)
    local actor = windower.ffxi.get_mob_by_id(p["Actor"])
    local EnemyTarget = windower.ffxi.get_mob_by_id(p["Target 1 ID"])
    local category = p["Category"]
    local param = p["Param"]
    local p_param = p["Target 1 Action 1 Param"]
    
    
          if actor.id == char_id then
          
            if category == 8 then
          
            player_spell = res.spells[p_param].en
          
            new_text10 = "[MA] " .. player_spell .. "\n"
            text_box9:text(new_text10)
            text_box9:color(78, 255, 108)
            text_box9:visible(true)
  
            elseif category == 4 then
            
            text_box9:visible(false)
      
            elseif category == 7 then
            
            player_ws = res.weapon_skills[p_param].en
            new_text11 = "[WS] " .. player_ws .. "\n"
            text_box9:text(new_text11)
            text_box9:color(229, 119, 255)
            text_box9:visible(true)
            
            elseif category == 3 then
            
             text_box9:visible(false)
          
          
            end
          
          end
        
        if actor.name == p1_name then
         
          if category == 8 then
        
          p1_spell = res.spells[p_param].en
          new_text12 = "[MA] " .. p1_spell .. "\n"
          text_box10:text(new_text12)
          text_box10:color(78, 255, 108)
          text_box10:visible(true)
          
          elseif category == 4 then
          
          text_box10:visible(false)
    
          elseif category == 7 and res.weapon_skills[p_param] <= 255 then
          
          p1_ws = res.weapon_skills[p_param].en
          new_text13 = "[WS] " .. p1_ws .. "\n"
          text_box10:text(new_text13)
          text_box10:color(229, 119, 255)
          text_box10:visible(true)
          
          elseif category == 7 and res.weapon_skills[p_param] > 255 then
          
          p1t_ws = res.monster_abilities[p_param].en
          new_text13 = "[WS] " .. p1t_ws .. "\n"
          text_box10:text(new_text13)
          text_box10:color(229, 119, 255)
          text_box10:visible(true)
          
          elseif category == 3 then
          
           text_box10:visible(false)
          
          
          end
          
        end
        
        if actor.name == p2_name then
         
          if category == 8 then
        
          p2_spell = res.spells[p_param].en
          new_text12 = "[MA] " .. p2_spell .. "\n"
          text_box11:text(new_text12)
          text_box11:color(78, 255, 108)
          text_box11:visible(true)
          
          elseif category == 4 then
          
          text_box11:visible(false)
    
          elseif category == 7 and p_param <= 255 then
          
          p2_ws = res.weapon_skills[p_param].en
          new_text13 = "[WS] " .. p2_ws .. "\n"
          text_box11:text(new_text13)
          text_box11:color(229, 119, 255)
          text_box11:visible(true)
   
          
          elseif category == 7 and p_param > 255 then
          
          p2t_ws = res.monster_abilities[p_param].en
          new_text14 = "[WS] " .. p2t_ws .. "\n"
          text_box11:text(new_text14)
          text_box11:color(229, 119, 255)
          text_box11:visible(true)
       
          elseif category == 3 then
          
           text_box11:visible(false)
          
          
          end
          
        end
        
          if actor.name == p3_name then
         
          if category == 8 then
        
          p3_spell = res.spells[p_param].en
          new_text15 = "[MA] " .. p3_spell .. "\n"
          text_box12:text(new_text15)
          text_box12:color(78, 255, 108)
          text_box12:visible(true)
          
          elseif category == 4 then
          
          text_box12:visible(false)
    
          elseif category == 7 and p_param <= 255 then
          
          p3_ws = res.weapon_skills[p_param].en
          new_text16 = "[WS] " .. p3_ws .. "\n"
          text_box12:text(new_text16)
          text_box12:color(229, 119, 255)
          text_box12:visible(true)
          
          elseif category == 7 and p_param > 255 then
          
          p3_ws = res.monster_abilities[p_param].en
          new_text17 = "[WS] " .. p3_ws .. "\n"
          text_box12:text(new_text17)
          text_box12:color(229, 119, 255)
          text_box12:visible(true) 
          
          
          elseif category == 3 then
          
           text_box12:visible(false)
          
          
          end
          
        end
        
          if actor.name == p4_name then
         
          if category == 8 then
        
          p4_spell = res.spells[p_param].en
          new_text18 = "[MA] " .. p4_spell .. "\n"
          text_box13:text(new_text18)
          text_box13:color(78, 255, 108)
          text_box13:visible(true)
          
          elseif category == 4 then
          
          text_box13:visible(false)
    
          elseif category == 7 and p_param <= 255 then
          
          p4_ws = res.weapon_skills[p_param].en
          new_text19 = "[WS] " .. p4_ws .. "\n"
          text_box13:text(new_text19)
          text_box13:color(229, 119, 255)
          text_box13:visible(true)
          
          elseif category == 7 and p_param > 255 then
            
          p4_ws = res.monster_abilities[p_param].en
          new_text20 = "[WS] " .. p4_ws .. "\n"
          text_box13:text(new_text20)
          text_box13:color(229, 119, 255)
          text_box13:visible(true)          
          
          elseif category == 3 then
          
           text_box13:visible(false)
          
          
          end
          
        end
        
          if actor.name == p5_name then
         
          if category == 8 then
        
          p5_spell = res.spells[p_param].en
          new_text21 = "[MA] " .. p5_spell .. "\n"
          text_box14:text(new_text21)
          text_box14:color(78, 255, 108)
          text_box14:visible(true)
          
          elseif category == 4 then
          
          text_box14:visible(false)
    
          elseif category == 7 and p_param <= 255 then
          
          p5_ws = res.weapon_skills[p_param].en
          new_text22 = "[WS] " .. p5_ws .. "\n"
          text_box14:text(new_text22)
          text_box14:color(229, 119, 255)
          text_box14:visible(true)
          
          elseif category == 7 and p_param > 255 then
          
          p5_ws = res.monster_abilities[p_param].en
          new_text23 = "[WS] " .. p5_ws .. "\n"
          text_box14:text(new_text23)
          text_box14:color(229, 119, 255)
          text_box14:visible(true)
          
          
          elseif category == 3 then
          
           text_box14:visible(false)
          
          
          end
          
          end
    
    
    if target ~= nil then
    
      if actor.id == target.id then
        
      Enmity = EnemyTarget.name
      
        if category == 1 then
        
        action = "Melee"
        lastaction = action
        text_box8:visible(false)
        
        elseif category == 2 then
        
        action = "Ranged"
        lastaction = action
        
        --casting start
        elseif category == 8 then
      
        action = "Casting Spell"
        lastaction = action
        current_spell = res.spells[p_param].en
        new_text9 = "[Using] " .. current_spell .. "\n"
        text_box8:text(new_text9)
        text_box8:visible(true)
        
        elseif category == 4 then
        
        casting = "Finished"
        text_box8:visible(false)
        
        elseif category == 11 then
        
        action = "TP Move"
        lastaction = action
        current_move = res.monster_abilities[param].en

        new_text8 =  "[Using] " .. current_move .. "\n"
        text_box8:text(new_text8)
        text_box8:visible(true)
        end
    
      end
  end
 end
end)

windower.register_event("incoming chunk", function(id, data, modified, injected, blocked)
    
    if id == 0x02D then
    
    Enmity = "None"
    action = "None"
    text_box8:visible(false)
    
  end
  
end)  

windower.register_event('zone change', function()
    
    Enmity = "None"
    
    end)

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
  zone = CurrentInfo.zone
  char_id = CharacterInfo.id
  
  local PartyInfo = windower.ffxi.get_party()
    
    if PartyInfo.p1 ~= nil then
    
    p1_tp = PartyInfo.p1.tp
    p1_hpp = PartyInfo.p1.hpp
    p1_mpp = PartyInfo.p1.mpp
    p1_name = PartyInfo.p1.name
    p1_zone = PartyInfo.p1.zone
    p1_id = PartyInfo.p1.id
    
    end
    
    if PartyInfo.p2 ~= nil then
    
    p2_tp = PartyInfo.p2.tp
    p2_name = PartyInfo.p2.name
    p2_hpp = PartyInfo.p2.hpp
    p2_mpp = PartyInfo.p2.mpp
    p2_zone = PartyInfo.p2.zone
    p2_id = PartyInfo.p2.id
    
    end
    
    if PartyInfo.p3 ~= nil then
    
    p3_tp = PartyInfo.p3.tp
    p3_name = PartyInfo.p3.name
    p3_hpp = PartyInfo.p3.hpp
    p3_mpp = PartyInfo.p3.mpp
    p3_zone = PartyInfo.p3.zone
    p3_id = PartyInfo.p3.id
    
    end
    
    if PartyInfo.p4 ~= nil then
    
    p4_tp = PartyInfo.p4.tp
    p4_name = PartyInfo.p4.name
    p4_hpp = PartyInfo.p4.hpp
    p4_mpp = PartyInfo.p4.mpp
    p4_zone = PartyInfo.p4.zone
    p4_id = PartyInfo.p4.id
    
    end
    
    if PartyInfo.p5 ~= nil then
    
    p5_tp = PartyInfo.p5.tp
    p5_name = PartyInfo.p5.name
    p5_hpp = PartyInfo.p5.hpp
    p5_mpp = PartyInfo.p5.mpp
    p5_zone = PartyInfo.p5.zone
    p5_id = PartyInfo.p5.id
    
    end 
    
    if PartyInfo.p0 ~= nil then
    
    p0_tp = PartyInfo.p0.tp
    p0_name = PartyInfo.p0.name
    p0_hpp = PartyInfo.p0.hpp
    p0_mpp = PartyInfo.p0.mpp
    p0_zone = PartyInfo.p0.zone
    
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
    
    if p1_zone ~= zone then
    
    text_box3:visible(false)
    
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
    
    if p2_zone ~= zone then
  
    text_box4:visible(false)
  
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
    
    if p3_zone ~= zone then
    
    text_box5:visible(false)
    
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
    
    if p4_zone ~= zone then
    
    text_box6:visible(false)
    
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
  
    if p5_zone ~= zone then
    
    text_box7:visible(false)
    
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
    
    if p1_hpp ~= nil then

      if p1_hpp < 33 and p1_hpp ~= nil then
    
      text_box3:color(244, 40, 40)
    
      elseif p1_tp > 1000 then
    
      text_box3:color(177, 75, 251)
    
      elseif p1_tp < 1000 and p1_mpp > 20 then
    
      text_box3:color(119, 247, 237)
    
      elseif p1_mpp < 20 and p1_tp < 1000 then
    
      text_box3:color(235, 158, 25)
    
      end  
    
    end
    
    if p2_hpp ~= nil then
      
      if p2_hpp < 33 then
    
      text_box4:color(244, 40, 40)
    
      elseif p2_tp > 1000 then
    
      text_box4:color(177, 75, 251)
    
      elseif p2_tp < 1000 and p2_mpp > 20 then
    
      text_box4:color(119, 247, 237)
    
      elseif p2_mpp < 20 and p2_tp < 1000 then
    
      text_box4:color(235, 158, 25)
    
      end  
    
    end
    
    if p3_hpp ~= nil then
      
      if p3_hpp < 33 then
    
      text_box5:color(244, 40, 40)
    
      elseif p3_tp > 1000 then
    
      text_box5:color(177, 75, 251)
    
      elseif p3_tp < 1000 and p3_mpp > 20 then
    
      text_box5:color(119, 247, 237)
    
      elseif p3_mpp < 20 and p3_tp < 1000 then
    
      text_box5:color(235, 158, 25)
    
      end
   
   end 
   
   if p4_hpp ~= nil then
   
    if p4_hpp < 33 then
    
    text_box6:color(244, 40, 40)
    
    elseif p4_tp > 1000 then
    
    text_box6:color(177, 75, 251)
    
    elseif p4_tp < 1000 and p4_mpp > 20 then
    
    text_box6:color(119, 247, 237)
    
    elseif p4_mpp < 20 and p4_tp < 1000 then
    
    text_box6:color(235, 158, 25)
    
  end
  
  end
    
    if p5_hpp ~= nil then
      
    if p5_hpp < 33 then
    
    text_box7:color(244, 40, 40)
    
    elseif p5_tp > 1000 then
    
    text_box7:color(177, 75, 251)
    
    elseif p5_tp < 1000 and p5_mpp > 20 then
    
    text_box7:color(119, 247, 237)
    
    elseif p5_mpp < 20 and p5_tp < 1000 then
    
    text_box7:color(235, 158, 25)
    
    end
   end 

    text_box:text(new_text)
    text_box:visible(true)
    
    if target ~= nil then
    
    local target_distance = math.sqrt(target.distance)
    
    new_text2 = 
    (tostring(target_name)) .. "\n"
    .. "[HP%] " .. target_hpp .. "\n"
    .. "[Distance] " .. round(target_distance, 1) .. "\n"
    .. "[Enmity] " .. Enmity .. "\n"

    
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
