-- @Project: FiveM Tools
-- @License: GNU General Public License v3.0
require "resources/mysql-async/lib/MySQL"

Players = {}

RegisterServerEvent("ft_laspos:pos")
AddEventHandler("ft_laspos:pos", function(data)

  Players[source] = data

end)

-- Event before player leave
AddEventHandler('playerDropped', function()

  if Players[source] ~= nil then
  
    local steamId = GetPlayerIdentifiers(source)[1]
    -- TriggerEvent("ft_gamemode:SvSetPlayerData", source, Players[source])
    MySQL.Async.execute("UPDATE players SET `posX`=@value1, `posY`=@value2, `posZ`=@value3, `heading`=@value4 WHERE steamId = @steamId", {['@steamid'] = steamId, ['@value1'] = Players[source].posX, ['@value2'] = Players[source].posY, ['@value3'] = Players[source].posZ, ['@value4'] = Players[source].heading})
    Players[source] = nil

  end

end)

