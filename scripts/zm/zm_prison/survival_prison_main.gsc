#include maps\mp\zombies\_zm_ai_brutus;
#include maps\mp\gametypes_zm\_zm_gametype;
#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\zombies\_zm_utility;
#include scripts\zm\zm_prison\locs\loc_docks;

main() 
{
	replaceFunc( maps\mp\zm_alcatraz_gamemodes::init, ::init_override );
	replaceFunc( maps\mp\zm_alcatraz_utility::player_lightning_manager, ::player_lightning_manager_override );
	maps\mp\zombies\_zm_ai_brutus::precache();
	maps\mp/zombies\_zm_ai_brutus::init();
	registerclientfield( "toplayer", "visionset_lerp", 9000, 3, "float" );
}

player_lightning_manager_override()
{
	self.b_lightning = 0;
	self setclientfieldtoplayer( "toggle_lightning", 0 );
}

init()
{
	location = getDvar( "ui_zm_mapstartlocation" );
	switch ( location )
	{
		case "docks":
			scripts/zm/zm_prison/locs/loc_docks::enable_zones();
			break;
		default:
			break;
	}
}

init_override()
{
    level.custom_vending_precaching = maps\mp\zm_prison::custom_vending_precaching;
    add_map_gamemode( "zclassic", maps\mp\zm_prison::zclassic_preinit, undefined, undefined );
    add_map_gamemode( "zgrief", maps\mp\zm_alcatraz_grief_cellblock::zgrief_preinit, undefined, undefined );
    add_map_location_gamemode( "zclassic", "prison", maps\mp\zm_alcatraz_classic::precache, maps\mp\zm_alcatraz_classic::main );
    add_map_location_gamemode( "zgrief", "cellblock", maps\mp\zm_alcatraz_grief_cellblock::precache, maps\mp\zm_alcatraz_grief_cellblock::main );
	add_map_location_gamemode( "zgrief", "docks", ::blank, ::blank );

	scripts/zm/_gametype_setup::add_struct_location_gamemode_func( "zgrief", "docks", scripts/zm/zm_prison/locs/loc_docks::struct_init );
}

blank()
{

}