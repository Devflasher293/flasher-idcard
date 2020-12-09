ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterNetEvent("flasher-ID-Card:GiveID")
AddEventHandler("flasher-ID-Card:GiveID", function()

	local xPlayer = ESX.GetPlayerFromId(source)
	local price = 100 
	local item = 'idcard'
	local itemCount = xPlayer.getInventoryItem(item).count
		
	if itemCount <= 0 then 
		if xPlayer.getMoney() >= price then 
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Du har tagit emot ditt ID-Kort.', length = 2500, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
			xPlayer.removeMoney(price)
			xPlayer.addInventoryItem(item, 1)
		end
	end
end)