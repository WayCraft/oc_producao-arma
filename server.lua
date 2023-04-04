local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
oC = {}
Tunnel.bindInterface("oc_producao-arma",oC)
Produse = {}
Tunnel.bindInterface("oc_producao-arma",Produse)

local logsProducao = "https://discord.com/api/webhooks/1062346043427147829/ztyBo_vzk6kJQlTr-lRuuczWjmjzWCcrP_UYs6uUJepHB7j7rSZNBGhyQw0KErenToq8"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
--[ ARRAY ]------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local camufladoss = {
	{ item = "fiveseven", name = "FIVE SEVEN"},
	{ item = "glock", name = "GLOCK"},
	{ item = "m1911", name = "M 1911"},
    { item = "magnum44", name = "MAGNUM 44"},
    { item = "magnum357", name = "MAGNUM 357"},
	{ item = "remington", name = "REMINGTON"},
	{ item = "shotgun", name = "SHOTGUN"},
    { item = "ak47", name = "AK 47"},
    { item = "ak103", name = "AK 103"},
    { item = "aks", name = "AKS"},
    { item = "m4a1", name = "M4A1"},
    { item = "mp5", name = "MP5"},
    { item = "mpx", name = "MPX"},
    { item = "mtar21", name = "MTAR 21"},
    { item = "parafall", name = "PARAFALL"},
    { item = "sigsauer", name = "SIGSAUER"},
    { item = "thompson", name = "THOMPSON"},
    { item = "tec9", name = "TEC9"},
    { item = "uzi", name = "UZI"},
}
-----------------------------------------------------------------------------------------------------------------------------------
--[ EVENTOS ]----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
--RegisterServerEvent("produzir-arma")
--AddEventHandler("produzir-arma",function(item)
function Produse.checkPayment(item)
	local source = source
	local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(parseInt(user_id))
	if user_id then
		for k,v in pairs(camufladoss) do
			if item == v.item then


				if item == "fiveseven" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item) <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"pecasarma") >= 80 or vRP.hasPermission(user_id,"programador.permissao") then
                            if vRP.getInventoryItemAmount(user_id,"plastico") >= 15 or vRP.hasPermission(user_id,"programador.permissao") then
                                if vRP.getInventoryItemAmount(user_id,"fitaisolante") >= 15 or vRP.hasPermission(user_id,"programador.permissao") then

                                    if vRP.tryGetInventoryItem(user_id,"pecasarma",80) and
                                        vRP.tryGetInventoryItem(user_id,"plastico",15) and
                                            vRP.tryGetInventoryItem(user_id,"fitaisolante",15) or vRP.hasPermission(user_id,"programador.permissao") then

                                        TriggerClientEvent("fechar-nui-arma",source)

                                        TriggerClientEvent("Prog",source,10000,"Fabricando "..v.name.."")
                                        vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                        SetTimeout(10000,function()
                                            vRPclient._stopAnim(source,false)
                                            vRP.giveInventoryItem(user_id,v.item,1)
                                            TriggerClientEvent("Notify",source,"sucesso","Você montou uma <b>"..v.name.."</b>.")
                                        end)
SendWebhookMessage(logsProducao,"```prolog\n[Identidade]: ["..user_id.."] "..identity.name.." "..identity.firstname.."\n[Fabricou]: "..v.name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Fita Isolante</b> suficiente na mochila.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Plástico</b> suficiente na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Peças de Arma</b> suficiente na mochila.")
                        end
					else
						TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end

                elseif item == "glock" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item) <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"pecasarma") >= 100 or vRP.hasPermission(user_id,"programador.permissao") then
                            if vRP.getInventoryItemAmount(user_id,"plastico") >= 25 or vRP.hasPermission(user_id,"programador.permissao") then
                                if vRP.getInventoryItemAmount(user_id,"fitaisolante") >= 25 or vRP.hasPermission(user_id,"programador.permissao") then

                                    if vRP.tryGetInventoryItem(user_id,"pecasarma",100) and
                                        vRP.tryGetInventoryItem(user_id,"plastico",25) and
                                            vRP.tryGetInventoryItem(user_id,"fitaisolante",25) or vRP.hasPermission(user_id,"programador.permissao") then

                                        TriggerClientEvent("fechar-nui-arma",source)

                                        TriggerClientEvent("Prog",source,10000,"Fabricando "..v.name.."")
                                        vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                        SetTimeout(10000,function()
                                            vRPclient._stopAnim(source,false)
                                            vRP.giveInventoryItem(user_id,v.item,1)
                                            TriggerClientEvent("Notify",source,"sucesso","Você montou uma <b>"..v.name.."</b>.")
                                        end)
