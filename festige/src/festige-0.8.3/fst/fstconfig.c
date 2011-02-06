
/*
 * fstconfig
 *
 * generates .fst files to speed up plugin discovery
 * 
 */

#include <dirent.h>

void scandirectory( const char *dir ) {
    
    struct dirent *entry;
    DIR *d = opendir( dir );

    if( !d ) return;

    while( entry = readdir( d ) ) {
	if( strstr( entry->d_name, ".dll" ) ) {
	    char *fullname = (char *) malloc( strlen( dir ) + strlen( entry->d_name ) + 2 );
	    sprintf( fullname, "%s/%s", dir, entry->d_name );
	    
	    fst_error( "checking %s\n", fullname );
	    fst_get_info( fullname );
	}
    }

}

int main( int argc, char **argv ) {

    int i;

    if( fst_init( 0 ) ) return -1;

    for( i=1; i<argc; i++ )
	scandirectory( argv[i] );

    return 0;
}
