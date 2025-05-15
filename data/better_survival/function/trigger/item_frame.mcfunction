execute positioned ^ ^ ^0.1 if entity @s[distance=..5] if block ~ ~ ~ #better_survival:unsolid run return run function better_survival:trigger/item_frame

execute if score @s better_survival.item_frame > $max better_survival.item_frame run tellraw @s { \
	text: "Das maximum sind ", \
	color: "red",   \
	extra: [ \
		{ score: {name: "$max", objective: "better_survival.item_frame"} }, \
		{ text: "!" }, \
	], \
}
execute if score @s better_survival.item_frame > $max better_survival.item_frame run scoreboard players operation @s better_survival.item_frame = $max better_survival.item_frame

# loop to find the item frames
scoreboard players reset $current better_survival.item_frame
function better_survival:trigger/item_frame/loop

# counting for display
execute store result score @s better_survival.set_visible run execute if entity @e[tag=better_survival.modify, nbt={Invisible: 1b}]
execute store result score @s better_survival.set_invisible run execute if entity @e[tag=better_survival.modify, nbt={Invisible: 0b}]

# changing actual values
execute as @e[type=#better_survival:item_frames, tag=better_survival.modify, nbt={Invisible: 0b}] run tag @s add better_survival.visible
execute as @e[type=#better_survival:item_frames, tag=better_survival.modify, nbt={Invisible: 1b}] run data merge entity @s {Invisible: 0b, Invulnerable: 0b, Fixed: 0b}
execute as @e[type=#better_survival:item_frames, tag=better_survival.modify, tag=visible] run data merge entity @s {Invisible: 1b, Invulnerable: 1b, Fixed: 1b}
execute as @e[type=#better_survival:item_frames] run tag @s remove better_survival.visible
execute as @e[type=#better_survival:item_frames] run tag @s remove better_survival.modify

tellraw @s[tag=debug] [{text: "[DEBUG] item_frame (@"}, {"selector": "@s"}, {text: "): "}, {text: "invisible="}, {score: {name: "@s", objective: "better_survival.set_visible"}}, {text: " visible="}, {score: {name: "@s", objective: "better_survival.set_invisible"}}]

# display: nothing changed
execute if score @s better_survival.set_visible matches 0 if score @s better_survival.set_invisible matches 0 run tellraw @s { \
	text: "In einem Umkreis von 10 Blöcken wurde:\n", \
	color: "gold", \
	extra: [ \
		{ color: "red",   text: " • kein Item Frame verändert!"}, \
	], \
}

# display: only 1+ visible or 1+ invisible (not both)
execute if score @s better_survival.set_visible matches 1 if score @s better_survival.set_invisible matches 0 run tellraw @s { \
	text: "In einem Umkreis von 10 Blöcken wurde:\n", \
	color: "gold", \
	extra: [ \
		{ color: "aqua",  text: " • ein Item Frame "}, \
		{ color: "green", text: "sichtbar"}, \
		{ color: "aqua",  text: " gemacht."}, \
	], \
}
execute if score @s better_survival.set_visible matches 2.. if score @s better_survival.set_invisible matches 0 run tellraw @s { \
	text: "In einem Umkreis von 10 Blöcken wurden:\n", \
	color: "gold", \
	extra: [ \
		{ color: "aqua",  text: " • "}, \
		{ color: "aqua",  score: { name: "@s", objective: "better_survival.set_visible" }}, \
		{ color: "aqua",  text: " Item Frames "}, \
		{ color: "green", text: "sichtbar"}, \
		{ color: "aqua",  text: " gemacht."}, \
	], \
}
execute if score @s better_survival.set_visible matches 0 if score @s better_survival.set_invisible matches 1 run tellraw @s { \
	text: "In einem Umkreis von 10 Blöcken wurde:\n", \
	color: "gold", \
	extra: [ \
		{ color: "aqua",  text: " • ein Item Frame  "}, \
		{ color: "red",   text: "unsichtbar"}, \
		{ color: "aqua",  text: " gemacht."}, \
	], \
}
execute if score @s better_survival.set_visible matches 0 if score @s better_survival.set_invisible matches 2.. run tellraw @s { \
	text: "In einem Umkreis von 10 Blöcken wurden:\n", \
	color: "gold", \
	extra: [ \
		{ color: "aqua",  text: " • "}, \
		{ color: "aqua",  score: { name: "@s", objective: "better_survival.set_invisible" }}, \
		{ color: "aqua",  text: " Item Frames  "}, \
		{ color: "red",   text: "unsichtbar"}, \
		{ color: "aqua",  text: " gemacht."}, \
	], \
}

# display: (1+ visible and 1 invisible) or (1 visible and 1+ invisible)
execute if score @s better_survival.set_visible matches 1 if score @s better_survival.set_invisible matches 1 run tellraw @s { \
	text: "In einem Umkreis von 10 Blöcken wurden:\n", \
	color: "gold", \
	extra: [ \
		{ color: "aqua",  text: " • ein Item Frame "}, \
		{ color: "green", text: "sichtbar"}, \
		{ color: "aqua",  text: " und\n • ein Item Frame  "}, \
		{ color: "red",   text: "unsichtbar"}, \
		{ color: "aqua",  text: " gemacht."}, \
	], \
}
execute if score @s better_survival.set_visible matches 2.. if score @s better_survival.set_invisible matches 1 run tellraw @s { \
	text: "In einem Umkreis von 10 Blöcken wurden:\n", \
	color: "gold", \
	extra: [ \
		{ \
			text: " • ", color: "aqua" \
		}, \
		{ color: "aqua",  score: { name: "@s", objective: "better_survival.set_visible" }}, \
		{ color: "aqua",  text: " Item Frames "}, \
		{ color: "green", text: "sichtbar"}, \
		{ color: "aqua",  text: " und \n • ein Item Frame  "}, \
		{ color: "red",   text: "unsichtbar"}, \
		{ color: "aqua",  text: " gemacht."}, \
	], \
}
execute if score @s better_survival.set_visible matches 1 if score @s better_survival.set_invisible matches 2.. run tellraw @s { \
	text: "In einem Umkreis von 10 Blöcken wurden:\n", \
	color: "gold", \
	extra: [ \
		{ color: "aqua",  text: " • ein Item Frame "}, \
		{ color: "green", text: "sichtbar"}, \
		{ color: "aqua",  text: " und \n • "}, \
		{ color: "aqua",  score: { name: "@s", objective: "better_survival.set_invisible" }}, \
		{ color: "aqua",  text: " Item Frames  "}, \
		{ color: "red",   text: "unsichtbar"}, \
		{ color: "aqua",  text: " gemacht."}, \
	], \
}

# display: 2+ visible and 2+ invisible
execute if score @s better_survival.set_visible matches 2.. if score @s better_survival.set_invisible matches 2.. run tellraw @s { \
	text: "In einem Umkreis von 10 Blöcken wurden:\n", \
	color: "gold", \
	extra: [ \
		{ color: "aqua",  text: " • "}, \
		{ color: "aqua",  score: { name: "@s", objective: "better_survival.set_visible" }}, \
		{ color: "aqua",  text: " Item Frames "}, \
		{ color: "green", text: "sichtbar"}, \
		{ color: "aqua",  text: " und \n • "}, \
		{ color: "aqua",  score: { name: "@s", objective: "better_survival.set_invisible" }}, \
		{ color: "aqua",  text: " Item Frames  "}, \
		{ color: "red",   text: "unsichtbar"}, \
		{ color: "aqua",  text: " gemacht."}, \
	], \
}
