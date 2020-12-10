ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterNetEvent("flasher-ID-Card:GiveID")
AddEventHandler("flasher-ID-Card:GiveID", function()

	local xPlayer = ESX.GetPlayerFromId(source)
	local price = 500 
	local item = 'idcard'
	local itemCount = xPlayer.getInventoryItem(item).count

	if itemCount == 1 then
		TriggerClientEvent("esx:showNotification", source, "Du har redan ett legitimation på dig!")
	end
	if xPlayer.getMoney() <= price 
	then
		TriggerClientEvent("esx:showNotification", source, "Du har inte råd att hämta ut din legitimaion")
	end

	if itemCount <= 0 then 
		if xPlayer.getMoney() >= price then 
			TriggerClientEvent("esx:showNotification", source, "Du hämtade ut din legitimation och betalade <span style='color:green; font-weight: bold'>500</span> SEK.")
			xPlayer.removeMoney(price)
			xPlayer.addInventoryItem(item, 1)
		end
	end
end)
