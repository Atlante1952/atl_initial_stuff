local function giveInitialStuff(player)
    local initial_stuff = {
        "default:sword_wood 1",
        "default:apple 3",
        "default:stone 10",
    }

    local inventory = player:get_inventory()
    for _, itemstring in ipairs(initial_stuff) do
        inventory:add_item("main", ItemStack(itemstring))
    end

    player:get_meta():set_string("received_initial_stuff", "true")
end

minetest.register_on_joinplayer(function(player)
    local meta = player:get_meta()
    if meta:get_string("received_initial_stuff") ~= "true" then
        giveInitialStuff(player)
    end
end)
