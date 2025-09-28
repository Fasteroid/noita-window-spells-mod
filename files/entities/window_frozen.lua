dofile_once("mods/windows/files/window_common.lua")

local crossing_projectiles = FindCrossingProjectiles("crossed_window_frozen")

for i=1, #crossing_projectiles do
    local proj = crossing_projectiles[i]

    EntityLoadToEntity( "data/entities/particles/freeze_charge.xml", proj )
    
    local proj_comp = EntityGetFirstComponent(proj, "ProjectileComponent")
    ComponentEditValue2(proj_comp, "damage_game_effect_entities", function(fx) return fx .. "data/entities/misc/effect_frozen.xml," end)
    ComponentObjectEditValue2(proj_comp, "damage_by_type", "ice", function(dmg) return (dmg or 0) + 0.2 end)
end