--
-- look_thinviolet for Ion's default drawing engine. 
-- Based on look_newviolet
-- 

if not gr.select_engine("de") then
    return
end

de.reset()

de.defstyle("*", {
    highlight_colour = "#e7e7ff",
    shadow_colour = "#e7e7ff",
    background_colour = "#b8b8c8",
    foreground_colour = "#000000",
    
    shadow_pixels = 1,
    highlight_pixels = 1,
    padding_pixels = 0,
    spacing = 0,
    border_style = "elevated",
    border_sides = "tb",
    
--    font = "-*-helvetica-medium-r-normal-*-14-*-*-*-*-*-*-*",
    font = "-*-WenQuanYi Bitmap Song-regular-r-normal-*-8-*-*-*-*-*-*-*",
    text_align = "center",
})


de.defstyle("tab", {
--    font = "-*-helvetica-medium-r-normal-*-12-*-*-*-*-*-*-*",
    font = "-*-WenQuanYi Bitmap Song-regular-r-normal-*-8-*-*-*-*-*-*-*",
    
    de.substyle("active-selected", {
        highlight_colour = "#aaaacc",
        shadow_colour = "#aaaacc",
        background_colour = "#666699",
        foreground_colour = "#eeeeee",
    }),

    de.substyle("*-unselected", {
        shadow_colour = "grey",
        highlight_colour = "grey",
        background_colour = "#545d75",
        foreground_colour = "grey",
    }),

    de.substyle("inactive-selected", {
        highlight_colour = "#cfcfdf",
        shadow_colour = "#cfcfdf",
        background_colour = "#9999bb",
        foreground_colour = "#000000",
    }),
})


de.defstyle("input", {
    text_align = "left",
    highlight_colour = "#eeeeff",
    shadow_colour = "#eeeeff",
	background_colour = "#545d75",
    
    de.substyle("*-selection", {
        background_colour = "#666699",
        foreground_colour = "#000000",
    }),

    de.substyle("*-cursor", {
        background_colour = "#000000",
        foreground_colour = "#b8b8c8",
    }),
})


de.defstyle("input-menu", {
    highlight_pixels = 0,
    shadow_pixels = 0,
    padding_pixels = 0,
})


de.defstyle("frame", {
    shadow_pixels = 0,
    highlight_pixels = 0,
    padding_pixels = 0,
    border_sides = "all",
    transparent_background = true,
})


dopath("lookcommon_thin")


-- Refresh objects' brushes.
gr.refresh()
