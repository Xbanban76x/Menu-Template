ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local payRecolte = false

function OpenTuto()
    local main_menu = RageUI.CreateMenu(Config.Text.welcome, Config.Text.interact)
    local submenu = RageUI.CreateSubMenu(main_menu, Config.Text.tuo, Config.Text.interact)

    RageUI.Visible(main_menu, not RageUI.Visible(main_menu))
    while main_menu do
        Wait(0)

        RageUI.IsVisible(main_menu, true, false, true, function()
            



                RageUI.PercentagePanel(Config.Param.load, "Récolte en cours (~b~"..math.floor(Config.Param.load * 100) ..  "%~s~)", "", "", function(_, a_, percent)
                    if Config.Param.load < 1.0 then
                        Config.Param.load = Config.Param.load + 0.0010
                    else
                        Config.Param.load = 0
                        print("Récolte terminée")
                    end
                
                end)

            

        end, function()
        end)

        RageUI.IsVisible(submenu, true, false, true, function()
        
            RageUI.ButtonWithStyle(Config.Text.leave, nil, {RightLabel = "→"}, true, function(_, _, s)
                if s then
                    ESX.ShowNotification(Config.Text.notif_leave)
                    RageUI.CloseAll()
                end
            end)

        end, function()
        end)

        if not RageUI.Visible(main_menu) and not RageUI.Visible(submenu) then
            main_menu = RMenu:DeleteType("main_shop", true)
        end
    end
end

Keys.Register("F1", "(keyboard)", "OpenTuto", function()
    OpenTuto()
end)