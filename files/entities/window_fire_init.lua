local what = GetUpdatedEntityID()
local x, y = EntityGetTransform(what)

GamePlaySound("data/audio/Desktop/projectiles.bank", "player_projectiles/torch/enable", x, y)