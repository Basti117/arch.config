local mainMod = "SUPER"
local globals = require("modules.globals")

local function concat(keys)
	return table.concat(keys, " + ")
end

hl.bind(concat({ mainMod, "RETURN" }), hl.dsp.exec_cmd(globals.terminal .. " -o allow_remote_control=yes"))
hl.bind(concat({ mainMod, "Q" }), hl.dsp.window.close())
hl.bind(
	concat({ mainMod, "M" }),
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(concat({ mainMod, "E" }), hl.dsp.exec_cmd(globals.fileManager))
hl.bind(concat({ mainMod, "V" }), hl.dsp.window.float({ action = "toggle" }))
hl.bind(concat({ mainMod, "SPACE" }), hl.dsp.exec_cmd(globals.menu))
hl.bind(concat({ mainMod, "T" }), hl.dsp.exec_cmd("/usr/bin/env bash ~/.config/hypr/scripts/switch-cub-profile.sh"))
hl.bind(concat({ mainMod, "P" }), hl.dsp.window.pseudo())
-- hl.bind(concat({ mainMod, "T" }), hl.dsp.layout("togglesplit"))
hl.bind(concat({ mainMod, "N" }), hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(concat({ mainMod, "B" }), hl.dsp.exec_cmd("firefox"))
hl.bind(concat({ mainMod, "F5" }), hl.dsp.exec_cmd("hyprctl reload"))

hl.bind(concat({ mainMod, "H" }), hl.dsp.focus({ direction = "left" }))
hl.bind(concat({ mainMod, "J" }), hl.dsp.focus({ direction = "down" }))
hl.bind(concat({ mainMod, "K" }), hl.dsp.focus({ direction = "up" }))
hl.bind(concat({ mainMod, "L" }), hl.dsp.focus({ direction = "right" }))

hl.bind(concat({ mainMod, "SHIFT", "H" }), hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))
hl.bind(concat({ mainMod, "SHIFT", "L" }), hl.dsp.exec_cmd("hyprlock"))
hl.bind(
	concat({ mainMod, "SHIFT", "S" }),
	hl.dsp.exec_cmd('grim -g "$(slurp)" /tmp/$(date +"%Y%m%d_%H%M%S_screenshot.png"')
)

for i = 1, 10 do
	local key = i % 10
	hl.bind(concat({ mainMod, key }), hl.dsp.focus({ workspace = i }))
	hl.bind(concat({ mainMod, "SHIFT", key }), hl.dsp.window.move({ workspace = i }))
end

hl.bind(concat({ mainMod, "S" }), hl.dsp.workspace.toggle_special("magic"))
hl.bind(concat({ mainMod, "ALT", "S" }), hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(concat({ mainMod, "mouse_down" }), hl.dsp.focus({ workspace = "e+1" }))
hl.bind(concat({ mainMod, "mouse_up" }), hl.dsp.focus({ workspace = "e-1" }))

hl.bind(concat({ mainMod, "mouse:272" }), hl.dsp.window.drag(), { mouse = true })
hl.bind(concat({ mainMod, "mouse:273" }), hl.dsp.window.resize(), { mouse = true })

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("hyprctl hyprsunset gamma -10"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("hyprctl hyprsunset gamma +10"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
