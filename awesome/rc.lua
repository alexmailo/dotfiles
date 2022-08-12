--  _ __ ___
-- | '__/ __|
-- | | | (__
-- |_|  \___|

pcall(require, "luarocks.loader")

function capture(cmd, raw)
	local f = assert(io.popen(cmd, "r"))
	local s = assert(f:read("*a"))
	f:close()
	if raw then
		return s
	end
	s = string.gsub(s, "^%s+", "")
	s = string.gsub(s, "%s+$", "")
	s = string.gsub(s, "[\n\r]+", " ")
	return s
end

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local dpi = require("beautiful.xresources").apply_dpi

require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

require("awful.hotkeys_popup.keys")

if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors,
	})
end

-- Execute script when starting
awesome.connect_signal("startup", function() awful.util.spawn("/home/alex/.config/awesome/script") end)

do
	local in_error = false

	awesome.connect_signal("debug::error", function(err)
		if in_error then
			return
		end
		in_error = true

		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err),
		})

		in_error = false
	end)
end

beautiful.init("/home/alex/.config/awesome/theme.lua")

terminal = "alacritty"
editor = "nvim"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"

local browsers = {
	{ "firefox", "firefox", "/usr/share/icons/Zorin/32x32/apps/firefox.png" },
	{ "brave", "brave", "/usr/share/icons/Zorin/32x32/apps/brave.png" },
}

local coding = {
	{ "nvim", "alacritty -e nvim ", "/usr/share/icons/hicolor/128x128/apps/nvim.png" },
	{ "vscode", "code", "/usr/share/icons/Zorin/32x32/apps/visual-studio-code.png" },
	{ "idea", "idea", "/usr/share/idea/bin/idea.png" },
	{ "obsidian", "obsidian", "/usr/share/pixmaps/obsidian.png" },
}

local api = {
	{ "postman", "postman", "/usr/share/icons/hicolor/128x128/apps/postman.png" },
	{ "insomnia", "insomnia", "/usr/share/icons/hicolor/128x128/apps/insomnia.png" },
}

local music = {
	{ "spotify", "spotify", "/usr/share/icons/Zorin/32x32/apps/spotify.png" },
}

awful.layout.layouts = {
	awful.layout.suit.floating,
	awful.layout.suit.tile,
	awful.layout.suit.tile.left,
	awful.layout.suit.tile.bottom,
	awful.layout.suit.tile.top,
	awful.layout.suit.fair,
	-- awful.layout.suit.max,
	awful.layout.suit.fair.horizontal,
	awful.layout.suit.magnifier,
}

myawesomemenu = {
	{ "manual", terminal .. " -e man awesome" },
	{ "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{ "quit", function() awesome.quit() end, },
}

mymainmenu = awful.menu({
	items = {
		{ "awesome", myawesomemenu },
		{ "browsers", browsers },
		{ "api", api },
		{ "coding", coding },
		{ "music", music },
	},
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })
menubar.utils.terminal = terminal

local taglist_buttons = gears.table.join(
	awful.button({}, 1, function(t)
		t:view_only()
	end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({}, 4, function(t)
		awful.tag.viewnext(t.screen)
	end),
	awful.button({}, 5, function(t)
		awful.tag.viewprev(t.screen)
	end)
)

local tasklist_buttons = gears.table.join(
	awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal("request::activate", "tasklist", { raise = true })
		end
	end),
	awful.button({}, 3, function()
		awful.menu.client_list({ theme = { width = 250 } })
	end),
	awful.button({}, 4, function()
		awful.client.focus.byidx(1)
	end),
	awful.button({}, 5, function()
		awful.client.focus.byidx(-1)
	end)
)


local function set_wallpaper(s)
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, true)
	end
end

screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
	mysystray = wibox.widget.systray()
	mytextclock = wibox.widget.textclock("%b %a %d %r", 1)
	set_wallpaper(s)
	month_calendar = awful.widget.calendar_popup.month(  { screen = s } )
	month_calendar:attach(mytextclock, 'tr', { on_hover= false})
	awful.tag({ "", "", "", "", "", " " }, s, awful.layout.layouts[1])

	s.mypromptbox = awful.widget.prompt()
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function() awful.layout.inc(1) end),
		awful.button({}, 3, function() awful.layout.inc(-1) end),
		awful.button({}, 4, function() awful.layout.inc(1) end),
		awful.button({}, 5, function() awful.layout.inc(-1) end)
	))
	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
		layout = wibox.layout.fixed.horizontal,
		style = {
			spacing = 25,
		},
	})

	s.mywibox = awful.wibar({
		position = "top",
		screen = s,
		width = 1910,
		height = 40,
		bg = beautiful.bar_bg,
		shape = gears.shape.rounded_rect,
		fg = beautiful.bar_fg,
	})
	s.mywibox.y = 7

	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		wibox.container.margin(s.mytaglist, 20),
		wibox.container.place(
			wibox.widget.textbox(
				" "
					.. capture("pacman -Quq | wc -l", false)
					.. "  "
					.. capture("uname -r", false)
					.. "  "
					.. capture("pacman -Qq |wc -l ", false)
			),
			"center",
			"center"
		),
		{
			layout = wibox.layout.fixed.horizontal,
			spacing = 10,

			mysystray,
			mytextclock,
			wibox.container.margin(s.mylayoutbox, 0, 20, 5, 5),
		},
	})
end)
-- }}}

root.buttons(gears.table.join(
	awful.button({}, 3, function() mymainmenu:toggle() end),
	awful.button({}, 4, awful.tag.viewnext),
	awful.button({}, 5, awful.tag.viewprev)
))

globalkeys = gears.table.join(
	awful.key({ modkey }, "b", function()
		myscreen = awful.screen.focused()
		myscreen.mywibox.visible = not myscreen.mywibox.visible
	end, { description = "toggle statusbar", group = "awesome" }),
	awful.key({ modkey }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
	awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),

	awful.key({ modkey }, "h", function() awful.client.focus.byidx(1) end, { description = "focus next by index", group = "client" }),
	awful.key({ modkey }, "l", function() awful.client.focus.byidx(-1) end, { description = "focus previous by index", group = "client" }),

	-- Layout manipulation
	awful.key({ modkey }, "c", function() awful.util.spawn("/home/alex/Code/scripts/copyColor") end),
	awful.key({ modkey }, "w", function() awful.util.spawn("/home/alex/Code/scripts/bgSolid") end),

	awful.key({ modkey, "Shift" }, "j", function() awful.client.swap.byidx(1) end, { description = "swap with next client by index", group = "client" }),
	awful.key({ modkey, "Shift" }, "k", function() awful.client.swap.byidx(-1) end, { description = "swap with previous client by index", group = "client" }),
	awful.key({ modkey, "Control" }, "j", function() awful.screen.focus_relative(1) end, { description = "focus the next screen", group = "screen" }),
	awful.key({ modkey, "Control" }, "k", function() awful.screen.focus_relative(-1) end, { description = "focus the previous screen", group = "screen" }),
	awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
	awful.key({ modkey }, "Tab", function()
		awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end, { description = "go back", group = "client" }),

	-- Standard program
	awful.key({ modkey }, "Return", function() awful.spawn(terminal) end, { description = "open a terminal", group = "launcher" }),
	awful.key({ modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),

	awful.key({ modkey }, "k", function() awful.tag.incmwfact(0.05) end, { description = "increase master width factor", group = "layout" }),
	awful.key({ modkey }, "j", function() awful.tag.incmwfact(-0.05) end, { description = "decrease master width factor", group = "layout" }),
	awful.key({ modkey, "Shift" }, "h", function() awful.tag.incnmaster(1, nil, true) end, { description = "increase the number of master clients", group = "layout" }),
	awful.key({ modkey, "Shift" }, "l", function() awful.tag.incnmaster(-1, nil, true) end, { description = "decrease the number of master clients", group = "layout" }),
	awful.key({ modkey, "Control" }, "h", function() awful.tag.incncol(1, nil, true) end, { description = "increase the number of columns", group = "layout" }),
	awful.key({ modkey, "Control" }, "l", function() awful.tag.incncol(-1, nil, true) end, { description = "decrease the number of columns", group = "layout" }),
	awful.key({ modkey }, "space", function() awful.layout.inc(1) end, { description = "select next", group = "layout" }),
	awful.key({ modkey, "Shift" }, "space", function() awful.layout.inc(-1) end, { description = "select previous", group = "layout" }),

	-- for volume keys on headphone
	awful.key({}, "XF86AudioRaiseVolume", function () awful.util.spawn("amixer sset 'Master' 5%+") end),
	awful.key({}, "XF86AudioLowerVolume", function() awful.util.spawn("amixer sset 'Master' 5%-") end),
	--
	awful.key({ modkey, "Control" }, "n", function()
		local c = awful.client.restore()
		-- Focus restored client
		if c then
			c:emit_signal("request::activate", "key.unminimize", { raise = true })
		end
	end, { description = "restore minimized", group = "client" }),

	awful.key({ modkey }, "x", function() awful.spawn("rofi -show drun -theme ~/.config/rofi/mine.rasi") end, { description = "Rofi", group = "awesome" })
)

clientkeys = gears.table.join(
	awful.key({ modkey }, "f", function(c)
		c.fullscreen = not c.fullscreen
		c:raise()
	end, { description = "toggle fullscreen", group = "client" }),
	awful.key({ modkey }, "q", function(c)
		c:kill()
	end, { description = "close", group = "client" }),
	awful.key(
		{ modkey, "Control" },
		"space",
		awful.client.floating.toggle,
		{ description = "toggle floating", group = "client" }
	),
	awful.key({ modkey, "Control" }, "Return", function(c)
		c:swap(awful.client.getmaster())
	end, { description = "move to master", group = "client" }),
	awful.key({ modkey }, "o", function(c)
		c:move_to_screen()
	end, { description = "move to screen", group = "client" }),
	awful.key({ modkey }, "t", function(c)
		c.ontop = not c.ontop
	end, { description = "toggle keep on top", group = "client" }),
	awful.key({ modkey }, "n", function(c)
		c.minimized = true
	end, { description = "minimize", group = "client" }),
	awful.key({ modkey }, "m", function(c)
		c.maximized = not c.maximized
		c:raise()
	end, { description = "(un)maximize", group = "client" }),
	awful.key({ modkey, "Control" }, "m", function(c)
		c.maximized_vertical = not c.maximized_vertical
		c:raise()
	end, { description = "(un)maximize vertically", group = "client" }),
	awful.key({ modkey, "Shift" }, "m", function(c)
		c.maximized_horizontal = not c.maximized_horizontal
		c:raise()
	end, { description = "(un)maximize horizontally", group = "client" })
)

for i = 1, 9 do
	globalkeys = gears.table.join(
		globalkeys,
		-- View tag only.
		awful.key({ modkey }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, { description = "view tag #" .. i, group = "tag" }),
		-- Toggle tag display.
		awful.key({ modkey, "Control" }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, { description = "toggle tag #" .. i, group = "tag" }),
		-- Move client to tag.
		awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end, { description = "move focused client to tag #" .. i, group = "tag" }),
		-- Toggle tag on focused client.
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end, { description = "toggle focused client on tag #" .. i, group = "tag" })
	)
