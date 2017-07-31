-- @Project: FiveM Tools
-- @License: GNU General Public License v3.0

-- Spawn override
RegisterNetEvent('ft_gamemode:ClReady')
AddEventHandler('ft_gamemode:ClReady', function()

  local player = exports.ft_gamemode:GetPlayerData()
	
  posX = tonumber(player.posX)
  posY = tonumber(player.posY)
  posZ = tonumber(player.posZ)
  heading = tonumber(player.heading)
  genre = player.genre
	
	if genre == "h" then
		model = Config.defaultModelH
	else
		model = Config.defaultModelF
	end

  if posX ~= 0 then
    spawnPlayer(posX, posY, posZ, heading, model)
  else
	posX = Config.firstSpawn.x
	posY = Config.firstSpawn.y
	posZ = Config.firstSpawn.z
	heading = Config.firstSpawn.head
  
    spawnPlayer(posX, posY, posZ, heading, model)
  end
  
end)

function spawnPlayer(posX, posY, posZ, heading, model)
  Citizen.CreateThread(function()
  
    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(0)
    end
    SetPlayerModel(PlayerId(), model)
    SetModelAsNoLongerNeeded(model)
    SetPedDefaultComponentVariation(GetPlayerPed(-1))
    SetPedComponentVariation(GetPlayerPed(-1), 2, 0, 0, 0)
	
    exports.spawnmanager:spawnPlayer({x = posX, y = posY, z = posZ, heading = heading})
    
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
