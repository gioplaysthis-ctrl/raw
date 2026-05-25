local Library = {}

function Library:CreateWindow(info)
    local Window = {
        Tabs = {}
    }

    function Window:Set(bool)
        print("Window Set:", bool)
    end

    function Window:Flush()
        print("Window flushed")
    end

    function Window:CreateTab(tabinfo)
        local Tab = {}

        function Tab:CreateSection(info) end
        function Tab:CreateDivider() end

        function Tab:CreateToggle(info)
            return {
                Get = function() return info.Value end,
                Set = function() end
            }
        end

        function Tab:CreateSlider(info)
            return {
                Get = function() return info.Value end,
                Set = function() end
            }
        end

        function Tab:CreateInput(info)
            return {
                Get = function() return info.Value end,
                Set = function() end
            }
        end

        function Tab:CreateButton(info)
            return {}
        end

        function Tab:CreatePicker(info)
            return {
                Get = function() return info.Value end,
                Set = function() end
            }
        end

        Window.Tabs[tabinfo.Name] = Tab
        return Tab
    end

    return Window
end

return Library