end

clientbuttons = gears.table.join(
	awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),
	awful.button({ modkey }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.move(c)
	end),
	awful.button({ modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.resize(c)
	end)
)
root.keys(globalkeys)

awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	},

	{
		rule_any = {
			instance = {
				"DTA", -- Firefox addon DownThemAll.
				"copyq", -- Includes session name in class.
				"pinentry",
			},
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"MessageWin", -- kalarm.
				"Sxiv",
				"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
			},

			name = {
				"Event Tester", -- xev.
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				--"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
			},
		},
		properties = { floating = true },
	},

	{ rule_any = { type = { "normal", "dialog" } }, properties = { titlebars_enabled = false } },
}
client.connect_signal("manage", function(c)
	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end
end)

client.connect_signal("request::titlebars", function(c)
	-- buttons for the titlebar
	local buttons = gears.table.join(
		awful.button({}, 1, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.move(c)
		end),
		awful.button({}, 3, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.resize(c)
		end)
	)

	awful.titlebar(c):setup({
		{ -- Left
			awful.titlebar.widget.iconwidget(c),
			buttons = buttons,
			layout = wibox.layout.fixed.horizontal,
		},
		{ -- Middle
			{
				align = "center",
				widget = awful.titlebar.widget.titlewidget(c),
			},
			buttons = buttons,
			layout = wibox.layout.flex.horizontal,
		},
		{ -- Right
			-- awful.titlebar.widget.floatingbutton(c),
			awful.titlebar.widget.maximizedbutton(c),
			awful.titlebar.widget.closebutton(c),
			layout = wibox.layout.fixed.horizontal(),
		},
		layout = wibox.layout.align.horizontal,
	})
end)

client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("property::urgent", function(c)
	c.minimized = false
	c:jump_to()
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
