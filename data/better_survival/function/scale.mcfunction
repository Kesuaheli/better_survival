$scoreboard players set scale better_survival.tmp $(cm)
scoreboard players operation scale better_survival.tmp *= 1000 better_survival.consts
scoreboard players operation scale better_survival.tmp /= player_height better_survival.consts
execute store result storage better_survival:tmp tmp.rl_scale double 0.001 run scoreboard players get scale better_survival.tmp
function better_survival:scale/scale with storage better_survival:tmp tmp
