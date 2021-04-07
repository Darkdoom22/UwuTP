--[[ Copyright © 2020, Darkdoom
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of UwuTP nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Darkdoom BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. ]]--


_addon.name = "UwuTP"
_addon.author = "Uwu/Darkdoom"
_addon.version = "1.9.0"


local res	= require 'resources'
local packets	= require 'packets'
local files	= require 'files'
local texts	= require 'texts'
          	  require 'strings'
          	  require 'actions'
          	  require 'tables'
config	= 	  require('config')
require("default_settings")
Distance_Helper = require("Distance_Helper")

local res_mobabi_safe = setmetatable(res.monster_abilities, {__index = function(t, k)
  return {name = "AoE Melee"}
end})

Move_List = {}
Enmity = "None"
action = "None"
S0 = os.clock()
S1 = os.clock()
S2 = os.clock()
S3 = os.clock()
S4 = os.clock()
S5 = os.clock()
E0 = os.clock()

settings = (defaults)

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
text_box15 = texts.new(settings.movelist)
text_box16 = texts.new(settings.p1dist)
text_box17 = texts.new(settings.p2dist)
text_box18 = texts.new(settings.p3dist)
text_box19 = texts.new(settings.p4dist)
text_box20 = texts.new(settings.p5dist)


    

windower.register_event('load', function()
    if windower.get_windower_settings().x_res < 1920 then
      text_box:pos(734, 300) -- Player 0
      text_box2:pos(471, 176) --Enemy
      text_box15:pos(271, 176) --Movelist
      text_box8:pos(471, 270) --Enemy Move
      text_box9:pos(734, 377) --Player 0 Move
      text_box3:pos(884, 300) --Player 1
      text_box4:pos(734, 400) --Player 2
      text_box5:pos(884, 400) --Player 3
      text_box6:pos(734, 500) --Player 4
      text_box7:pos(884, 500) --Player 5
      text_box10:pos(884, 377) --Player 1 move
      text_box11:pos(734, 477) --Player 2 move
      text_box12:pos(884, 477) --Player 3 move
      text_box13:pos(734, 577) --Player 4 move
      text_box14:pos(884, 577) --Player 5 move
      text_box16:pos(974, 339) --Player 1 distance 
      text_box17:pos(814, 439) --Player 2 distance
      text_box18:pos(974, 439) --Player 3 distance
      text_box19:pos(814, 539) --Player 4 distance
      text_box20:pos(974, 539) --Player 5 distance
      text_box16:update()
      text_box17:update()
      text_box18:update()
      text_box19:update()
      text_box20:update()
      text_box3:update()
      text_box10:update()
      text_box11:update()
      text_box12:update()
      text_box13:update()
      text_box14:update()
      text_box4:update()
      text_box5:update()
      text_box8:update()
      text_box9:update()
      text_box2:update()
      text_box:update()
    end
  end)


