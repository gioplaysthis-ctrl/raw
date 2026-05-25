local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Library = {}

function Library:CreateWindow(info)
    local Window = Rayfield:CreateWindow({
        Name = info.Name or "BIGGIE HUB",
        LoadingTitle = "BIGGIE HUB",
        LoadingSubtitle = "Loaded",
        ConfigurationSaving = {
            Enabled = false
        },
        Discord = {
            Enabled = false
        },
        KeySystem = false
    })

    local WrappedWindow = {}

    function WrappedWindow:CreateTab(tabinfo)
        local Tab = Window:CreateTab(tabinfo.Name or "Tab", 4483362458)

        local WrappedTab = {}

        function WrappedTab:CreateSection(info)
        end

        function WrappedTab:CreateDivider()
        end

        function WrappedTab:CreateToggle(info)
            return Tab:CreateToggle({
                Name = info.Name or "Toggle",
                CurrentValue = info.Value or false,
                Flag = info.Flag or tostring(math.random()),
                Callback = info.Callback or function() end
            })
        end

        function WrappedTab:CreateSlider(info)
            return Tab:CreateSlider({
                Name = info.Name or "Slider",
                Range = info.Range or {0,100},
                Increment = info.Increment or 1,
                Suffix = info.Suffix or "",
                CurrentValue = info.Value or 0,
                Flag = info.Flag or tostring(math.random()),
                Callback = info.Callback or function() end
            })
        end

        function WrappedTab:CreateButton(info)
            return Tab:CreateButton({
                Name = info.Name or "Button",
                Callback = info.Callback or function() end
            })
        end

        function WrappedTab:CreateInput(info)
            return Tab:CreateInput({
                Name = info.Name or "Input",
                PlaceholderText = info.Placeholder or "",
                RemoveTextAfterFocusLost = false,
                Callback = info.Callback or function() end
            })
        end

        function WrappedTab:CreatePicker(info)
        end

        return WrappedTab
    end

    return WrappedWindow
end

return Library
