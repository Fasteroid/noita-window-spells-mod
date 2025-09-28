

function Think() 

    print( GetUpdatedEntityID() )

    local projectiles = EntityGetWithTag("projectile")

    for i=1, #projectiles do
        local projectile = projectiles[i]

        local velocity = EntityGetFirstComponent(projectile, "VelocityComponent")
        
        if not velocity then goto continue_1 end

        local x2, y2 = EntityGetTransform(projectile)
        local x1, y1 = ComponentGetValue2(velocity, "mPrevPosition")


        ::continue_1::
    end

end