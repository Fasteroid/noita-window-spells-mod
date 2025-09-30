dofile_once("mods/windows/files/constants.lua")

table.insert( actions,
{
    id                 = "WINDOW_BERSERK",
    name               = "$action_window_berserk",
    description        = "$actiondesc_window_berserk",
    sprite             = "mods/windows/files/gfx/window_berserk.png",
	type 			   = ACTION_TYPE_STATIC_PROJECTILE,
	spawn_level        = "2,3,4", -- BERSERK_FIELD
	spawn_probability  = "0.3,0.6,0.3", -- BERSERK_FIELD
	price              = 300,
	mana               = 90,
	max_uses           = 10,
	action = function()
		if not reflecting then
			add_projectile("mods/windows/files/entities/window_berserk.xml")
		end
		c.fire_rate_wait = c.fire_rate_wait + 30
	end,
} )

table.insert( actions,
{
    id                 = "WINDOW_SPEED",
    name               = "$action_window_speed",
    description        = "$actiondesc_window_speed",
    sprite             = "mods/windows/files/gfx/window_speed.png",
	type 			   = ACTION_TYPE_STATIC_PROJECTILE,
	spawn_level        = "2,3,4",
	spawn_probability  = "0.4,0.7,0.4",
	price              = 250,
	mana               = 75,
	max_uses           = 12,
	action = function()
		if not reflecting then
			add_projectile("mods/windows/files/entities/window_speed.xml")
		else
			c.speed_multiplier = c.speed_multiplier * SPEED_WINDOW_MUL
		end
		c.fire_rate_wait = c.fire_rate_wait + 25
	end,
} )

table.insert( actions,
{
    id                 = "WINDOW_FROZEN",
    name               = "$action_window_frozen",
    description        = "$actiondesc_window_frozen",
    sprite             = "mods/windows/files/gfx/window_frozen.png",
	type 			   = ACTION_TYPE_STATIC_PROJECTILE,
	spawn_level        = "0,2,4,5", -- FREEZE_FIELD
	spawn_probability  = "0.3,0.6,0.7,0.3", -- FREEZE_FIELD
	price              = 200,
	mana               = 50,
	max_uses           = 15,
	action = function()
		if not reflecting then
			add_projectile("mods/windows/files/entities/window_frozen.xml")
		else
			c.damage_ice_add = c.damage_ice_add + FREEZE_CHARGE_DAMAGE
		end
		c.fire_rate_wait = c.fire_rate_wait + 15
	end,
} )

table.insert( actions,
{
    id                 = "WINDOW_ELECTRIC",
    name               = "$action_window_electric",
    description        = "$actiondesc_window_electric",
    sprite             = "mods/windows/files/gfx/window_electric.png",
	type 			   = ACTION_TYPE_STATIC_PROJECTILE,
	spawn_level        = "1,3,5,6", -- ELECTROCUTION_FIELD
	spawn_probability  = "0.3,0.6,0.8,0.3", -- ELECTROCUTION_FIELD
	price              = 200,
	mana               = 50,
	max_uses           = 15,
	action = function()
		if not reflecting then
			add_projectile("mods/windows/files/entities/window_electric.xml")
		else 
			c.damage_electricity_add = c.damage_electricity_add + ELECTRIC_CHARGE_DAMAGE
		end
		c.fire_rate_wait = c.fire_rate_wait + 15
	end,
} )

table.insert( actions,
{
    id                 = "WINDOW_FIRE",
    name               = "$action_window_fire",
    description        = "$actiondesc_window_fire",
    sprite             = "mods/windows/files/gfx/window_fire.png",
	type 			   = ACTION_TYPE_STATIC_PROJECTILE,
	spawn_level        = "0,1,4,5,6",
	spawn_probability  = "0.6,0.8,0.5,0.6,0.7", -- biome temperature sorta
	price              = 220,
	mana               = 60,
	max_uses           = 15,
	action = function()
		if not reflecting then
			add_projectile("mods/windows/files/entities/window_fire.xml")
		else
			c.damage_fire_add = c.damage_fire_add + FIRE_CHARGE_DAMAGE
		end
		c.fire_rate_wait = c.fire_rate_wait + 15
	end,
} )