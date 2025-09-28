dofile_once("mods/windows/files/window_common.lua")

local crossing_projectiles = FindCrossingProjectiles("crossed_window_berserk")

for i=1, #crossing_projectiles do
    local proj = crossing_projectiles[i]

    local children = EntityGetAllComponents(proj)

    for j=1, #children do
        local child = children[j]
        local kind = ComponentGetTypeName(child)
        

        local members = ComponentGetMembers(child)
        for k, v in pairs(members) do
            if( v == nil ) then goto continue_2 end
            print(kind, k, v)
            ::continue_2::
        end

    end

    ::continue_1::
end