windower.register_event("incoming chunk", function(id, original, modified, injected, blocked)
    
    if id == 0x028 then
    
    local p = packets.parse("incoming", original)
    local actor = windower.ffxi.get_mob_by_id(p["Actor"]) or {id=0}
    local EnemyTarget = windower.ffxi.get_mob_by_id(p["Target 1 ID"])
    local category = p["Category"]
    local param = p["Param"]
    local p_param = p["Target 1 Action 1 Param"]
    
          if actor.id == char_id and actor ~= nil then
          
            if category == 8 then
          
            player_spell = res.spells[p_param].name
          
            new_text10 = "[MA] " .. player_spell .. "\n"
            text_box9:text(new_text10)
            text_box9:color(78, 255, 108)
            text_box9:visible(true)
            
            elseif category == 4 then
            
            S0 = os.clock()
            text_box9:visible(false)
      
            elseif category == 7 then
            
            player_ws = res.weapon_skills[p_param].name
            new_text11 = "[WS] " .. player_ws .. "\n"
            text_box9:text(new_text11)
            text_box9:color(229, 119, 255)
            text_box9:visible(true)
            
            elseif category == 3 then
              
            coroutine.sleep(1)
            text_box9:visible(false)
          
            end
          
          end
        
        if actor.id == p1_id then
         
          if category == 8 then
        
          p1_spell = res.spells[p_param].name
          new_text12 = "[MA] " .. p1_spell .. "\n"
          text_box10:text(new_text12)
          text_box10:color(78, 255, 108)
          text_box10:visible(true)
          
          
          elseif category == 4 then
         
          S1 = os.clock()
          text_box10:visible(false)
          
          elseif category == 7 and p_param <= 255 then
          
          p1_ws = res.weapon_skills[p_param].name
          new_text13 = "[WS] " .. p1_ws .. "\n"
          text_box10:text(new_text13)
          text_box10:color(229, 119, 255)
          text_box10:visible(true)
          
          elseif category == 7 and p_param > 255 then
          
          p1t_ws = res.monster_abilities[p_param].name
          new_text14 = "[WS] " .. p1t_ws .. "\n"
          text_box10:text(new_text14)
          text_box10:color(229, 119, 255)
          text_box10:visible(true)
          
          elseif category == 3 then
           coroutine.sleep(1)
           text_box10:visible(false)
           
          end
          
        end
        
        if actor.id == p2_id then
         
          if category == 8 then
        
          p2_spell = res.spells[p_param].name
          new_text12 = "[MA] " .. p2_spell .. "\n"
          text_box11:text(new_text12)
          text_box11:color(78, 255, 108)
          text_box11:visible(true)
          
          elseif category == 4 then
          
          S2 = os.clock()
          text_box11:visible(false)
    
          elseif category == 7 and p_param <= 255 then
          
          p2_ws = res.weapon_skills[p_param].name
          new_text13 = "[WS] " .. p2_ws .. "\n"
          text_box11:text(new_text13)
          text_box11:color(229, 119, 255)
          text_box11:visible(true)
   
          
          elseif category == 7 and p_param > 255 then
          
          p2t_ws = res.monster_abilities[p_param].name
          new_text14 = "[WS] " .. p2t_ws .. "\n"
          text_box11:text(new_text14)
          text_box11:color(229, 119, 255)
          text_box11:visible(true)
       
          elseif category == 3 then
           coroutine.sleep(1)
           text_box11:visible(false)
          

          
          end
          
        end
        
        if actor.id == p3_id then
         
          if category == 8 then
        
          p3_spell = res.spells[p_param].name
          new_text15 = "[MA] " .. p3_spell .. "\n"
          text_box12:text(new_text15)
          text_box12:color(78, 255, 108)
          text_box12:visible(true)
          
          elseif category == 4 then
          
          S3 = os.clock()
          text_box12:visible(false)
    
          elseif category == 7 and p_param <= 255 then
          
          p3_ws = res.weapon_skills[p_param].name
          new_text16 = "[WS] " .. p3_ws .. "\n"
          text_box12:text(new_text16)
          text_box12:color(229, 119, 255)
          text_box12:visible(true)
          
          elseif category == 7 and p_param > 255 then
          
          p3_ws = res.monster_abilities[p_param].name
          new_text17 = "[WS] " .. p3_ws .. "\n"
          text_box12:text(new_text17)
          text_box12:color(229, 119, 255)
          text_box12:visible(true) 
          
          
          elseif category == 3 then
           coroutine.sleep(1)
           text_box12:visible(false)
          
          end
          
        end
        
        if actor.id == p4_id then
         
          if category == 8 then
        
          p4_spell = res.spells[p_param].name
          new_text18 = "[MA] " .. p4_spell .. "\n"
          text_box13:text(new_text18)
          text_box13:color(78, 255, 108)
          text_box13:visible(true)
          
          elseif category == 4 then
          
          S4 = os.clock() 
          text_box13:visible(false)
    
          elseif category == 7 and p_param <= 255 then
          
          p4_ws = res.weapon_skills[p_param].name
          new_text19 = "[WS] " .. p4_ws .. "\n"
          text_box13:text(new_text19)
          text_box13:color(229, 119, 255)
          text_box13:visible(true)
          
          elseif category == 7 and p_param > 255 then
            
          p4_ws = res.monster_abilities[p_param].name
          new_text20 = "[WS] " .. p4_ws .. "\n"
          text_box13:text(new_text20)
          text_box13:color(229, 119, 255)
          text_box13:visible(true)          
          
          elseif category == 3 then
           coroutine.sleep(1)
           text_box13:visible(false)
          
          end
          
        end
        
        if actor.id == p5_id then
         
          if category == 8 then
        
          p5_spell = res.spells[p_param].name
          new_text21 = "[MA] " .. p5_spell .. "\n"
          text_box14:text(new_text21)
          text_box14:color(78, 255, 108)
          text_box14:visible(true)
          
          elseif category == 4 then
         
          S5 = os.clock()
          text_box14:visible(false)
    
          elseif category == 7 and p_param <= 255 then
          
          p5_ws = res.weapon_skills[p_param].name
          new_text22 = "[WS] " .. p5_ws .. "\n"
          text_box14:text(new_text22)
          text_box14:color(229, 119, 255)
          text_box14:visible(true)
          
          elseif category == 7 and p_param > 255 then
          
          p5_ws = res.monster_abilities[p_param].name
          new_text23 = "[WS] " .. p5_ws .. "\n"
          text_box14:text(new_text23)
          text_box14:color(229, 119, 255)
          text_box14:visible(true)
          
          
          elseif category == 3 then
         
          coroutine.sleep(1)
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
        
        
        elseif category == 8 then
      
        action = "Casting Spell"
        lastaction = action
        current_spell = res.spells[p_param].name
        new_text9 = "[Using] " .. current_spell .. "\n"
        text_box8:text(new_text9)
        text_box8:visible(true)
        table.insert(Move_List, current_spell)
        
        
        elseif category == 4 then
        
        E0 = os.clock()
        coroutine.sleep(1)
        casting = "Finished"
        text_box8:visible(false)
        
        elseif category == 11 then
    
        action = "TP Move"
        lastaction = action
        --current_move = res.monster_abilities[param].name
        current_move = res_mobabi_safe[param].name
        new_text8 =  "[Using] " .. current_move .. "\n"
        text_box8:text(new_text8)
        text_box8:visible(true)
        table.insert(Move_List, current_move)
              
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
    text_box8:visible(false)
    text_box9:visible(false)
    text_box10:visible(false)
    text_box11:visible(false)
    text_box12:visible(false)
    text_box13:visible(false)
    text_box14:visible(false)
    end)

