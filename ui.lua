
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Library = {}

function Library:CreateWindow(info)
    local RealWindow = Rayfield:CreateWindow({
        Name = info.Name or "BIGGIE HUB",
        LoadingTitle = info.Name or "BIGGIE HUB",
        LoadingSubtitle = "Loaded Successfully",
        ConfigurationSaving = {
            Enabled = false
        },
        Discord = {
            Enabled = false
        },
        KeySystem = false
    })

    local WrappedWindow = {}

    WrappedWindow.Tabs = {}

    function WrappedWindow:Set(state)
        print("Window visibility:", state)
    end

    function WrappedWindow:Load()
        print("Window loaded")
    end

    function WrappedWindow:CreateTab(tabinfo)
        local RealTab = RealWindow:CreateTab(tabinfo.Name or "Tab", 4483362458)

        local WrappedTab = {}

        function WrappedTab:CreateSection(text)
            print("Section:", text)
        end

        function WrappedTab:CreateDivider()
            print("Divider created")
        end

        function WrappedTab:CreateLabel(text)
            RealTab:CreateParagraph({
                Title = tostring(text),
                Content = ""
            })
        end

        function WrappedTab:SetTheme(theme)
            print("Theme:", theme)
        end

        function WrappedTab:CreateToggle(info)
            local Current = info.Value or false

            local Toggle = RealTab:CreateToggle({
                Name = info.Name or "Toggle",
                CurrentValue = Current,
                Flag = info.Flag or tostring(math.random()),
                Callback = function(v)
                    Current = v

                    if info.Callback then
                        pcall(info.Callback, v)
                    end
                end
            })

            return {
                Get = function()
                    return Current
                end,

                Set = function(_, v)
                    Current = v
                end
            }
        end

        function WrappedTab:CreateSlider(info)
            local Current = info.Value or 0

            local Slider = RealTab:CreateSlider({
                Name = info.Name or "Slider",
                Range = info.Range or {0, 100},
                Increment = info.Increment or 1,
                Suffix = info.Suffix or "",
                CurrentValue = Current,
                Flag = info.Flag or tostring(math.random()),
                Callback = function(v)
                    Current = v

                    if info.Callback then
                        pcall(info.Callback, v)
                    end
                end
            })

            return {
                Get = function()
                    return Current
                end,

                Set = function(_, v)
                    Current = v
                end
            }
        end

        function WrappedTab:CreateButton(info)
            RealTab:CreateButton({
                Name = info.Name or "Button",
                Callback = function()
                    if info.Callback then
                        pcall(info.Callback)
                    end
                end
            })
        end

        function WrappedTab:CreateInput(info)
            local Current = ""

            RealTab:CreateInput({
                Name = info.Name or "Input",
                PlaceholderText = info.Placeholder or "",
                RemoveTextAfterFocusLost = false,
                Callback = function(v)
                    Current = v

                    if info.Callback then
                        pcall(info.Callback, v)
                    end
                end
            })

            return {
                Get = function()
                    return Current
                end,

                Set = function(_, v)
                    Current = v
                end
            }
        end

        function WrappedTab:CreateParagraph(info)
            RealTab:CreateParagraph({
                Title = info.Title or "Paragraph",
                Content = info.Content or ""
            })
        end

        function WrappedTab:CreatePicker(info)
            print("Color picker placeholder")

            return {
                Get = function()
                    return info.Value
                end,

                Set = function() end
            }
        end

        WrappedWindow.Tabs[tabinfo.Name or "Tab"] = WrappedTab

        return WrappedTab
    end

    return WrappedWindow
end

return Library
```

Then keep your original loader line:

```lua
local Success, Library = pcall(function()
    return loadstring(game:HttpGet("YOUR_RAW_UI_LINK"))()
end)
```


