# exit the loop if maximum is reached
execute if score $current better_survival.item_frame > @s better_survival.item_frame run return 0

# exit the loop if no item frames are found
execute unless entity @e[type=#better_survival:item_frames,tag=!better_survival.modify,distance=..10] run return 0

# tag the next item frame and loop
execute as @n[type=#better_survival:item_frames,tag=!better_survival.modify,distance=..10] run tag @s add better_survival.modify
scoreboard players add $current better_survival.item_frame 1
function better_survival:trigger/item_frame/loop
