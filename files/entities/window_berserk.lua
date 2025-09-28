dofile_once("mods/windows/files/window_common.lua")

-- berserkium seems to manually mutate the projectile when it's created
function isBerserked(entity)

    local telltale = EntityGetFirstComponent(entity, "SpriteParticleEmitterComponent")
    if not telltale then return false end

    local sprite = ComponentGetValue2(telltale, "sprite_file")

    return (sprite == "data/particles/tinyspark_02.xml")
end


function applyBerserkToProjectile(entity)

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

end

local crossing_projectiles = FindCrossingProjectiles("crossed_window_berserk")

for i=1, #crossing_projectiles do
    local proj = crossing_projectiles[i]

    applyBerserkToProjectile(proj)

    -- local children = EntityGetAllComponents(proj)

    -- for j=1, #children do
    --     local child = children[j]
    --     local kind = ComponentGetTypeName(child)
        

    --     local members = ComponentGetMembers(child)
    --     for k, v in pairs(members) do
    --         if( v == nil ) then goto continue_2 end
    --         print(kind, k, v)
    --         ::continue_2::
    --     end

    -- end

    ::continue_1::
end