SendWebhookMessage(logsProducao,"```prolog\n[Identidade]: ["..user_id.."] "..identity.name.." "..identity.firstname.."\n[Fabricou]: "..v.name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Fita Isolante</b> suficiente na mochila.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Plástico</b> suficiente na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Peças de Arma</b> suficiente na mochila.")
                        end
					else
						TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end

                elseif item == "m1911" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item) <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"pecasarma") >= 70 or vRP.hasPermission(user_id,"programador.permissao") then
                            if vRP.getInventoryItemAmount(user_id,"plastico") >= 13 or vRP.hasPermission(user_id,"programador.permissao") then
                                if vRP.getInventoryItemAmount(user_id,"fitaisolante") >= 13 or vRP.hasPermission(user_id,"programador.permissao") then

                                    if vRP.tryGetInventoryItem(user_id,"pecasarma",70) and
                                        vRP.tryGetInventoryItem(user_id,"plastico",73) and
                                            vRP.tryGetInventoryItem(user_id,"fitaisolante",73) or vRP.hasPermission(user_id,"programador.permissao") then

                                        TriggerClientEvent("fechar-nui-arma",source)

                                        TriggerClientEvent("Prog",source,10000,"Fabricando "..v.name.."")
                                        vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                        SetTimeout(10000,function()
                                            vRPclient._stopAnim(source,false)
                                            vRP.giveInventoryItem(user_id,v.item,1)
                                            TriggerClientEvent("Notify",source,"sucesso","Você montou uma <b>"..v.name.."</b>.")
                                        end)
SendWebhookMessage(logsProducao,"```prolog\n[Identidade]: ["..user_id.."] "..identity.name.." "..identity.firstname.."\n[Fabricou]: "..v.name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Fita Isolante</b> suficiente na mochila.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Plástico</b> suficiente na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Peças de Arma</b> suficiente na mochila.")
                        end
					else
						TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end

                elseif item == "magnum44" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item) <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"pecasarma") >= 150 or vRP.hasPermission(user_id,"programador.permissao") then
                            if vRP.getInventoryItemAmount(user_id,"plastico") >= 30 or vRP.hasPermission(user_id,"programador.permissao") then
                                if vRP.getInventoryItemAmount(user_id,"fitaisolante") >= 30 or vRP.hasPermission(user_id,"programador.permissao") then

                                    if vRP.tryGetInventoryItem(user_id,"pecasarma",150) and
                                        vRP.tryGetInventoryItem(user_id,"plastico",30) and
                                            vRP.tryGetInventoryItem(user_id,"fitaisolante",30) or vRP.hasPermission(user_id,"programador.permissao") then

                                        TriggerClientEvent("fechar-nui-arma",source)

                                        TriggerClientEvent("Prog",source,10000,"Fabricando "..v.name.."")
                                        vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                        SetTimeout(10000,function()
                                            vRPclient._stopAnim(source,false)
                                            vRP.giveInventoryItem(user_id,v.item,1)
                                            TriggerClientEvent("Notify",source,"sucesso","Você montou uma <b>"..v.name.."</b>.")
                                        end)
