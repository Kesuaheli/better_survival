execute as @a if score @s better_survival.item_frame matches 1.. at @s anchored eyes run function better_survival:trigger/item_frame
execute as @a run scoreboard players reset @s better_survival.item_frame
scoreboard players enable @a better_survival.item_frame
