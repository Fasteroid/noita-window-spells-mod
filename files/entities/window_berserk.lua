dofile_once("mods/windows/files/window_common.lua")

local crossing_projectiles = FindCrossingProjectiles("crossed_window_berserk")

for i=1, #crossing_projectiles do
    print( tostring(crossing_projectiles[i]), "went through a berserk window" )
end