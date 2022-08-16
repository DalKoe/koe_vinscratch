----Gets ESX-------------------------------------------------------------------------------------------------------------------------------
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	PlayerLoaded = true
	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	PlayerLoaded = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

AddEventHandler('esx:onPlayerSpawn', function()
    local ped = PlayerPedId()
end)
---------------------------------------------------------------------------------------------------------------------------------------
local colorNames = {
    ['0'] = "Metallic Black",
    ['1'] = "Metallic Graphite Black",
    ['2'] = "Metallic Black Steal",
    ['3'] = "Metallic Dark Silver",
    ['4'] = "Metallic Silver",
    ['5'] = "Metallic Blue Silver",
    ['6'] = "Metallic Steel Gray",
    ['7'] = "Metallic Shadow Silver",
    ['8'] = "Metallic Stone Silver",
    ['9'] = "Metallic Midnight Silver",
    ['10'] = "Metallic Gun Metal",
    ['11'] = "Metallic Anthracite Grey",
    ['12'] = "Matte Black",
    ['13'] = "Matte Gray",
    ['14'] = "Matte Light Grey",
    ['15'] = "Util Black",
    ['16'] = "Util Black Poly",
    ['17'] = "Util Dark silver",
    ['18'] = "Util Silver",
    ['19'] = "Util Gun Metal",
    ['20'] = "Util Shadow Silver",
    ['21'] = "Worn Black",
    ['22'] = "Worn Graphite",
    ['23'] = "Worn Silver Grey",
    ['24'] = "Worn Silver",
    ['25'] = "Worn Blue Silver",
    ['26'] = "Worn Shadow Silver",
    ['27'] = "Metallic Red",
    ['28'] = "Metallic Torino Red",
    ['29'] = "Metallic Formula Red",
    ['30'] = "Metallic Blaze Red",
    ['31'] = "Metallic Graceful Red",
    ['32'] = "Metallic Garnet Red",
    ['33'] = "Metallic Desert Red",
    ['34'] = "Metallic Cabernet Red",
    ['35'] = "Metallic Candy Red",
    ['36'] = "Metallic Sunrise Orange",
    ['37'] = "Metallic Classic Gold",
    ['38'] = "Metallic Orange",
    ['39'] = "Matte Red",
    ['40'] = "Matte Dark Red",
    ['41'] = "Matte Orange",
    ['42'] = "Matte Yellow",
    ['43'] = "Util Red",
    ['44'] = "Util Bright Red",
    ['45'] = "Util Garnet Red",
    ['46'] = "Worn Red",
    ['47'] = "Worn Golden Red",
    ['48'] = "Worn Dark Red",
    ['49'] = "Metallic Dark Green",
    ['50'] = "Metallic Racing Green",
    ['51'] = "Metallic Sea Green",
    ['52'] = "Metallic Olive Green",
    ['53'] = "Metallic Green",
    ['54'] = "Metallic Gasoline Blue Green",
    ['55'] = "Matte Lime Green",
    ['56'] = "Util Dark Green",
    ['57'] = "Util Green",
    ['58'] = "Worn Dark Green",
    ['59'] = "Worn Green",
    ['60'] = "Worn Sea Wash",
    ['61'] = "Metallic Midnight Blue",
    ['62'] = "Metallic Dark Blue",
    ['63'] = "Metallic Saxony Blue",
    ['64'] = "Metallic Blue",
    ['65'] = "Metallic Mariner Blue",
    ['66'] = "Metallic Harbor Blue",
    ['67'] = "Metallic Diamond Blue",
    ['68'] = "Metallic Surf Blue",
    ['69'] = "Metallic Nautical Blue",
    ['70'] = "Metallic Bright Blue",
    ['71'] = "Metallic Purple Blue",
    ['72'] = "Metallic Spinnaker Blue",
    ['73'] = "Metallic Ultra Blue",
    ['74'] = "Metallic Bright Blue",
    ['75'] = "Util Dark Blue",
    ['76'] = "Util Midnight Blue",
    ['77'] = "Util Blue",
    ['78'] = "Util Sea Foam Blue",
    ['79'] = "Uil Lightning blue",
    ['80'] = "Util Maui Blue Poly",
    ['81'] = "Util Bright Blue",
    ['82'] = "Matte Dark Blue",
    ['83'] = "Matte Blue",
    ['84'] = "Matte Midnight Blue",
    ['85'] = "Worn Dark blue",
    ['86'] = "Worn Blue",
    ['87'] = "Worn Light blue",
    ['88'] = "Metallic Taxi Yellow",
    ['89'] = "Metallic Race Yellow",
    ['90'] = "Metallic Bronze",
    ['91'] = "Metallic Yellow Bird",
    ['92'] = "Metallic Lime",
    ['93'] = "Metallic Champagne",
    ['94'] = "Metallic Pueblo Beige",
    ['95'] = "Metallic Dark Ivory",
    ['96'] = "Metallic Choco Brown",
    ['97'] = "Metallic Golden Brown",
    ['98'] = "Metallic Light Brown",
    ['99'] = "Metallic Straw Beige",
    ['100'] = "Metallic Moss Brown",
    ['101'] = "Metallic Biston Brown",
    ['102'] = "Metallic Beechwood",
    ['103'] = "Metallic Dark Beechwood",
    ['104'] = "Metallic Choco Orange",
    ['105'] = "Metallic Beach Sand",
    ['106'] = "Metallic Sun Bleeched Sand",
    ['107'] = "Metallic Cream",
    ['108'] = "Util Brown",
    ['109'] = "Util Medium Brown",
    ['110'] = "Util Light Brown",
    ['111'] = "Metallic White",
    ['112'] = "Metallic Frost White",
    ['113'] = "Worn Honey Beige",
    ['114'] = "Worn Brown",
    ['115'] = "Worn Dark Brown",
    ['116'] = "Worn straw beige",
    ['117'] = "Brushed Steel",
    ['118'] = "Brushed Black steel",
    ['119'] = "Brushed Aluminium",
    ['120'] = "Chrome",
    ['121'] = "Worn Off White",
    ['122'] = "Util Off White",
    ['123'] = "Worn Orange",
    ['124'] = "Worn Light Orange",
    ['125'] = "Metallic Securicor Green",
    ['126'] = "Worn Taxi Yellow",
    ['127'] = "police car blue",
    ['128'] = "Matte Green",
    ['129'] = "Matte Brown",
    ['130'] = "Worn Orange",
    ['131'] = "Matte White",
    ['132'] = "Worn White",
    ['133'] = "Worn Olive Army Green",
    ['134'] = "Pure White",
    ['135'] = "Hot Pink",
    ['136'] = "Salmon pink",
    ['137'] = "Metallic Vermillion Pink",
    ['138'] = "Orange",
    ['139'] = "Green",
    ['140'] = "Blue",
    ['141'] = "Mettalic Black Blue",
    ['142'] = "Metallic Black Purple",
    ['143'] = "Metallic Black Red",
    ['144'] = "hunter green",
    ['145'] = "Metallic Purple",
    ['146'] = "Metaillic V Dark Blue",
    ['147'] = "MODSHOP BLACK1",
    ['148'] = "Matte Purple",
    ['149'] = "Matte Dark Purple",
    ['150'] = "Metallic Lava Red",
    ['151'] = "Matte Forest Green",
    ['152'] = "Matte Olive Drab",
    ['153'] = "Matte Desert Brown",
    ['154'] = "Matte Desert Tan",
    ['155'] = "Matte Foilage Green",
    ['156'] = "DEFAULT ALLOY COLOR",
    ['157'] = "Epsilon Blue",
}

