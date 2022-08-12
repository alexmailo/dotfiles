--  _   _
-- | |_| |__   ___ _ __ ___   ___
-- | __| '_ \ / _ \ '_ ` _ \ / _ \
-- | |_| | | |  __/ | | | | |  __/
--  \__|_| |_|\___|_| |_| |_|\___|
--

local gears = require("gears")
local themes_path = require("gears.filesystem").get_themes_dir()
local dpi = require("beautiful.xresources").apply_dpi
local theme = {}

theme.notification_bg = "#111015"
theme.notification_fg = "white"
theme.notification_max_height = 200
theme.notification_icon_size = 100
theme.notification_shape = gears.shape.rounded_rect
theme.notification_max_width = 600
theme.notification_border_width = 2

theme.bar_bg = "#000000cc"
theme.bar_fg = "white"
theme.taglist_fg_focus = "#ADDE2A"
theme.taglist_fg_occupied = "white"
theme.taglist_fg_empty = "#dddddd55"
theme.taglist_bg_focus = "#00000000"
theme.taglist_font = "Fira Code Medium 19"
theme.font = "Cartograph CF 14"

theme.fg_normal = "#DCDCCC"
theme.fg_focus = "black"
theme.fg_urgent = "#CC9393"
theme.bg_normal = theme.bar_bg
theme.bg_focus = "white"
theme.bg_urgent = "#3F3F3F"
theme.bg_systray = theme.bar_bg

theme.useless_gap = dpi(8)
theme.border_width = dpi(5)
theme.border_normal = "#000000"
theme.border_focus = "#000000"
theme.border_marked = "#8a2be2"

theme.titlebar_bg_focus = theme.bar_bg
theme.titlebar_fg_focus = "#c1c1c1"
theme.titlebar_fg_normal = "#c1c1c1"
theme.titlebar_bg_normal = theme.bar_bg

theme.menu_bg_normal = "#000000"
theme.menu_fg_focus = "#ABE9B3"
theme.menu_bg_focus = "#ABE9B300"

theme.menu_height = dpi(40)
theme.menu_width = dpi(200)

theme.taglist_squares_unsel = "false"
-- theme.taglist_squares_unsel = themes_path .. "zenburn/taglist/squarez.png"
--theme.taglist_squares_resize = "false"

theme.awesome_icon = themes_path .. "zenburn/awesome-icon.png"
theme.menu_submenu_icon = themes_path .. "default/submenu.png"

theme.layout_tile = themes_path .. "zenburn/layouts/tile.png"
theme.layout_tileleft = themes_path .. "zenburn/layouts/tileleft.png"
theme.layout_tilebottom = themes_path .. "zenburn/layouts/tilebottom.png"
theme.layout_tiletop = themes_path .. "zenburn/layouts/tiletop.png"
theme.layout_fairv = themes_path .. "zenburn/layouts/fairv.png"
theme.layout_fairh = themes_path .. "zenburn/layouts/fairh.png"
theme.layout_spiral = themes_path .. "zenburn/layouts/spiral.png"
theme.layout_dwindle = themes_path .. "zenburn/layouts/dwindle.png"
theme.layout_max = themes_path .. "zenburn/layouts/max.png"
theme.layout_fullscreen = themes_path .. "zenburn/layouts/fullscreen.png"
theme.layout_magnifier = themes_path .. "zenburn/layouts/magnifier.png"
theme.layout_floating = themes_path .. "zenburn/layouts/floating.png"
theme.layout_cornernw = themes_path .. "zenburn/layouts/cornernw.png"
theme.layout_cornerne = themes_path .. "zenburn/layouts/cornerne.png"
theme.layout_cornersw = themes_path .. "zenburn/layouts/cornersw.png"
theme.layout_cornerse = themes_path .. "zenburn/layouts/cornerse.png"

theme.titlebar_close_button_focus = themes_path .. "default/titlebar/close_focus.png"
theme.titlebar_close_button_normal = themes_path .. "default/titlebar/close_normal.png"
theme.titlebar_minimize_button_normal = themes_path .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = themes_path .. "default/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_focus_active = themes_path .. "zenburn/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "zenburn/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive = themes_path .. "zenburn/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = themes_path .. "zenburn/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active = themes_path .. "zenburn/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "zenburn/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive = themes_path .. "zenburn/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = themes_path .. "zenburn/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active = themes_path .. "zenburn/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = themes_path .. "zenburn/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive = themes_path .. "zenburn/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = themes_path .. "zenburn/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active = themes_path .. "default/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive = themes_path .. "default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = themes_path .. "default/titlebar/maximized_normal_inactive.png"

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