SendWebhookMessage(logsProducao,"```prolog\n[Identidade]: ["..user_id.."] "..identity.name.." "..identity.firstname.."\n[Fabricou]: "..v.name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Fita Isolante</b> suficiente na mochila.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Plástico</b> suficiente na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Peças de Arma</b> suficiente na mochila.")
                        end
					else
						TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end

                elseif item == "magnum357" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item) <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"pecasarma") >= 150 or vRP.hasPermission(user_id,"programador.permissao") then
                            if vRP.getInventoryItemAmount(user_id,"plastico") >= 30 or vRP.hasPermission(user_id,"programador.permissao") then
                                if vRP.getInventoryItemAmount(user_id,"fitaisolante") >= 30 or vRP.hasPermission(user_id,"programador.permissao") then

                                    if vRP.tryGetInventoryItem(user_id,"pecasarma",150) and
                                        vRP.tryGetInventoryItem(user_id,"plastico",30) and
                                            vRP.tryGetInventoryItem(user_id,"fitaisolante",30) or vRP.hasPermission(user_id,"programador.permissao") then

                                        TriggerClientEvent("fechar-nui-arma",source)

                                        TriggerClientEvent("Prog",source,10000,"Fabricando "..v.name.."")
                                        vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                        SetTimeout(10000,function()
                                            vRPclient._stopAnim(source,false)
                                            vRP.giveInventoryItem(user_id,v.item,1)
                                            TriggerClientEvent("Notify",source,"sucesso","Você montou uma <b>"..v.name.."</b>.")
                                        end)
SendWebhookMessage(logsProducao,"```prolog\n[Identidade]: ["..user_id.."] "..identity.name.." "..identity.firstname.."\n[Fabricou]: "..v.name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Fita Isolante</b> suficiente na mochila.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Plástico</b> suficiente na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Peças de Arma</b> suficiente na mochila.")
                        end
					else
						TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end

                elseif item == "remington" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item) <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"pecasarma") >= 300 or vRP.hasPermission(user_id,"programador.permissao") then
                            if vRP.getInventoryItemAmount(user_id,"plastico") >= 170 or vRP.hasPermission(user_id,"programador.permissao") then
                                if vRP.getInventoryItemAmount(user_id,"fitaisolante") >= 170 or vRP.hasPermission(user_id,"programador.permissao") then

                                    if vRP.tryGetInventoryItem(user_id,"pecasarma",300) and
                                        vRP.tryGetInventoryItem(user_id,"plastico",170) and
                                            vRP.tryGetInventoryItem(user_id,"fitaisolante",170) or vRP.hasPermission(user_id,"programador.permissao") then

                                        TriggerClientEvent("fechar-nui-arma",source)

                                        TriggerClientEvent("Prog",source,10000,"Fabricando "..v.name.."")
                                        vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                        SetTimeout(10000,function()
                                            vRPclient._stopAnim(source,false)
                                            vRP.giveInventoryItem(user_id,v.item,1)
                                            TriggerClientEvent("Notify",source,"sucesso","Você montou uma <b>"..v.name.."</b>.")
                                        end)
SendWebhookMessage(logsProducao,"```prolog\n[Identidade]: ["..user_id.."] "..identity.name.." "..identity.firstname.."\n[Fabricou]: "..v.name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Fita Isolante</b> suficiente na mochila.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Plástico</b> suficiente na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Peças de Arma</b> suficiente na mochila.")
                        end
					else
						TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end

                elseif item == "shotgun" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item) <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"pecasarma") >= 330 or vRP.hasPermission(user_id,"programador.permissao") then
                            if vRP.getInventoryItemAmount(user_id,"plastico") >= 190 or vRP.hasPermission(user_id,"programador.permissao") then
                                if vRP.getInventoryItemAmount(user_id,"fitaisolante") >= 190 or vRP.hasPermission(user_id,"programador.permissao") then

                                    if vRP.tryGetInventoryItem(user_id,"pecasarma",330) and
                                        vRP.tryGetInventoryItem(user_id,"plastico",190) and
                                            vRP.tryGetInventoryItem(user_id,"fitaisolante",190) or vRP.hasPermission(user_id,"programador.permissao") then

                                        TriggerClientEvent("fechar-nui-arma",source)

                                        TriggerClientEvent("Prog",source,10000,"Fabricando "..v.name.."")
                                        vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                        SetTimeout(10000,function()
                                            vRPclient._stopAnim(source,false)
                                            vRP.giveInventoryItem(user_id,v.item,1)
                                            TriggerClientEvent("Notify",source,"sucesso","Você montou uma <b>"..v.name.."</b>.")
                                        end)
