local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Library = {}

function Library:CreateWindow(info)
    local RealWindow = Rayfield:CreateWindow({
        Name = tostring(info.Name or "BIGGIE HUB"),
        LoadingTitle = "BIGGIE HUB",
        LoadingSubtitle = "Loaded",
        ConfigurationSaving = {
            Enabled = false,
        },
        Discord = {
            Enabled = false,
        },
        KeySystem = false,
    })

    local WrappedWindow = {}
    WrappedWindow.Tabs = {}

    function WrappedWindow:Set(v)
        print("Set Window", v)
    end

    function WrappedWindow:Load()
        print("Loaded")
    end

    local function CreateWrappedTab(RealTab)
        local WrappedTab = {}

        function WrappedTab:CreateSection(name)
            RealTab:CreateParagraph({
                Title = tostring(name or "Section"),
                Content = ""
            })
        end

        function WrappedTab:CreateDivider()
        end

        function WrappedTab:SetTheme(theme)
            print("Theme:", theme)
        end

        function WrappedTab:CreateLabel(text)
            RealTab:CreateParagraph({
                Title = tostring(text),
                Content = ""
            })
        end

        function WrappedTab:CreateButton(info)
            info = info or {}

            RealTab:CreateButton({
                Name = tostring(info.Name or "Button"),
                Callback = function()
                    if info.Callback then
                        pcall(info.Callback)
                    end
                end
            })
        end

        function WrappedTab:CreateToggle(info)
            info = info or {}

            local Current = info.Value or false

            RealTab:CreateToggle({
                Name = tostring(info.Name or "Toggle"),
                CurrentValue = Current,
                Flag = tostring(info.Flag or math.random()),
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
return Library
