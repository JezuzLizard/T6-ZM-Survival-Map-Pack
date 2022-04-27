#include maps/mp/zombies/_zm_zonemgr;


struct_init()
{
	coordinates = array( ( -335, 5512, -71 ), ( -589, 5452, -71 ), ( -1094, 5426, -71 ), ( -1200, 5882, -71 ), 
							( 669, 6785, 209 ), ( 476, 6774, 196 ), ( 699, 6562, 208 ), ( 344, 6472, 264 ) );
	angles = array( ( 0, 12, 0 ), ( 0, 45, 0 ), ( 0, -131, 0 ), ( 0, 90, 0 ), ( 0, -178, 0 ), ( 0, -179, 0 ), ( 0, -177, 0 ), ( 0, -177, 0 ) );
	for ( i = 0; i < coordinates.size; i++ )
	{
		scripts/zm/_gametype_setup::register_map_initial_spawnpoint( coordinates[ i ], angles[ i ] );
	}
}

enable_zones()
{
	zone_init( "zone_dock" );
	enable_zone( "zone_dock" );
	zone_init( "zone_dock_puzzle" );
	enable_zone( "zone_dock_puzzle" );
	zone_init( "zone_dock_gondola" );
	enable_zone( "zone_dock_gondola" );
}