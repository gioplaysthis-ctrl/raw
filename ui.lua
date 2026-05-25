local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Library = {}

function Library:CreateWindow(info)
    local Window = Rayfield:CreateWindow({
        Name = info.Name or "Window",
        LoadingTitle = "Loading",
        LoadingSubtitle = "by Biggie Hub",
        ConfigurationSaving = {
            Enabled = false
        }
    })

    return Window
end

return Library
