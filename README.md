# Koe_VinScratch:
To be combined with rahe-boosting, this is a way for police to check if a car is vin scratched or not. They can seize the vehicle and even sell it!

# Join the Discord!

[![Koe Scripts Discord](https://media.discordapp.net/attachments/973750342263144558/1003740741178249318/invite.png?width=810&height=216)](https://discord.gg/5JuxDnNm94)

# Features:
* Vin scratch check for any owned vehicle.
* Seize of the vehicle removing it from the player
* Menu at pd to see list of all seized vehicles
* Sell the vehicles to players

# Dependencies:
* [qTarget](https://github.com/overextended/qtarget)
* [ox_lib](https://github.com/overextended/ox_lib)
* [Rahe-Boosting](https://forum.cfx.re/t/paid-rahe-boosting-system-esx-qb-custom/4858796)

#Instructions
First replace the vin scratch function in rage-boosting/api/server.lua line 114 with the following
`AddEventHandler('rahe-boosting:server:vinScratchSuccessful', function(playerId, vehicleModel, vehicleModelName, licensePlate, vehicleProperties)
	local owner = ESX.GetPlayerFromId(playerId)

	MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, garage_type, garage_id, in_garage, type, vin_scratched) VALUES (@owner, @plate, @vehicle, @garage_type, @garage_id, @in_garage, @type, @vin_scratched)',
	{
		['@owner']   = owner.identifier,
		['@plate']   = licensePlate,
		['@vehicle'] = json.encode(vehicleProperties),
        ['@garage_type'] = 'car',
        ['@garage_id'] = 'Alta',
        ['@in_garage'] = '1',
        ['@type'] = 'car',
        ['@vin_scratched'] = '1',
	}, function (rowsChanged)

	end)

end)
`

Import SQL
Put in resources
add start koe_vinscratch to server.cfg

# Video Preview:
n/a

# Download link:
https://github.com/DalKoe/koe_vinscratch

# Created By:
DalKoe