exports.qtarget:AddTargetBone({'windscreen'},{
	options = {
		{
			event = "koe_vinscratch:client:getVehicleInfo",
			icon = "fa-solid fa-car",
			label = "PD: Vin Information",
            job = {['police'] = 1}
		},
	},
	distance = 2
})

RegisterNetEvent('koe_vinscratch:client:getVehicleInfo')
AddEventHandler('koe_vinscratch:client:getVehicleInfo', function()
	local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local targetVehicle = GetClosestVehicle(playerCoords, 7.0, 0 , 70)
    local targetPlate = GetVehicleNumberPlateText(targetVehicle)
    local targetHash = GetEntityModel(targetVehicle)
    local targetDisplayName = GetDisplayNameFromVehicleModel(targetHash)
    local targetModel = GetLabelText(targetDisplayName)
    local primaryColor = GetVehicleColours(targetVehicle)
    primaryColor = colorNames[tostring(primaryColor)]

	lib.registerContext({
		id = 'vinInfo',
		title = 'Vin Information',

		options = {
			{
				title = 'Vehicle Details',
				arrow =  true,
				menu = 'vehInfo',
				icon = 'fas fa-circle-info'
			},
			{
				title = 'Run VIN with DMV',
				arrow =  true,
				event = 'koe_vinscratch:client:vinCheck',
				icon = 'fas fa-magnifying-glass',
				args = {
					plate = targetPlate,
					vehicle = targetVehicle,
					hash = targetHash,
					model = targetModel,
					name = targetDisplayName
				}
			},
		
		},
	})
	lib.showContext('vinInfo')

	lib.registerContext({
		id = 'vehInfo',
		title = 'Vehicle Information',
		menu = 'vinInfo',
		options = {
			{title = 'Info'},
			{
				title = 'Plate: '..targetPlate,
			},
			{
				title = 'Model: '..targetModel,
			},
			{
				title = 'Color: '..primaryColor,
			},
		
		},
	})

end)

