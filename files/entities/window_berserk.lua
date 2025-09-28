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

    local count = EntityGetVariable(entity, "berserk_window_count", "value_int") or 0
    EntitySetVariable(entity, "berserk_window_count", count + 1)

    local projectile_component = EntityGetFirstComponent(entity, "ProjectileComponent")

    if( count > 3 ) then
        if( EntityHasTag(entity,"berserk_window_overcharge") ) then return end

        ComponentObjectSetValues2(projectile_component,"config_explosion",{
            never_cache=true ,
            camera_shake=60,
            explosion_radius=250,
            explosion_sprite="data/particles/explosion_032.xml",
            load_this_entity="data/entities/particles/particle_explosion/main_large.xml,data/entities/misc/loose_chunks.xml,data/entities/misc/explosion_was_here.xml",
            explosion_sprite_lifetime=0,
            create_cell_probability=5 ,
            hole_destroy_liquid=true,
            hole_enabled=true,
            ray_energy=6700000,
            damage=10,
            particle_effect=true,
            damage_mortals=true,
            shake_vegetation=true,
            sparks_count_max=3000,
            sparks_count_min=3000,
            sparks_enabled=true,
            stains_enabled=true ,
            stains_radius=35,
            background_lightning_count=5,
            max_durability_to_destroy=12,
            audio_event_name="explosions/nuke"
        })
        EntityLoadToEntity("data/entities/misc/crumbling_earth_projectile.xml", entity)

        EntityKill( GetUpdatedEntityID() )

        ComponentSetValue2(projectile_component, "lifetime", 0)
        EntityAddTag(entity, "berserk_window_overcharge")
        return
    end
    
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

    if( count < 2 ) then -- don't double explosion more than twice
        ComponentObjectEditValue2(projectile_component, "config_explosion", "ray_energy", double)
        ComponentObjectEditValue2(projectile_component, "config_explosion", "explosion_radius", double)
    end

    ComponentObjectSetValue2(projectile_component,  "config_explosion", "sparks_inner_radius_coeff", 0)
    ComponentObjectSetValue2(projectile_component,  "config_explosion", "sparks_enabled", true) 

    ComponentSetValue2(projectile_component,  "mShooterHerdId", -1)

    ComponentEditValue2(projectile_component, "damage", double)
end

local crossing_projectiles = FindCrossingProjectiles("crossed_window_berserk")

for i=1, #crossing_projectiles do

    local proj = crossing_projectiles[i]

    -- comment(Fasteroid): this might be needed for balance later
    -- if( isBerserked(proj) ) then goto continue_2 end

    applyBerserkToProjectile(proj)

    ::continue_2::

end