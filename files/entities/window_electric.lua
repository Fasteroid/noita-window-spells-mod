dofile_once("mods/windows/files/window_common.lua")
dofile_once("mods/windows/files/constants.lua")

local crossing_projectiles = FindCrossing()

for i=1, #crossing_projectiles do
    local proj = crossing_projectiles[i]

    EntityLoadToEntity( "data/entities/particles/electricity.xml", proj )
    GamePlaySoundFromEntity(proj, "data/audio/Desktop/materials.bank", "materials/electric_spark")
    
    local proj_comp = EntityGetFirstComponent(proj, "ProjectileComponent")
    ComponentEditValue2(proj_comp, "damage_game_effect_entities", function(fx) return fx .. "data/entities/misc/effect_electrified.xml," end)
    ComponentObjectEditValue2(proj_comp, "damage_by_type", "electricity", function(dmg) return (dmg or 0) + ELECTRIC_CHARGE_DAMAGE end)

    local electricImpact = EntityAddComponent2(proj, "LuaComponent", {
        execute_on_removed = true,
        execute_every_n_frame = -1,
        script_source_file = "mods/windows/files/entities/window_electric_modifier.lua"
    })
end