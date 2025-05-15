# trigger to be used to toggele visibility of item frames
scoreboard objectives add better_survival.item_frame trigger {"translate":"item.minecraft.item_frame","color": "gold"}
scoreboard players set $max better_survival.item_frame 50
scoreboard objectives add better_survival.set_visible dummy
scoreboard objectives add better_survival.set_invisible dummy
