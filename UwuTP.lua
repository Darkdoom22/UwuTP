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
_addon.version = "1.5"


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
          
            player_spell = res.spells[p_param].name
          
            new_text10 = "[MA] " .. player_spell .. "\n"
            text_box9:text(new_text10)
            text_box9:color(78, 255, 108)
            text_box9:visible(true)
  
            elseif category == 4 then
            
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
        
        if actor.name == p1_name then
         
          if category == 8 then
        
          p1_spell = res.spells[p_param].name
          new_text12 = "[MA] " .. p1_spell .. "\n"
          text_box10:text(new_text12)
          text_box10:color(78, 255, 108)
          text_box10:visible(true)
          
          elseif category == 4 then
          
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
        
        if actor.name == p2_name then
         
          if category == 8 then
        
          p2_spell = res.spells[p_param].name
          new_text12 = "[MA] " .. p2_spell .. "\n"
          text_box11:text(new_text12)
          text_box11:color(78, 255, 108)
          text_box11:visible(true)
          
          elseif category == 4 then
          
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
        
          if actor.name == p3_name then
         
          if category == 8 then
        
          p3_spell = res.spells[p_param].name
          new_text15 = "[MA] " .. p3_spell .. "\n"
          text_box12:text(new_text15)
          text_box12:color(78, 255, 108)
          text_box12:visible(true)
          
          elseif category == 4 then
          
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
        
          if actor.name == p4_name then
         
          if category == 8 then
        
          p4_spell = res.spells[p_param].name
          new_text18 = "[MA] " .. p4_spell .. "\n"
          text_box13:text(new_text18)
          text_box13:color(78, 255, 108)
          text_box13:visible(true)
          
          elseif category == 4 then
          
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
        
          if actor.name == p5_name then
         
          if category == 8 then
        
          p5_spell = res.spells[p_param].name
          new_text21 = "[MA] " .. p5_spell .. "\n"
          text_box14:text(new_text21)
          text_box14:color(78, 255, 108)
          text_box14:visible(true)
          
          elseif category == 4 then
          
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
        local exclusions = {
          [1002] = 1002, [1003] = 1003, [1004] = 1004,
          [1005] = 1005, [1007] = 1007, [1053] = 1053,
          [1124] = 1124, [1125] = 1125, [1126] = 1126, 
          [1257] = 1257, [1343] = 1343, [1344] = 1344,
          [1345] = 1345, [1346] = 1346, [1388] = 1388,
          [1396] = 1396, [1398] = 1398, [1399] = 1399,
          [1400] = 1400, [1402] = 1402, [1435] = 1435,
          [1460] = 1460, [1550] = 1550, [1719] = 1719,
          [1739] = 1739, [1740] = 1740, [1741] = 1741,
          [1750] = 1750, [1751] = 1751, [1763] = 1763,
          [1764] = 1764, [1776] = 1776, [1777] = 1777,
          [1811] = 1811, [1833] = 1833, [1892] = 1892,
          [1901] = 1901, [1902] = 1902, [1915] = 1915,
          [1927] = 1927, [1928] = 1928, [1937] = 1937,
          [1938] = 1938, [1939] = 1939, [1971] = 1971,
          [1972] = 1972, [1973] = 1973, [1974] = 1974,
          [1975] = 1975, [1976] = 1976, [1979] = 1979,
          [1981] = 1981, [2017] = 2017, [2018] = 2018,
          [2019] = 2019, [2029] = 2029, [2030] = 2030,
          [2087] = 2087, [2093] = 2093, [2127] = 2127,
          [2128] = 2128, [2129] = 2129, [2131] = 2131,
          [2211] = 2211, [2212] = 2212, [2214] = 2214,
          [2215] = 2215, [2262] = 2262, [2296] = 2296,
          [2297] = 2297, [2298] = 2298, [2326] = 2326,
          [2328] = 2328,  [2329] = 2329,[2330] = 2330, [2331] = 2331,
          [2332] = 2332, [2333] = 2333, [2339] = 2339, 
          [2341] = 2341, [2342] = 2342, [2343] = 2343,
          [2344] = 2344, [2345] = 2345, [2346] = 2346,
          [2347] = 2347, [2353] = 2353, [2354] = 2354, 
          [2355] = 2355, [2356] = 2356, [2357] = 2357,
          [2362] = 2362, [2363] = 2363, [2408] = 2408,
          [2409] = 2409, [2434] = 2434, [2460] = 2460,
          [2498] = 2498, [2499] = 2499, [2500] = 2500, 
          [2501] = 2501, [2502] = 2502, [2503] = 2503, 
          [2504] = 2504, [2505] = 2505, [2506] = 2506,
          [2507] = 2507, [2508] = 2508, [2515] = 2515,
          [2554] = 2554, [2555] = 2555, [2582] = 2582,
          [2583] = 2583, [2584] = 2584, [2672] = 2672,
          [2673] = 2673, [2674] = 2674, [2711] = 2711,
          [2712] = 2712, [2713] = 2713, [2722] = 2722,
          [2723] = 2723, [2724] = 2724, [2748] = 2748,
          [2749] = 2749, [2750] = 2750, [2919] = 2919,
          [2920] = 2920, [2921] = 2921, [2938] = 2938,
          [2939] = 2939, [2954] = 2954, [2955] = 2955,
          [2956] = 2956, [2962] = 2962, [2963] = 2963,
          [2964] = 2964, [2987] = 2987, [2999] = 2999,
          [3000] = 3000, [3001] = 3001, [3008] = 3008,
          [3009] = 3009, [3010] = 3010, [3017] = 3017,
          [3018] = 3018, [3019] = 3019, [3027] = 3027,
          [3028] = 3028, [3029] = 3029, [3034] = 3034,
          [3035] = 3035, [3042] = 3042, [3054] = 3054,
          [3055] = 3055, [3056] = 3056, [3067] = 3067,
          [3068] = 3068, [3069] = 3069, [3070] = 3070,
          [3071] = 3071, [3078] = 3078, [3079] = 3079,
          [3080] = 3080, [3086] = 3086, [3088] = 3088,
          [3089] = 3089, [3090] = 3090, [3102] = 3102,
          [3117] = 3117, [3118] = 3118, [3119] = 3119,
          [3120] = 3120, [3121] = 3121, [3122] = 3122,
          [3128] = 3128, [3129] = 3129, [3143] = 3143, 
          [3147] = 3147, [3148] = 3148, [3157] = 3157,
          [3158] = 3158, [3159] = 3159, [3165] = 3165,
          [3166] = 3166, [3167] = 3167, [3225] = 3225,
          [3226] = 3226, [3227] = 3227, [3228] = 3228,
          [3229] = 3229, [3250] = 3250, [3267] = 3267,
          [3268] = 3268, [3269] = 3269, [3270] = 3270,
          [3271] = 3271, [3272] = 3272, [3273] = 3273,
          [3274] = 3274, [3299] = 3299, [3300] = 3300,
          [3301] = 3301, [3302] = 3302, [3321] = 3321,
          [3344] = 3344, [3359] = 3359, [3360] = 3360,
          [3361] = 3361, [3362] = 3362, [3369] = 3369,
          [3370] = 3370, [3371] = 3371, [3377] = 3377,
          [3378] = 3378, [3379] = 3379, [3386] = 3386,
          [3387] = 3387, [3388] = 3388, [3395] = 3395,
          [3396] = 3396, [3397] = 3397, [3398] = 3398,
          [3455] = 3455, [3456] = 3456, [3457] = 3457,
          [3458] = 3458, [3459] = 3459, [3460] = 3460,
          [3463] = 3463, [3464] = 3464, [3465] = 3465,
          [3508] = 3508, [3509] = 3509, [3510] = 3510,
          [3527] = 3527, [3528] = 3258, [3529] = 3529,
          [3534] = 3534, [3535] = 3535, [3573] = 3573, 
          [3574] = 3574, [3575] = 3575, [3576] = 3576,
          [3586] = 3586, [3587] = 3587, [3588] = 3588,
          [3589] = 3589, [3597] = 3597, [3598] = 3598,
          [3599] = 3599, [3600] = 3600, [3601] = 3601,
          [3613] = 3613, [3614] = 3614, [3615] = 3615,
          [3616] = 3616, [3628] = 3628, [3629] = 3629,
          [3630] = 3630, [3648] = 3648, [3649] = 3649,
          [3650] = 3650, [3651] = 3651, [3659] = 3659,
          [3660] = 3660, [3661] = 3661, [3673] = 3673,
          [3674] = 3674, [3675] = 3675, [3681] = 3681,
          [3682] = 3682, [3683] = 3683, [3693] = 3693,
          [3694] = 3694, [3695] = 3695, [3696] = 3696,
          [3739] = 3739, [3747] = 3747, [3748] = 3748,
          [3749] = 3749, [3792] = 3792, [3829] = 3829,
          [3830] = 3830, [3831] = 3831, [3832] = 3832,
          [3833] = 3833, [3834] = 3834, [3835] = 3835,
          [3836] = 3836, [3837] = 3837, [3838] = 3838,
          [3839] = 3839, [3952] = 3952, [3953] = 3953,
          [3954] = 3954, [3955] = 3955, [3956] = 3956,
          [3957] = 3957, [3958] = 3958, [3959] = 3959,
          [3960] = 3960, [3961] = 3961, [3962] = 3962,
          [3963] = 3963, [3964] = 3964, [3965] = 3965,
          [3966] = 3966, [3967] = 3967, [4041] = 4041,
          [4042] = 4042, [4043] = 4043, [4044] = 4044,
          [4045] = 4045, [4046] = 4046, [4047] = 4047,
          [4048] = 4048, [4049] = 4049, [4050] = 4050,
          [4051] = 4051, [4052] = 4052, [4053] = 4053,
          [4054] = 4054, [4055] = 4055, [4056] = 4056,
          [4057] = 4057, [4058] = 4058, [4059] = 4059,
          [4060] = 4060, [4061] = 4061, [4062] = 4062,
          [4063] = 4063, [4064] = 4064, [4065] = 4065,
          [4066] = 4066, [4067] = 4067, [4068] = 4068,
          [4069] = 4069, [4070] = 4070, [4071] = 4071,
          [4072] = 4072, [4073] = 4073, [4074] = 4074,
          [4075] = 4075, [4076] = 4076, [4077] = 4077,
          [4078] = 4078, [4079] = 4079, [4080] = 4080,
          [4081] = 4081, [4082] = 4082, [4083] = 4083,
          [4084] = 4084, [4085] = 4085, [4086] = 4086,
          [4087] = 4087, [4088] = 4088, [4089] = 4089, 
          [4090] = 4090, [4091] = 4091, [4092] = 4092,
          [4093] = 4093, [4094] = 4094, [4095] = 4095,
          [4205] = 4205, [4206] = 4206, [4207] = 4207,
          [4208] = 4208, [4209] = 4209, [4210] = 4210,
        }
        
        if not exclusions[param] then
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