SendWebhookMessage(logsProducao,"```prolog\n[Identidade]: ["..user_id.."] "..identity.name.." "..identity.firstname.."\n[Fabricou]: "..v.name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Fita Isolante</b> suficiente na mochila.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Plástico</b> suficiente na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Peças de Arma</b> suficiente na mochila.")
                        end
					else
						TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end

                elseif item == "ak47" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item) <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"pecasarma") >= 760 or vRP.hasPermission(user_id,"programador.permissao") then
                            if vRP.getInventoryItemAmount(user_id,"plastico") >= 430 or vRP.hasPermission(user_id,"programador.permissao") then
                                if vRP.getInventoryItemAmount(user_id,"fitaisolante") >= 430 or vRP.hasPermission(user_id,"programador.permissao") then

                                    if vRP.tryGetInventoryItem(user_id,"pecasarma",760) and
                                        vRP.tryGetInventoryItem(user_id,"plastico",430) and
                                            vRP.tryGetInventoryItem(user_id,"fitaisolante",430) or vRP.hasPermission(user_id,"programador.permissao") then

                                        TriggerClientEvent("fechar-nui-arma",source)

                                        TriggerClientEvent("Prog",source,10000,"Fabricando "..v.name.."")
                                        vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                        SetTimeout(10000,function()
                                            vRPclient._stopAnim(source,false)
                                            vRP.giveInventoryItem(user_id,v.item,1)
                                            TriggerClientEvent("Notify",source,"sucesso","Você montou uma <b>"..v.name.."</b>.")
                                        end)
SendWebhookMessage(logsProducao,"```prolog\n[Identidade]: ["..user_id.."] "..identity.name.." "..identity.firstname.."\n[Fabricou]: "..v.name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Fita Isolante</b> suficiente na mochila.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Plástico</b> suficiente na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Peças de Arma</b> suficiente na mochila.")
                        end
					else
						TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end

                elseif item == "ak103" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item) <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"pecasarma") >= 680 or vRP.hasPermission(user_id,"programador.permissao") then
                            if vRP.getInventoryItemAmount(user_id,"plastico") >= 380 or vRP.hasPermission(user_id,"programador.permissao") then
                                if vRP.getInventoryItemAmount(user_id,"fitaisolante") >= 380 or vRP.hasPermission(user_id,"programador.permissao") then

                                    if vRP.tryGetInventoryItem(user_id,"pecasarma",680) and
                                        vRP.tryGetInventoryItem(user_id,"plastico",380) and
                                            vRP.tryGetInventoryItem(user_id,"fitaisolante",380) or vRP.hasPermission(user_id,"programador.permissao") then

                                        TriggerClientEvent("fechar-nui-arma",source)

                                        TriggerClientEvent("Prog",source,10000,"Fabricando "..v.name.."")
                                        vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                        SetTimeout(10000,function()
                                            vRPclient._stopAnim(source,false)
                                            vRP.giveInventoryItem(user_id,v.item,1)
                                            TriggerClientEvent("Notify",source,"sucesso","Você montou uma <b>"..v.name.."</b>.")
                                        end)
