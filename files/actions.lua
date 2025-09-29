

table.insert( actions,
{
    id                 = "WINDOW_BERSERK",
    name               = "$action_window_berserk",
    description        = "$actiondesc_window_berserk",
    sprite             = "mods/windows/files/gfx/window_berserk.png",
	type 			   = ACTION_TYPE_STATIC_PROJECTILE,
	spawn_level        = "2,3,4", -- BERSERK_FIELD
	spawn_probability  = "0.3,0.6,0.3", -- BERSERK_FIELD
	price              = 180,
	price              = 200,
	mana               = 30,
	max_uses           = 15,
	action = function()
		if not reflecting then
			add_projectile("mods/windows/files/entities/window_berserk.xml")
		end
		c.fire_rate_wait = c.fire_rate_wait + 15
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
	mana               = 15,
	max_uses = 15,
	action = function()
		if not reflecting then
			add_projectile("mods/windows/files/entities/window_frozen.xml")
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
	mana               = 60,
	max_uses           = 15,
	max_uses           = 15,
	action = function()
		if not reflecting then
			add_projectile("mods/windows/files/entities/window_electric.xml")
		end
		c.fire_rate_wait = c.fire_rate_wait + 15
	end,
} )