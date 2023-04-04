local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local timedown = 0
vRP = Proxy.getInterface("vRP")

oC = Tunnel.getInterface("oc_producao-arma")
Produse = Tunnel.getInterface("oc_producao-arma")
-------------------------------------------------------------------------------------------------
--[ LOCAL ]--------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
local prodMachine = {
	{ ['x'] = 1387.33, ['y'] = 3194.06, ['z'] = 46.02, ['h'] = 14.53 }
}
-------------------------------------------------------------------------------------------------
--[ MENU ]---------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
local menuactive = false
local onmenu = false

function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		TransitionToBlurred(1000)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		TransitionFromBlurred(1000)
		SendNUIMessage({ hidemenu = true })
	end
end
-------------------------------------------------------------------------------------------------
--[ BOTÕES ]-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	if data == "produzir-fiveseven" then
		Produse.checkPayment('fiveseven')
		ToggleActionMenu()
		timedown = 10

	elseif data == "produzir-glock" then
		Produse.checkPayment('glock')
		ToggleActionMenu()
		timedown = 10

	elseif data == "produzir-m1911" then
		Produse.checkPayment('m1911')
		ToggleActionMenu()
		timedown = 10

	elseif data == "produzir-magnum44" then
		Produse.checkPayment('magnum44')
		ToggleActionMenu()
		timedown = 10

	elseif data == "produzir-magnum357" then
		Produse.checkPayment('magnum357')
		ToggleActionMenu()
		timedown = 10

	elseif data == "produzir-remington" then
		Produse.checkPayment('remington')
		ToggleActionMenu()
		timedown = 10

	elseif data == "produzir-shotgun" then
		Produse.checkPayment('shotgun')
		ToggleActionMenu()
		timedown = 10

	elseif data == "produzir-ak47" then
		Produse.checkPayment('ak47')
		ToggleActionMenu()
		timedown = 10

	elseif data == "produzir-ak103" then
		Produse.checkPayment('ak103')
		ToggleActionMenu()
		timedown = 10

	elseif data == "produzir-aks" then
		Produse.checkPayment('aks')
		ToggleActionMenu()
		timedown = 10

	elseif data == "produzir-m4a1" then
		Produse.checkPayment('m4a1')
		ToggleActionMenu()
		timedown = 10

	elseif data == "produzir-mp5" then
		Produse.checkPayment('mp5')
		ToggleActionMenu()
		timedown = 10

	elseif data == "produzir-mpx" then
		Produse.checkPayment('mpx')
		ToggleActionMenu()
		timedown = 10

	elseif data == "produzir-mtar21" then
		Produse.checkPayment('mtar21')
		ToggleActionMenu()
		timedown = 10

	elseif data == "produzir-parafall" then
		Produse.checkPayment('parafall')
		ToggleActionMenu()
		timedown = 10

	elseif data == "produzir-sigsauer" then
		Produse.checkPayment('sigsauer')
		ToggleActionMenu()
		timedown = 10

	elseif data == "produzir-thompson" then
		Produse.checkPayment('thompson')
		ToggleActionMenu()
		timedown = 10

	elseif data == "produzir-tec9" then
		Produse.checkPayment('tec9')
		ToggleActionMenu()
		timedown = 10

	elseif data == "produzir-uzi" then
		Produse.checkPayment('uzi')
		ToggleActionMenu()
		timedown = 10

	elseif data == "fechar" then
		ToggleActionMenu()
		onmenu = false
	end
end)

-------------------------------------------------------------------------------------------------
--[ AÇÃO ]---------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local tracarcc = 1000

		for k,v in pairs(prodMachine) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,v.z,x,y,z,true)
			local prodMachine = prodMachine[k]
			local idBancada = prodMachine[id]

			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), prodMachine.x, prodMachine.y, prodMachine.z, true ) <= 1 and not onmenu then
				DrawText3D(prodMachine.x, prodMachine.y, prodMachine.z, "[~r~E~w~] Para acessar a ~r~BANCADA~w~ de Armamento.")
			end
			if distance <= 7 then
				tracarcc = 5
				DrawMarker(23, prodMachine.x, prodMachine.y, prodMachine.z-0.97,0,0,0,0,0,0,0.7,0.7,0.5,214,29,0,100,0,0,0,0)
				if distance <= 1.2 then
					if IsControlJustPressed(0,38) and oC.checkPermissao() then
						ToggleActionMenu()
						onmenu = true
					end
				end
			end
		end
		Citizen.Wait(tracarcc)
	end
end)


RegisterNetEvent("fechar-nui-arma")
AddEventHandler("fechar-nui-arma", function()
	--ToggleActionMenu()
	onmenu = false

	local ped = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(ped))
	local bowz,cdz = GetGroundZFor_3dCoord(prodMachine.x, prodMachine.y, prodMachine.z)
	local distance = GetDistanceBetweenCoords(prodMachine.x, prodMachine.y, prodMachine.z, x, y, z, true)

	if distance < 1.2 then
		TriggerEvent("arma:posicao1")	
	end
end)

RegisterNetEvent("arma:posicao1")
AddEventHandler("arma:posicao1", function()
	local ped = PlayerPedId()
	SetEntityHeading(ped, prodMachine.h)
	SetEntityCoords(ped, prodMachine.x, prodMachine.y, prodMachine.z, false, false, false, false)
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMEDOWN
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		local ped = PlayerPedId()
		if timedown > 0 and GetEntityHealth(ped) > 101 then
			timedown = timedown - 1
			if timedown <= 1 then
				TriggerServerEvent("vrp_inventory:Cancel")
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		local TimeDistance = 500
		if timedown > 0 then
			TimeDistance = 4
			DisableControlAction(0,38,true)
		end
		Citizen.Wait(TimeDistance)
	end
end)
-------------------------------------------------------------------------------------------------
--[ FUNÇÃO ]-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.28, 0.28)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.005+ factor, 0.03, 41, 11, 41, 68)
end