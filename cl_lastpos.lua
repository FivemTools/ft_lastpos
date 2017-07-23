-- @Project: FiveM Tools
-- @License: GNU General Public License v3.0

-- Spawn override
RegisterNetEvent('ft_gamemode:ClReady')
AddEventHandler('ft_gamemode:ClReady', function()

  local player = exports.ft_gamemode:GetPlayerData()

  posX = tonumber(player.posX) or 0
  posY = tonumber(player.posY) or 0
  posZ = tonumber(player.posZ) or 0
  heading = tonumber(player.heading) or 0

  if posX ~= 0 then
    spawnPlayer(posX, posY, posZ, heading, model = Config.defaultModel)
  else
    spawnPlayer(Config.defaultPos.x, Config.defaultPos.y, Config.defaultPos.z, Config.defaultPos.head, model = Config.defaultModel)
  end
  
end)

function spawnPlayer(x, y, z, heading, model)
  Citizen.CreateThread(function()

    exports.spawnmanager:spawnPlayer({x = x, y = y, z = z, heading = heading, model = GetHashKey(model)})
    
  end)
end

Citizen.CreateThread(function()

	while true do
    Citizen.Wait(60000 * Config.sendPos)

    local player = GetPlayerPed(-1)
    local lastPos = GetEntityCoords(player, true)
    local heading = GetEntityHeading(player)
    
    local PosX = lastPos.x
    local PosY = lastPos.y
    local PosZ = lastPos.z
 
    local data = {
      posX = PosX,
      posY = PosY,
      posZ = PosZ,
      heading = heading,
    }
    
    TriggerServerEvent("ft_laspos:pos", data)
	end

end)
