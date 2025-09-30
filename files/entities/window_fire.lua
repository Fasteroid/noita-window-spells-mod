dofile_once("mods/windows/files/window_common.lua")

local crossing_projectiles = FindCrossingProjectiles()

for i=1, #crossing_projectiles do
    local proj = crossing_projectiles[i]

    EntityLoadToEntity( "data/entities/misc/burn.xml", proj )
    GamePlaySoundFromEntity(proj, "data/audio/Desktop/projectiles.bank", "player_projectiles/flamethrower/create")
    
    local proj_comp = EntityGetFirstComponent(proj, "ProjectileComponent")
    ComponentEditValue2(proj_comp, "damage_game_effect_entities", function(fx) return fx .. "data/entities/misc/effect_apply_on_fire.xml," end)
    ComponentObjectEditValue2(proj_comp, "damage_by_type", "fire", function(dmg) return (dmg or 0) + 0.1 end)
end