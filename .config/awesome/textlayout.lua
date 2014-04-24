local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")

function textlayoutbox(screen, args)
    local screen = screen or 1
    local args = args or {}
    args.type = "textbox"
    local w = wibox.widget.textbox()

    local function updatelayoutbox()
        w:set_text(" " .. beautiful["layout_txt_" .. awful.layout.getname(awful.layout.get(screen))])
    end

    updatelayoutbox()

    awful.tag.attached_connect_signal(screen, "property::selected", updatelayoutbox)
    awful.tag.attached_connect_signal(screen, "property::layout", updatelayoutbox)

    return w
end