SendWebhookMessage(logsProducao,"```prolog\n[Identidade]: ["..user_id.."] "..identity.name.." "..identity.firstname.."\n[Fabricou]: "..v.name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Fita Isolante</b> suficiente na mochila.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Plástico</b> suficiente na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Peças de Arma</b> suficiente na mochila.")
                        end
					else
						TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end

                elseif item == "aks" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item) <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"pecasarma") >= 600 or vRP.hasPermission(user_id,"programador.permissao") then
                            if vRP.getInventoryItemAmount(user_id,"plastico") >= 300 or vRP.hasPermission(user_id,"programador.permissao") then
                                if vRP.getInventoryItemAmount(user_id,"fitaisolante") >= 300 or vRP.hasPermission(user_id,"programador.permissao") then

                                    if vRP.tryGetInventoryItem(user_id,"pecasarma",600) and
                                        vRP.tryGetInventoryItem(user_id,"plastico",300) and
                                            vRP.tryGetInventoryItem(user_id,"fitaisolante",300) or vRP.hasPermission(user_id,"programador.permissao") then

                                        TriggerClientEvent("fechar-nui-arma",source)

                                        TriggerClientEvent("Prog",source,10000,"Fabricando "..v.name.."")
                                        vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                        SetTimeout(10000,function()
                                            vRPclient._stopAnim(source,false)
                                            vRP.giveInventoryItem(user_id,v.item,1)
                                            TriggerClientEvent("Notify",source,"sucesso","Você montou uma <b>"..v.name.."</b>.")
                                        end)
SendWebhookMessage(logsProducao,"```prolog\n[Identidade]: ["..user_id.."] "..identity.name.." "..identity.firstname.."\n[Fabricou]: "..v.name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Fita Isolante</b> suficiente na mochila.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Plástico</b> suficiente na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Peças de Arma</b> suficiente na mochila.")
                        end
					else
						TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end

                elseif item == "m4a1" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item) <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"pecasarma") >= 720 or vRP.hasPermission(user_id,"programador.permissao") then
                            if vRP.getInventoryItemAmount(user_id,"plastico") >= 400 or vRP.hasPermission(user_id,"programador.permissao") then
                                if vRP.getInventoryItemAmount(user_id,"fitaisolante") >= 400 or vRP.hasPermission(user_id,"programador.permissao") then

                                    if vRP.tryGetInventoryItem(user_id,"pecasarma",720) and
                                        vRP.tryGetInventoryItem(user_id,"plastico",400) and
                                            vRP.tryGetInventoryItem(user_id,"fitaisolante",400) or vRP.hasPermission(user_id,"programador.permissao") then

                                        TriggerClientEvent("fechar-nui-arma",source)

                                        TriggerClientEvent("Prog",source,10000,"Fabricando "..v.name.."")
                                        vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                        SetTimeout(10000,function()
                                            vRPclient._stopAnim(source,false)
                                            vRP.giveInventoryItem(user_id,v.item,1)
                                            TriggerClientEvent("Notify",source,"sucesso","Você montou uma <b>"..v.name.."</b>.")
                                        end)
SendWebhookMessage(logsProducao,"```prolog\n[Identidade]: ["..user_id.."] "..identity.name.." "..identity.firstname.."\n[Fabricou]: "..v.name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Fita Isolante</b> suficiente na mochila.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Plástico</b> suficiente na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Peças de Arma</b> suficiente na mochila.")
                        end
					else
						TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end

                elseif item == "mp5" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item) <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"pecasarma") >= 620 or vRP.hasPermission(user_id,"programador.permissao") then
                            if vRP.getInventoryItemAmount(user_id,"plastico") >= 390 or vRP.hasPermission(user_id,"programador.permissao") then
                                if vRP.getInventoryItemAmount(user_id,"fitaisolante") >= 390 or vRP.hasPermission(user_id,"programador.permissao") then

                                    if vRP.tryGetInventoryItem(user_id,"pecasarma",620) and
                                        vRP.tryGetInventoryItem(user_id,"plastico",390) and
                                            vRP.tryGetInventoryItem(user_id,"fitaisolante",390) or vRP.hasPermission(user_id,"programador.permissao") then

                                        TriggerClientEvent("fechar-nui-arma",source)

                                        TriggerClientEvent("Prog",source,10000,"Fabricando "..v.name.."")
                                        vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                        SetTimeout(10000,function()
                                            vRPclient._stopAnim(source,false)
                                            vRP.giveInventoryItem(user_id,v.item,1)
                                            TriggerClientEvent("Notify",source,"sucesso","Você montou uma <b>"..v.name.."</b>.")
                                        end)
