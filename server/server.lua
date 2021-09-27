ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("getcoords", function(source)
   local xPlayer = ESX.GetPlayerFromId(source)
   if (xPlayer ~= nil) then
     print(xPlayer.getCoords(true))    
   end
end)

RegisterNetEvent('esx:busjob_confirmPay')
AddEventHandler('esx:busjob_confirmPay', function(source, routeIndex)
  ConfirmPayment(source, routeIndex)
end)


RegisterCommand("test", function(source)
  ConfirmPayment(source, 1)
 end)

 function ConfirmPayment(source, routeIndex)
  local xPlayer = ESX.GetPlayerFromId(source)

  local identifier = xPlayer.getIdentifier()
  MySQL.Async.fetchAll('select * from users where identifier = @identifier', {['@identifier'] = identifier}, function(result)

    local pay = Config.Price
    
    if Config.PricePerCp == true then
      pay = Config.Price * #Config.BusJob.Routes[routeIndex].CheckPoints
    end
    xPlayer.addMoney(pay)

    TriggerClientEvent('chatMessage', xPlayer.source, _U('completejob', pay))
    
  end)
 end