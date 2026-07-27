local default = require("lua/programs")
local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Essentials
hl.bind(mainMod .. " + Q", hl.dsp.window.close()) -- Quit active window
hl.bind( -- Exit hyprland
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(
	mainMod .. " + SHIFT + W",
	hl.dsp.exec_cmd(
		"pkill waypaper || waypaper --config-file ~/.config/hypr/waypaper/waypaper.ini --backend awww --folder ~/.config/hypr/assets/wallpaper"
	)
)

-- App bindings
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(default.terminal)) -- Open terminal
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(default.menu)) -- Toggle start menu
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(default.fileManager)) -- Open explorer
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(default.browser))

-- Window control
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

-- Change windows
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Workspaces
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:scratchpad" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(".config/hypr/scripts/volume -i"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(" .config/hypr/scripts/volume -d"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(".config/hypr/scripts/volume -t"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(".config/hypr/scripts/microphone -t"), { locked = true, repeating = true })
hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd(".config/hypr/scripts/brightness -i"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd(".config/hypr/scripts/brightness -d"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Screenshotting
hl.bind("PRINT", hl.dsp.exec_cmd("~/.config/hypr/scripts/grimblast save area --notify | wp-copy"))
hl.bind("SHIFT+PRINT", hl.dsp.exec_cmd("~/.config/hypr/scripts/grimblast save screen --notify | wp-copy"))

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})