SendWebhookMessage(logsProducao,"```prolog\n[Identidade]: ["..user_id.."] "..identity.name.." "..identity.firstname.."\n[Fabricou]: "..v.name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Fita Isolante</b> suficiente na mochila.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Plástico</b> suficiente na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Peças de Arma</b> suficiente na mochila.")
                        end
					else
						TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end

                elseif item == "mpx" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item) <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"pecasarma") >= 595 or vRP.hasPermission(user_id,"programador.permissao") then
                            if vRP.getInventoryItemAmount(user_id,"plastico") >= 365 or vRP.hasPermission(user_id,"programador.permissao") then
                                if vRP.getInventoryItemAmount(user_id,"fitaisolante") >= 365 or vRP.hasPermission(user_id,"programador.permissao") then

                                    if vRP.tryGetInventoryItem(user_id,"pecasarma",595) and
                                        vRP.tryGetInventoryItem(user_id,"plastico",365) and
                                            vRP.tryGetInventoryItem(user_id,"fitaisolante",365) or vRP.hasPermission(user_id,"programador.permissao") then

                                        TriggerClientEvent("fechar-nui-arma",source)

                                        TriggerClientEvent("Prog",source,10000,"Fabricando "..v.name.."")
                                        vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                        SetTimeout(10000,function()
                                            vRPclient._stopAnim(source,false)
                                            vRP.giveInventoryItem(user_id,v.item,1)
                                            TriggerClientEvent("Notify",source,"sucesso","Você montou uma <b>"..v.name.."</b>.")
                                        end)
SendWebhookMessage(logsProducao,"```prolog\n[Identidade]: ["..user_id.."] "..identity.name.." "..identity.firstname.."\n[Fabricou]: "..v.name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Fita Isolante</b> suficiente na mochila.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Plástico</b> suficiente na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Peças de Arma</b> suficiente na mochila.")
                        end
					else
						TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end

                elseif item == "mtar21" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item) <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"pecasarma") >= 705 or vRP.hasPermission(user_id,"programador.permissao") then
                            if vRP.getInventoryItemAmount(user_id,"plastico") >= 405 or vRP.hasPermission(user_id,"programador.permissao") then
                                if vRP.getInventoryItemAmount(user_id,"fitaisolante") >= 405 or vRP.hasPermission(user_id,"programador.permissao") then

                                    if vRP.tryGetInventoryItem(user_id,"pecasarma",705) and
                                        vRP.tryGetInventoryItem(user_id,"plastico",405) and
                                            vRP.tryGetInventoryItem(user_id,"fitaisolante",405) or vRP.hasPermission(user_id,"programador.permissao") then

                                        TriggerClientEvent("fechar-nui-arma",source)

                                        TriggerClientEvent("Prog",source,10000,"Fabricando "..v.name.."")
                                        vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                        SetTimeout(10000,function()
                                            vRPclient._stopAnim(source,false)
                                            vRP.giveInventoryItem(user_id,v.item,1)
                                            TriggerClientEvent("Notify",source,"sucesso","Você montou uma <b>"..v.name.."</b>.")
                                        end)
