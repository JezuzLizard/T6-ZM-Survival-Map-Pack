// T6 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#include maps\mp\_utility;
#include maps\mp\gametypes_zm\_hud_util;
#include common_scripts\utility;
#include maps\mp\gametypes_zm\_zm_gametype;
#include maps\mp\zombies\_zm_stats;
#include maps\mp\zombies\_zm_ai_dogs;
#include maps\mp\zombies\_zm;

main()
{
	maps\mp\gametypes_zm\_zm_gametype::main();
	level.onprecachegametype = ::onprecachegametype;
	level.onstartgametype = ::onstartgametype;
	level._game_module_custom_spawn_init_func = maps\mp\gametypes_zm\_zm_gametype::custom_spawn_init_func;
}

onprecachegametype()
{
	level.playersuicideallowed = 0;
}

onstartgametype()
{
	maps\mp\gametypes_zm\_zm_gametype::setup_classic_gametype();
	level thread maps\mp\zombies\_zm::round_start();
	level thread maps\mp\gametypes_zm\_zm_gametype::kill_all_zombies();
}
