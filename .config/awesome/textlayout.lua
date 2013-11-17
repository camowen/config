
function textlayoutbox(screen, args)
    local screen = screen or 1
    local args = args or {}
    args.type = "textbox"
    local w = widget(args)

    local function updatelayoutbox()
        w.text = " " .. beautiful["layout_txt_" .. awful.layout.getname(awful.layout.get(screen))]
    end

    updatelayoutbox()

    awful.tag.attached_add_signal(screen, "property::selected", updatelayoutbox)
    awful.tag.attached_add_signal(screen, "property::layout", updatelayoutbox)

    return w
end