RegisterNetEvent('koe_vinscratch:client:vinCheck')
AddEventHandler('koe_vinscratch:client:vinCheck', function(data)
	plate = data.plate
	vehicle = data.vehicle
	hash = data.hash	
	model = data.model
	name = data.name

	if lib.progressBar({
		duration = 1000,
		label = 'Requesting Vin Information',
		useWhileDead = false,
		canCancel = true,
		disable = {
			car = true,
			move = true,
		},
		anim = {
			dict = 'amb@code_human_wander_texting@male@base',
			clip = 'base' 
		},
		prop = {
			model = `prop_phone_cs_frank`,
			pos = vec3(0.03, 0.03, 0.02),
			rot = vec3(0.0, 0.0, 0) 
		},
	}) 	then 
			TriggerServerEvent('koe_jobsystem:server:checkVin', plate, vehicle, hash, model, name)
		else 
			lib.notify({
				title = 'PD Vin',
				description = 'Cancelled.',
				type = 'inform',
				duration = 8000,
				position = 'top'
			})
		end
end)

RegisterNetEvent('koe_vinscratch:client:scratchedInfo')
AddEventHandler('koe_vinscratch:client:scratchedInfo', function(plate, scratched, vehicle, hash, model, name)

	local vehicleInfo = lib.getVehicleProperties(vehicle)

		if scratched ~= nil then
			local status = 'Vin has been scratched'

			lib.registerContext({
				id = 'scratched',
				title = 'DMV Report of '..plate,
				menu = 'vinInfo',
				options = {
					{
						title = 'Vin Status: '..status,
						icon = 'fas fa-x'
					},
					{
						title = 'Sieze Vehicle with plate: '..plate,
						description = 'Transfer Vehicle to PD ownership',
						icon = 'fas fa-user-police',
						arrow = true,
						serverEvent = 'koe_jobsystem:server:seize',
						args = {
							plate = plate,
							vehicle = vehicle,
							vehicleInfo = vehicleInfo,
							hash = hash, 
							model = model,
							name = name
						}
					},
				
				},
			})

			lib.showContext('scratched')
		else
			local status2 = 'Vin comes back clean.'

			lib.registerContext({
				id = 'notScratched',
				title = 'DMV Report of '..plate,
				menu = 'vinInfo',
				options = {
					{
						title = 'Vin Status: '..status2,
						icon = 'fas fa-check'
					},
				
				},
			})

			lib.showContext('notScratched')
		end


end)

RegisterNetEvent('koe_vinscratch:client:deletevehicle')
AddEventHandler('koe_vinscratch:client:deletevehicle', function(vehicle)
	ESX.Game.DeleteVehicle(vehicle)
end)


exports.qtarget:AddBoxZone('seize info', vector3(413.81, -1025.35, 29.5), 1, 1,{
	name="seize info",
	heading=0,
	--debugPoly=true,
	minZ=28.7,
	maxZ=30.1
	},
		{
		options = {
			{
			event = "koe_vinscratch:client:getAllAeizedCars",
			icon = "fa-solid fa-clipboard",
			label = "Open Seized Vehicles Menu",
			job = {['police'] = 1},
			canInteract = function()
				local player = PlayerPedId()
				return IsPedOnFoot(player)
			end,
			},                                     
		},
			distance = 2.5
}) 

RegisterNetEvent('koe_vinscratch:client:getAllAeizedCars')
AddEventHandler('koe_vinscratch:client:getAllAeizedCars', function(vehicle)
	TriggerServerEvent('koe_vinscratch:server:getAllAeizedCars')
end)

RegisterNetEvent('koe_vinscratch:client:listofcars')
AddEventHandler('koe_vinscratch:client:listofcars', function(seizedCars)
	local options = {}
	for k, v in pairs(seizedCars) do
		table.insert(options,
			{
				title = 'Model: '..v.model,
				description = 'Plate: '..v.plate,
				metadata = {'Click to sell vehicle.'},
				event = 'koe_vinscratch:client:sellVehicle',
				args = {
					plate = v.plate,
					props = v.vehicle_props,
					model = v.model,
				}

			}
		)
	end

	lib.registerContext({
		id = 'vehiclelist',
		title = 'Seized Vehicles',
		options = options
	})

	lib.showContext('vehiclelist')
end)

RegisterNetEvent('koe_vinscratch:client:sellVehicle')
AddEventHandler('koe_vinscratch:client:sellVehicle', function(data)

	local enterID = lib.inputDialog('Sell Vehicle', {'ID of buyer', '$ Amount'})
	plate = data.plate
	props = data.props
	model = data.model

	if enterID then
		local enteredID = tonumber(enterID[1])
		local amount = tonumber(enterID[2])
		
		TriggerServerEvent('koe_vinscratch:server:sellCar', enteredID, plate, props, model, amount) 
	end
end)

RegisterNetEvent('koe_vinscratch:client:spawnCar')
AddEventHandler('koe_vinscratch:client:spawnCar', function(plate, props, model)

	ESX.Game.SpawnVehicle(model, Config.SoldCarSpawnLocation, Config.SoldCarSpawnHeading, function(model)
		
		ESX.Game.SetVehicleProperties(model, props)
		SetVehicleNumberPlateText(model, plate)
		TriggerEvent('cd_garage:AddKeys', plate)
		lib.notify({
			title = 'PD',
			description = 'You received keys to the vehicle.',
			type = 'inform',
			duration = 8000,
			position = 'top'
		})
	end)

end)