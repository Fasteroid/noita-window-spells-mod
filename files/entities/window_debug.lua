dofile_once("mods/windows/files/window_common.lua")

function ComponentObjectEditValue2(component_id, object_name, field_name, modifier)

local crossing_projectiles = FindCrossingProjectiles("crossed_window_debug")

for i=1, #crossing_projectiles do
    EntityKill(crossing_projectiles[i])
end