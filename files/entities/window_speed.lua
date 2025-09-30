dofile_once("mods/windows/files/window_common.lua")
dofile_once("mods/windows/files/constants.lua")

local crossing_projectiles = FindCrossing({"projectile", "prop"}, false)

for i=1, #crossing_projectiles do
    local proj = crossing_projectiles[i]
    GamePlaySoundFromEntity(proj, "data/audio/Desktop/misc.bank", "misc/telekinesis/throw")
    
    local vel_comp = EntityGetFirstComponent(proj, "VelocityComponent")

    if not vel_comp then goto next end
    
    local x, y = ComponentGetValue2(vel_comp, "mVelocity")
    local mass = ComponentGetValue2(vel_comp, "mass")

    x = x * SPEED_WINDOW_MUL
    y = y * SPEED_WINDOW_MUL

    ComponentSetValue2(vel_comp, "mVelocity", x, y)

    PhysicsApplyForce(proj, x * SPEED_WINDOW_MUL, y * SPEED_WINDOW_MUL)
    ::next::
end