SendWebhookMessage(logsProducao,"```prolog\n[Identidade]: ["..user_id.."] "..identity.name.." "..identity.firstname.."\n[Fabricou]: "..v.name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Fita Isolante</b> suficiente na mochila.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Plástico</b> suficiente na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Peças de Arma</b> suficiente na mochila.")
                        end
					else
						TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end

                elseif item == "parafall" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item) <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"pecasarma") >= 720 or vRP.hasPermission(user_id,"programador.permissao") then
                            if vRP.getInventoryItemAmount(user_id,"plastico") >= 410 or vRP.hasPermission(user_id,"programador.permissao") then
                                if vRP.getInventoryItemAmount(user_id,"fitaisolante") >= 410 or vRP.hasPermission(user_id,"programador.permissao") then

                                    if vRP.tryGetInventoryItem(user_id,"pecasarma",720) and
                                        vRP.tryGetInventoryItem(user_id,"plastico",410) and
                                            vRP.tryGetInventoryItem(user_id,"fitaisolante",410) or vRP.hasPermission(user_id,"programador.permissao") then

                                        TriggerClientEvent("fechar-nui-arma",source)

                                        TriggerClientEvent("Prog",source,10000,"Fabricando "..v.name.."")
                                        vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                        SetTimeout(10000,function()
                                            vRPclient._stopAnim(source,false)
                                            vRP.giveInventoryItem(user_id,v.item,1)
                                            TriggerClientEvent("Notify",source,"sucesso","Você montou uma <b>"..v.name.."</b>.")
                                        end)
SendWebhookMessage(logsProducao,"```prolog\n[Identidade]: ["..user_id.."] "..identity.name.." "..identity.firstname.."\n[Fabricou]: "..v.name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Fita Isolante</b> suficiente na mochila.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Plástico</b> suficiente na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Peças de Arma</b> suficiente na mochila.")
                        end
					else
						TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end

                elseif item == "sigsauer" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item) <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"pecasarma") >= 710 or vRP.hasPermission(user_id,"programador.permissao") then
                            if vRP.getInventoryItemAmount(user_id,"plastico") >= 430 or vRP.hasPermission(user_id,"programador.permissao") then
                                if vRP.getInventoryItemAmount(user_id,"fitaisolante") >= 430 or vRP.hasPermission(user_id,"programador.permissao") then

                                    if vRP.tryGetInventoryItem(user_id,"pecasarma",710) and
                                        vRP.tryGetInventoryItem(user_id,"plastico",430) and
                                            vRP.tryGetInventoryItem(user_id,"fitaisolante",430) or vRP.hasPermission(user_id,"programador.permissao") then

                                        TriggerClientEvent("fechar-nui-arma",source)

                                        TriggerClientEvent("Prog",source,10000,"Fabricando "..v.name.."")
                                        vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                        SetTimeout(10000,function()
                                            vRPclient._stopAnim(source,false)
                                            vRP.giveInventoryItem(user_id,v.item,1)
                                            TriggerClientEvent("Notify",source,"sucesso","Você montou uma <b>"..v.name.."</b>.")
                                        end)
SendWebhookMessage(logsProducao,"```prolog\n[Identidade]: ["..user_id.."] "..identity.name.." "..identity.firstname.."\n[Fabricou]: "..v.name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Fita Isolante</b> suficiente na mochila.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Plástico</b> suficiente na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Peças de Arma</b> suficiente na mochila.")
                        end
					else
						TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end

                elseif item == "thompson" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item) <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"pecasarma") >= 430 or vRP.hasPermission(user_id,"programador.permissao") then
                            if vRP.getInventoryItemAmount(user_id,"plastico") >= 230 or vRP.hasPermission(user_id,"programador.permissao") then
                                if vRP.getInventoryItemAmount(user_id,"fitaisolante") >= 230 or vRP.hasPermission(user_id,"programador.permissao") then

                                    if vRP.tryGetInventoryItem(user_id,"pecasarma",430) and
                                        vRP.tryGetInventoryItem(user_id,"plastico",230) and
                                            vRP.tryGetInventoryItem(user_id,"fitaisolante",230) or vRP.hasPermission(user_id,"programador.permissao") then

                                        TriggerClientEvent("fechar-nui-arma",source)

                                        TriggerClientEvent("Prog",source,10000,"Fabricando "..v.name.."")
                                        vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                        SetTimeout(10000,function()
                                            vRPclient._stopAnim(source,false)
                                            vRP.giveInventoryItem(user_id,v.item,1)
                                            TriggerClientEvent("Notify",source,"sucesso","Você montou uma <b>"..v.name.."</b>.")
                                        end)