function round(num, numDecimalPlaces)
  return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

function lpad(str, len, char)
  if char == nil then char = ' ' end
  return string.rep(char, len - #str) .. str
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

      if PartyInfo.p1.mob ~= nil then
        
        p1_id = PartyInfo.p1.mob.id
      
      end
    
    end
    
    if PartyInfo.p2 ~= nil then
    
    p2_tp = PartyInfo.p2.tp
    p2_name = PartyInfo.p2.name
    p2_hpp = PartyInfo.p2.hpp
    p2_mpp = PartyInfo.p2.mpp
    p2_zone = PartyInfo.p2.zone
    if PartyInfo.p2.mob ~= nil then
    p2_id = PartyInfo.p2.mob.id
    end
    end
    
    if PartyInfo.p3 ~= nil then
    
    p3_tp = PartyInfo.p3.tp
    p3_name = PartyInfo.p3.name
    p3_hpp = PartyInfo.p3.hpp
    p3_mpp = PartyInfo.p3.mpp
    p3_zone = PartyInfo.p3.zone
    if PartyInfo.p3.mob ~= nil then
    p3_id = PartyInfo.p3.mob.id
    end
    end
    
    if PartyInfo.p4 ~= nil then
    
    p4_tp = PartyInfo.p4.tp
    p4_name = PartyInfo.p4.name
    p4_hpp = PartyInfo.p4.hpp
    p4_mpp = PartyInfo.p4.mpp
    p4_zone = PartyInfo.p4.zone
    if PartyInfo.p4.mob ~= nil then
    p4_id = PartyInfo.p4.mob.id
    end
    end
    
    if PartyInfo.p5 ~= nil then
    
    p5_tp = PartyInfo.p5.tp
    p5_name = PartyInfo.p5.name
    p5_hpp = PartyInfo.p5.hpp
    p5_mpp = PartyInfo.p5.mpp
    p5_zone = PartyInfo.p5.zone
    if PartyInfo.p5.mob ~= nil then
    p5_id = PartyInfo.p5.mob.id
    end
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

function BuildMoveList()
        
    if target ~= nil then
    
    local ph = "[No Moves Used]"
    text_box15:text(ph)
    text_box15:color(192, 192, 192)
    text_box15:update()
    text_box15:visible(true)
    local current_string =  " ~ Has Used ~ "
    
    for k, v in pairs(Move_List) do
    
    move_text = v 
    current_string = current_string..'\n['..v..']'
    box_text = current_string 
    text_box15:text(box_text)
    text_box15:color(216, 239, 255)
    text_box15:update()
    text_box15:visible(true)
    
      if #Move_List > 15 then
    
      Move_List = {}
    
      end
    
    end
    
  end
    
  if target == nil then
  
  Move_List = {}
  current_string = '[No Target]'
  text_box15:text(current_string)
  text_box15:update()
  text_box15:visible(false)
  
  end
  
end

function DisplayBox()
  
  local p1tp = p1_tp
  local p1dist = Distance_Helper.distance(p1_id)
  local p1distr = round(p1dist, 0)
  local p2dist = Distance_Helper.distance(p2_id)
  local p2distr = round(p2dist, 0)
  local p3dist = Distance_Helper.distance(p3_id)
  local p3distr = round(p3dist, 0)
  local p4dist = Distance_Helper.distance(p4_id)
  local p4distr = round(p4dist, 0)
  local p5dist = Distance_Helper.distance(p5_id)
  local p5distr = round(p5dist, 0)

  new_text = 
  name .. "\n"
  .. "[HP%] " .. lpad(tostring(hpp), 2) .. "\n"
  .. "[MP%] " .. lpad(tostring(mpp), 2) .. "\n"
  .. "[TP] " .. lpad(tostring(tp), #tostring(tp)+1) .. "\n"

    if p1_name ~= nil then    
    
    new_text3 = 
    p1_name .. "\n"
    .. "[HP%] " .. lpad(tostring(p1_hpp), 2) .. "\n"
    .. "[MP%] " .. lpad(tostring(p1_mpp), 2) .. "\n"
    .. "[TP] " .. lpad(tostring(p1_tp), #tostring(p1_tp)+1) .. "\n"
    
    dist_text1 = "[D]" .. p1distr .. "\n"
    
    text_box16:text(dist_text1)
    text_box16:visible(true)
    text_box3:text(new_text3)
    text_box3:visible(true)
    
    end
    
    if p1_zone ~= zone then
    
    text_box16:visible(false)
    text_box3:visible(false)
    
    end
    
    if p2_name ~= nil then
    
    new_text4 = 
    p2_name .. "\n"
    .. "[HP%] " .. lpad(tostring(p2_hpp), 2) .. "\n"
    .. "[MP%] " .. lpad(tostring(p2_mpp), 2) .. "\n"
    .. "[TP] " .. lpad(tostring(p2_tp), #tostring(p2_tp)+1) .. "\n"
    
    dist2_text = "[D]" .. p2distr .. "\n"
    
    text_box17:text(dist2_text)
    text_box17:visible(true)
    text_box4:text(new_text4)
    text_box4:visible(true)
  
    end
    
    if p2_zone ~= zone then
  
    text_box17:visible(false)
    text_box4:visible(false)
  
    end  
  
    if p3_name ~= nil then
     
    new_text5 = 
    p3_name .. "\n"
    .. "[HP%] " .. lpad(tostring(p3_hpp), 2) .. "\n"
    .. "[MP%] " .. lpad(tostring(p3_mpp), 2) .. "\n"
    .. "[TP] " .. lpad(tostring(p3_tp), #tostring(p3_tp)+1) .. "\n"
    
    dist3_text = "[D]" .. p3distr .. "\n"
    
    text_box18:text(dist3_text)
    text_box18:visible(true)
    text_box5:text(new_text5)
    text_box5:visible(true)
 
    end
    
    if p3_zone ~= zone then
    
    text_box18:visible(false)
    text_box5:visible(false)
    
    end  
  
    if p4_name ~= nil then
     
    new_text6 = 
    p4_name .. "\n"
    .. "[HP%] " .. lpad(tostring(p4_hpp), 2) .. "\n"
    .. "[MP%] " .. lpad(tostring(p4_mpp), 2) .. "\n"
    .. "[TP] " .. lpad(tostring(p4_tp), #tostring(p4_tp)+1) .. "\n"
    
    dist4_text = "[D]" .. p4distr .. "\n"
    
    text_box19:text(dist4_text)
    text_box19:visible(true)
    text_box6:text(new_text6)
    text_box6:visible(true)
    
    end
    
    if p4_zone ~= zone then
    
    text_box19:visible(false)
    text_box6:visible(false)
    
    end  
  
    if p5_name ~= nil then
     
    new_text7 = 
    p5_name .. "\n"
    .. "[HP%] " .. lpad(tostring(p5_hpp), 2) .. "\n"
    .. "[MP%] " .. lpad(tostring(p5_mpp), 2) .. "\n"
    .. "[TP] " .. lpad(tostring(p5_tp), #tostring(p5_tp)+1) .. "\n"
    
    dist5_text = "[D]" .. p5distr .. "\n"
    
    text_box20:text(dist5_text)
    text_box20:visible(true)
    text_box7:text(new_text7)
    text_box7:visible(true)
  
    end
  
    if p5_zone ~= zone then
    
    text_box20:visible(false)
    text_box7:visible(false)
    
    end  
  
  
    if p1dist > 20 then
      
      text_box16:color(255, 0, 127)
    
    elseif p1dist < 14.9 then
      
      text_box16:color(119, 247, 237)
    
    elseif p1dist > 15 and p1dist <= 19.9 then
      
      text_box16:color(255, 248, 21)
      
    end
    
    
    if p2dist > 20 then
      
      text_box17:color(255, 0, 127)
    
    elseif p2dist < 14.9 then
      
      text_box17:color(119, 247, 237)
    
    elseif p2dist > 15 and p2dist <= 19.9 then
      
      text_box17:color(255, 248, 21)
    
    end
    
    
    if p3dist > 20 then
      
      text_box18:color(255, 0, 127)
    
    elseif p3dist < 14.9 then
      
      text_box18:color(119, 247, 237)
    
    elseif p3dist > 15 and p3dist <= 19.9 then
      
      text_box18:color(255, 248, 21)
  
    end
  
    if p4dist > 20 then
      
      text_box19:color(255, 0, 127)
  
    elseif p4dist < 14.9 then
      
      text_box19:color(119, 247, 237)
    
    elseif p4dist > 15 and p4dist <= 19.9 then
      
      text_box19:color(255, 248, 21)
      
    end
  
    if p5dist > 20 then
      
      text_box20:color(255, 0, 127)
  
    elseif p5dist < 14.9 then
      
      text_box20:color(119, 247, 237)
    
    elseif p5dist > 15 and p5dist <= 19.9 then
      
      text_box20:color(255, 248, 21)
  
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
    .. "[HP%] " .. lpad(tostring(target_hpp), #tostring(target_hpp)+5) .. "\n"
    .. "[Distance] " .. lpad(tostring(round(target_distance, 1)), #tostring(round(target_distance, 1))) .. "\n"
    .. "[Enmity] " .. lpad(Enmity, #Enmity+2) .. "\n"

    
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

function BoxCheck()
  
  if text_box9:visible() == true and os.clock() - S0 > 20 then
            
  text_box9:visible(false)
  S0 = os.clock()
  
  end

  if text_box10:visible() == true and os.clock() - S1 > 20 then
         
  text_box10:visible(false)
  S1 = os.clock()
  
  end

  if text_box11:visible() == true and os.clock() - S2 > 20 then
         
  text_box11:visible(false)
  S2 = os.clock()
  
  end

  if text_box12:visible() == true and os.clock() - S3 > 20 then
          
  text_box12:visible(false)
  S3 = os.clock()
  
  end

  if text_box13:visible() == true and os.clock() - S4 > 20 then
         
  text_box13:visible(false) 
  S4 = os.clock()
  
  end
  
  if text_box14:visible() == true and os.clock() - S5 > 20 then
          
  text_box14:visible(false)
  S5 = os.clock()
  
  end
  
  if text_box8:visible() == true and os.clock() - E0 > 20 then
  
  text_box8:visible(false)
        
  end
      
end
  

windower.register_event('prerender', function()
    getinfo()
    EnemyInfo()
    DisplayBox()
    BoxCheck()
    BuildMoveList()
    end)
