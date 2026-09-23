hl.config({

    general = {
        layout = "dwindle",
    },

    scrolling = {
        fullscreen_on_one_column = true,
        follow_focus = true,
        direction = "right",
        focus_fit_method = 1,
        column_width = 0.5,
        follow_min_visible = 0.5,
        explicit_column_widths = "0.333, 0.5, 0.667, 1.0",
        wrap_focus = false,
        wrap_swapcol = false,
    },

    master = {
        mfact = 0.5,
    },
})

hl.layout.register("grid", {
    recalculate = function(ctx)
        local n = #ctx.targets
        if n == 0 then
            return
        end

        local cols = math.ceil(math.sqrt(n))
        local rows = math.ceil(n / cols)

        if n == 1 then
            ctx.targets[1]:place(ctx.area)
            return
        end

        local cell_height = ctx.area.h / rows

        for i, target in ipairs(ctx.targets) do
            local row = math.floor((i - 1) / cols)
            local col = (i - 1) % cols

            -- Number of windows actually in this row.
            local windows_in_row = math.min(
                cols,
                n - row * cols
            )

            -- Make incomplete rows fill the entire width.
            local cell_width = ctx.area.w / windows_in_row

            local x = ctx.area.x + col * cell_width
            local y = ctx.area.y + row * cell_height

            target:place({
                x = x,
                y = y,
                w = cell_width,
                h = cell_height,
            })
        end
    end,
})