SendWebhookMessage(logsProducao,"```prolog\n[Identidade]: ["..user_id.."] "..identity.name.." "..identity.firstname.."\n[Fabricou]: "..v.name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Fita Isolante</b> suficiente na mochila.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Plástico</b> suficiente na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Peças de Arma</b> suficiente na mochila.")
                        end
					else
						TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end

                elseif item == "tec9" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item) <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"pecasarma") >= 390 or vRP.hasPermission(user_id,"programador.permissao") then
                            if vRP.getInventoryItemAmount(user_id,"plastico") >= 200 or vRP.hasPermission(user_id,"programador.permissao") then
                                if vRP.getInventoryItemAmount(user_id,"fitaisolante") >= 200 or vRP.hasPermission(user_id,"programador.permissao") then

                                    if vRP.tryGetInventoryItem(user_id,"pecasarma",390) and
                                        vRP.tryGetInventoryItem(user_id,"plastico",200) and
                                            vRP.tryGetInventoryItem(user_id,"fitaisolante",200) or vRP.hasPermission(user_id,"programador.permissao") then

                                        TriggerClientEvent("fechar-nui-arma",source)

                                        TriggerClientEvent("Prog",source,10000,"Fabricando "..v.name.."")
                                        vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                        SetTimeout(10000,function()
                                            vRPclient._stopAnim(source,false)
                                            vRP.giveInventoryItem(user_id,v.item,1)
                                            TriggerClientEvent("Notify",source,"sucesso","Você montou uma <b>"..v.name.."</b>.")
                                        end)
SendWebhookMessage(logsProducao,"```prolog\n[Identidade]: ["..user_id.."] "..identity.name.." "..identity.firstname.."\n[Fabricou]: "..v.name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Fita Isolante</b> suficiente na mochila.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Plástico</b> suficiente na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Peças de Arma</b> suficiente na mochila.")
                        end
					else
						TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end

                elseif item == "uzi" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item) <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"pecasarma") >= 380 or vRP.hasPermission(user_id,"programador.permissao") then
                            if vRP.getInventoryItemAmount(user_id,"plastico") >= 215 or vRP.hasPermission(user_id,"programador.permissao") then
                                if vRP.getInventoryItemAmount(user_id,"fitaisolante") >= 215 or vRP.hasPermission(user_id,"programador.permissao") then

                                    if vRP.tryGetInventoryItem(user_id,"pecasarma",380) and
                                        vRP.tryGetInventoryItem(user_id,"plastico",215) and
                                            vRP.tryGetInventoryItem(user_id,"fitaisolante",215) or vRP.hasPermission(user_id,"programador.permissao") then

                                        TriggerClientEvent("fechar-nui-arma",source)

                                        TriggerClientEvent("Prog",source,10000,"Fabricando "..v.name.."")
                                        vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                        SetTimeout(10000,function()
                                            vRPclient._stopAnim(source,false)
                                            vRP.giveInventoryItem(user_id,v.item,1)
                                            TriggerClientEvent("Notify",source,"sucesso","Você montou uma <b>"..v.name.."</b>.")
                                        end)
SendWebhookMessage(logsProducao,"```prolog\n[Identidade]: ["..user_id.."] "..identity.name.." "..identity.firstname.."\n[Fabricou]: "..v.name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Fita Isolante</b> suficiente na mochila.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Plástico</b> suficiente na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você não tem a quantia de <b>Peças de Arma</b> suficiente na mochila.")
                        end
					else
						TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end


 				end
			end
		end
	end
end
--end)
-----------------------------------------------------------------------------------------------------------------------------------
--[ FUNÇÃO DE PERMISSÃO ]----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
function oC.checkPermissao()
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"programador.permissao") or vRP.hasPermission(user_id,"sobrevivente.permissao") then
        return true
    end
end