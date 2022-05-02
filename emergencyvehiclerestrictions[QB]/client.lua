local PlayerData    = {}
QBCore = nil 

local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
	while QBCore == nil do
		TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
		Citizen.Wait(30) 
	end
end)




Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        local ped = GetPlayerPed(-1)
        PlayerData = QBCore.Functions.GetPlayerData()
        
        if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 and GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == PlayerPedId() then
            if PlayerData.job.name ~= 'police' and PlayerData.job.name ~= 'ambulance' and PlayerData.job.name ~= 'mechanic' then
               
                TaskLeaveVehicle(ped,vehicle,0)
                QBCore.Functions.Notify("You are not allowed to drive this vehicle.", "error")
            end
		else
		
			if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 and GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == PlayerPedId() then
				if PlayerData.job.name ~= 'police' and PlayerData.job.name ~= 'ambulance' and PlayerData.job.name ~= 'mechanic' then
					
					TaskLeaveVehicle(ped,vehicle,0)
                    QBCore.Functions.Notify("You are not allowed to drive this vehicle.", "error") 
				end
			end
		end
	end
end)