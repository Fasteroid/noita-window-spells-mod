dofile_once("mods/windows/files/window_common.lua")

-- I did this one first, so it might be overcomplicated or scuffed
-- Look at ANY OTHER FILE for examples!

function isBerserked(entity)
    local telltale = EntityGetFirstComponent(entity, "SpriteParticleEmitterComponent")
    if not telltale then return false end

    local sprite = ComponentGetValue2(telltale, "sprite_file")

    return (sprite == "data/particles/tinyspark_02.xml")
end

local double = function(n) return n*2 end

function applyBerserkToProjectile(entity)

    local projectile_component = EntityGetFirstComponent(entity, "ProjectileComponent")

    if( EntityGetVariable(entity, "bsrk_wnd_basedamage", "value_float") == nil ) then
        local baseDamage = ComponentGetValue2(projectile_component, "damage")
        local baseRay    = ComponentObjectGetValue2(projectile_component, "config_explosion", "ray_energy")
        local baseRadius = ComponentObjectGetValue2(projectile_component, "config_explosion", "explosion_radius")

        if( isBerserked(entity) ) then 
            baseDamage = baseDamage * 0.5 
            baseRay    = baseRay * 0.5
            baseRadius = baseRadius * 0.5
        end

        EntitySetVariable(entity, "bsrk_wnd_basedamage", baseDamage, "value_float")
        EntitySetVariable(entity, "bsrk_wnd_baseray"   , baseRay   , "value_float")
        EntitySetVariable(entity, "bsrk_wnd_baseradius", baseRadius, "value_float")
    end

    local windowCount = ( EntityGetVariable(entity, "bsrk_wnd_count", "value_int") or 1 ) + 1
    EntitySetVariable(entity, "bsrk_wnd_count", windowCount, "value_int")

    local baseDamage = EntityGetVariable(entity, "bsrk_wnd_basedamage", "value_float")
    local baseRay    = EntityGetVariable(entity, "bsrk_wnd_baseray"   , "value_float")
    local baseRadius = EntityGetVariable(entity, "bsrk_wnd_baseradius", "value_float")
    
    local berserk_trail = EntityAddComponent2(entity, "ParticleEmitterComponent", {
        emitted_material_name         = "spark_red",
		x_pos_offset_min              = -1,
		x_pos_offset_max              = 1,
		y_pos_offset_min              = -1,
		y_pos_offset_max              = 1,
		x_vel_min                     = -2,
		x_vel_max                     = 2,
		y_vel_min                     = -2,
		y_vel_max                     = 2,
        count_min                     = 1,
		count_max                     = 2,
		is_trail                      = true,
        trail_gap                     = 1,
		fade_based_on_lifetime        = true,
		lifetime_min                  = 0.8,
		lifetime_max                  = 2.0,
		airflow_force                 = 1.5,
		airflow_time                  = 0.401,
		airflow_scale                 = 0.05,
		create_real_particles         = false,
		emit_cosmetic_particles       = true,
		render_on_grid                = true,
		emission_interval_min_frames  = 1,
		emission_interval_max_frames  = 2,
		is_emitting                   = true,
        particle_single_width         = true,
        emission_chance               = 100,
        image_animation_emission_probability = 1,
        cosmetic_force_create = true
        
    })

    ComponentSetValue2(berserk_trail, "gravity", 0, 0, 0, 0)

    ComponentObjectSetValue2(projectile_component, "config_explosion", "ray_energy", baseRay * windowCount)
    ComponentObjectSetValue2(projectile_component, "config_explosion", "explosion_radius", baseRadius * windowCount)

    ComponentObjectSetValue2(projectile_component,  "config_explosion", "sparks_inner_radius_coeff", 0)
    ComponentObjectSetValue2(projectile_component,  "config_explosion", "sparks_enabled", true) 

    ComponentSetValue2(projectile_component,  "mShooterHerdId", -1)

    ComponentSetValue2(projectile_component, "damage", baseDamage * windowCount)
end

local crossing_projectiles = FindCrossingProjectiles("crossed_window_berserk")

for i=1, #crossing_projectiles do

    local proj = crossing_projectiles[i]

    -- comment(Fasteroid): this might be needed for balance later
    -- if( isBerserked(proj) ) then goto continue_2 end

    applyBerserkToProjectile(proj)

    ::continue_2::

end