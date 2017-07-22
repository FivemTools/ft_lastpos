-- @Project: FiveM Tools
-- @License: GNU General Public License v3.0

-- Spawn override
RegisterNetEvent('ft_gamemode:ClReady')
AddEventHandler('ft_gamemode:ClReady', function()

  local player = exports.ft_gamemode:GetPlayerData()

  posX = player.posX or 0
  posY = player.posY or 0
  posZ = player.posZ or 0
  heading = player.heading or 0

  exports.spawnmanager:spawnPlayer({x = posX, y = posY, z = posZ, heading = heading, model = GetHashKey(Config.defaultModel)})
  print("send")

end)

--
Citizen.CreateThread(function ()

	while true do
    Citizen.Wait(60000 * Config.sendPos)

    local player = GetPlayerPed(-1)
    local lastPos = GetEntityCoords(player, true)
    local heading = GetEntityHeading(player)
    local data = {
      posX = lastPos.x,
      posY = lastPos.y,
      posZ = LastPos.z,
      heading = heading,
    }

    TriggerServerEvent("ft_laspos:pos", data)
	end

end)
