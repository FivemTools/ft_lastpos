-- @Project: FiveM Tools
-- @License: GNU General Public License v3.0

Players = {}

RegisterServerEvent("ft_laspos:pos")
AddEventHandler("ft_laspos:pos", function(data)

  Players[source] = data

end)

-- Event before player leave
AddEventHandler('playerDropped', function()

  TriggerEvent("ft_gamemode:SvSetPlayerData", source, Players[source])
  Players[source] = nil

end)
