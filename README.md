# flasher-idcard

### LICENSE
You are more than welcome to change what you want in the script, but you may NOT resell the script or re-upload it.

## Requirements
* [es_extended]
* [jsfour-legitimation](https://github.com/jonassvensson4/jsfour-legitimation)


####
- Script to get an id-card as an item from a desired location. 
- To make the item usable you need to add some code to jsfour-legtimiation. 
- Add ```idcard``` as an item in your database

- Locate to (jsfour-legitimation/client.lua) and add this
```		
RegisterNetEvent('flasher:idkort')
AddEventHandler('flasher:idkort', function(id)
    local player, distance = ESX.Game.GetClosestPlayer()

	TriggerServerEvent('jsfour-legitimation:open', GetPlayerServerId(PlayerId()), GetPlayerServerId())  

    if distance ~= -1 and distance <= 3.0 then
        TriggerServerEvent('jsfour-legitimation:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))                                
    else
        ESX.ShowNotification("No player nearby")
    end
end)
```

- Locate to (jsfour-legitimation/server.lua) and add this

```			
ESX.RegisterUsableItem('idcard', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)
    
    TriggerClientEvent('flasher:idkort', source)
 end)
```

- And this on the very first line in jsfour-legitimation/client.lua

```			
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
		PlayerData = ESX.GetPlayerData()
	end
end)
```


