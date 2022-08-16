----Gets ESX-----
ESX = nil
local ox_inventory = exports.ox_inventory
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
----------------------------------------------------------------

RegisterNetEvent('koe_jobsystem:server:checkVin')
AddEventHandler('koe_jobsystem:server:checkVin', function(plate, vehicle, hash, model, name)
    local src = source
    local identifier =  ESX.GetPlayerFromId(source).identifier
    local scratched

    local check = exports.oxmysql:scalar_async('SELECT vin_scratched FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    })

    if check then scratched = true end


    TriggerClientEvent('koe_vinscratch:client:scratchedInfo', src, plate, scratched, vehicle, hash, model, name) 
end)

RegisterNetEvent('koe_jobsystem:server:seize')
AddEventHandler('koe_jobsystem:server:seize', function(data)
    local src = source
    local seized
    local vehicle = data.vehicle

    local seizedAlready = exports.oxmysql:scalar_async('SELECT plate FROM seized_pd_vehicles WHERE plate = @plate', {
        ['@plate'] = data.plate
    })

    if seizedAlready then seized = true end

    if not seized then
        MySQL.query('DELETE FROM owned_vehicles WHERE plate = @plate ',{ ['@plate'] = data.plate}, function()

        end)

        MySQL.Async.execute('INSERT INTO seized_pd_vehicles (plate, vehicle_props, model) VALUES (@plate, @vehicle_props, @model)', {
            ['@plate'] = data.plate,
            ['@vehicle_props'] = json.encode(data.vehicleInfo),
            ['@model'] = data.name,
        }, function()
        end)
        TriggerClientEvent('koe_vinscratch:client:deletevehicle', src, vehicle)
    else
        TriggerClientEvent('ox_lib:notify', src, {type = 'error', description = 'Already seized', duration = 8000, position = 'top'})
    end

end)

RegisterNetEvent('koe_vinscratch:server:getAllAeizedCars')
AddEventHandler('koe_vinscratch:server:getAllAeizedCars', function()
    local src = source

    MySQL.query('SELECT * FROM seized_pd_vehicles ', function(seizedCars)
        if seizedCars ~= nil then
            TriggerClientEvent('koe_vinscratch:client:listofcars', src, seizedCars)
        else
            TriggerClientEvent('ox_lib:notify', src, {type = 'error', description = 'No vehicles.', duration = 8000, position = 'top'})
        end
    end)
end)

RegisterNetEvent('koe_vinscratch:server:sellCar')
AddEventHandler('koe_vinscratch:server:sellCar', function(enteredID, plate, props, model, amount)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local xTarget = ESX.GetPlayerFromId(enteredID)
    target = enteredID

    if xTarget.getAccount('bank').money >= amount then
        if xTarget.identifier ~= nil then
        
            MySQL.query('DELETE FROM seized_pd_vehicles WHERE plate = @plate ',{ ['@plate'] = plate}, function()

            end)

            MySQL.Async.execute('INSERT INTO owned_vehicles (owner, vehicle, plate, stored, garage_id, in_garage) VALUES (@owner, @vehicle, @plate, @stored, @garage_id, @in_garage)', {
                ['@owner'] = xTarget.identifier,
                ['@vehicle'] = props,
                ['@plate'] = plate,
                ['@stored'] = false,
                ['@garage_type'] = 'car',
                ['@garage_id'] = 'A',
                ['@in_garage'] = '0',
            }, function()
            end)

            TriggerEvent('esx_addonaccount:getSharedAccount', 'police', function(account)
                if account then
                    account.addMoney(amount)
                end
            end)
            xTarget.removeAccountMoney('bank', amount)

            local commission = amount * Config.CommissionPercent

            xPlayer.addMoney(commission)
            TriggerClientEvent('koe_vinscratch:client:spawnCar',target, plate, props, model)
        end  
    else
        TriggerClientEvent('ox_lib:notify', src, {type = 'error', description = 'They dont have enough money', duration = 8000, position = 'top'})
    end
end)
