

table.insert( actions,
{
    id                 = "WINDOW_BERSERK",
    name               = "$action_window_berserk",
    description        = "$actiondesc_window_berserk",
    sprite             = "mods/windows/files/gfx/window_berserk.png",
	type 			   = ACTION_TYPE_STATIC_PROJECTILE,
	spawn_level                       = "2,3,4", -- BERSERK_FIELD
	spawn_probability                 = "0.3,0.6,0.3", -- BERSERK_FIELD
	price = 180,
	price = 200,
	mana  = 30,
	max_uses = 15,
	action = function()
		add_projectile("mods/windows/files/entities/window_berserk.xml")
	end,
} )
