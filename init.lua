--dofile_once( "data/scripts/lib/utilities.lua" )

-- all functions below are optional and can be left out

--[[
function OnModPreInit()
	print("Mod - OnModPreInit()") -- First this is called for all mods
end

function OnModPostInit()
	print("Mod - OnModPostInit()") -- Then this is called for all mods
end

function OnWorldInitialized() -- This is called once the game world is initialized. Doesn't ensure any world chunks actually exist. Use OnPlayerSpawned to ensure the chunks around player have been loaded or created.
	GamePrint( "OnWorldInitialized() " .. tostring(GameGetFrameNum()) )
end

function OnWorldPreUpdate() -- This is called every time the game is about to start updating the world
	GamePrint( "Pre-update hook " .. tostring(GameGetFrameNum()) )
end

function OnWorldPostUpdate() -- This is called every time the game has finished updating the world
	GamePrint( "Post-update hook " .. tostring(GameGetFrameNum()) )
end

function OnMagicNumbersAndWorldSeedInitialized() -- this is the last point where the Mod* API is available. after this materials.xml will be loaded.
	local x = ProceduralRandom(0,0)
	print( "===================================== random " .. tostring(x) )
end
]]--

function OnModInit()
  local translations = ModTextFileGetContent("data/translations/common.csv")
  local new_translations = ModTextFileGetContent("mods/windows/files/translations.csv")
  translations = translations .. "\n" .. new_translations .. "\n"
  translations = translations:gsub("\r", ""):gsub("\n\n+", "\n")
  ModTextFileSetContent("data/translations/common.csv", translations)
end


-- function OnPlayerSpawned( player_entity ) -- This runs when player entity has been created
-- 	local x, y = EntityGetTransform( player_entity )
-- 	CreateItemActionEntity("WINDOW_BERSERK", x+20, y)
-- end

-- This code runs when all mods' filesystems are registered
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/windows/files/actions.lua" ) -- Basically dofile("mods/example/files/actions.lua") will appear at the end of gun_actions.lua