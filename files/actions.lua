

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
		add_projectile("mods/windows/files/entities/window_berserk.xml")
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
	-- max_uses = 15,
	action = function()
		add_projectile("mods/windows/files/entities/window_frozen.xml")
	end,
} )






table.insert( actions,
{
    id                 = "WINDOW_DEBUG",
    name               = "$action_window_debug",
    description        = "$actiondesc_window_debug",
    sprite             = "mods/windows/files/gfx/window_debug.png",
	type 			   = ACTION_TYPE_STATIC_PROJECTILE,
	spawn_level                       = "10",  -- BERSERK_FIELD
	spawn_probability                 = "0.1", -- BERSERK_FIELD
	price = 180,
	price = 200,
	mana  = 30,
	-- max_uses = 15,
	action = function()
		add_projectile("mods/windows/files/entities/window_debug.xml")
	end,
} )
