# Maintainer: TheCreeper <loxoko@gmail.com>

pkgname="opentracker-latest"
pkgver=20121118
libowfatver=0.29
pkgrel=2
pkgdesc="An open and free bittorrent tracker project. It aims for minimal resource usage and is intended to run on your wlan router."
arch=( "i686" "x86_64" "armv6h" )
url="http://erdgeist.org/arts/software/opentracker/"
license=( "custom" )
depends=( "zlib" "gcc-libs" )
backup=( "etc/opentracker.conf" )
source=( "https://github.com/mateuszzawisza/opentracker/archive/master.tar.gz"

    "opentracker.service"
    "license.txt"
    "http://dl.fefe.de/libowfat-$libowfatver.tar.bz2"
)
md5sums=( "cfc35e3888c7784a5ad9f4b8d935624c"

    "0a755112732e4d6f37b0b4ac986120ea"
    "01e8892d9985602b06ff033bffbb927a"
    "1187c6acf11429e7adb9ebe180f644bb"
)

build() {

    cd $srcdir/libowfat-$libowfatver/

    make

    cd $srcdir/opentracker-master/

    #DWANT_V6 > Compile in IPV6 only support.

    #DWANT_ACCESSLIST_BLACK > Compile in a blacklist of allowed torrents.
    #DWANT_ACCESSLIST_WHITE > Compile in a whitelist of allowed torrents. Only one can be used.

    #FDWANT_SYNC_LIVE > Compile in support for running in clusters.
    #DWANT_IP_FROM_QUERY_STRING > ?
    #DWANT_COMPRESSION_GZIP > Compile in support for 
    #DWANT_COMPRESSION_GZIP_ALWAYS
    #DWANT_LOG_NETWORKS > Experimental or old feature. No idea what this does.
    #DWANT_RESTRICT_STATS > 
    #DWANT_IP_FROM_PROXY > Experimental or old feature. No idea what this does.
    #DWANT_FULLLOG_NETWORKS > Experimental or old feature. No idea what this does.
    #DWANT_LOG_NUMWANT > Experimental or old feature. No idea what this does.
    #DWANT_MODEST_FULLSCRAPES > Experimental or old feature. No idea what this does.
    #DWANT_SPOT_WOODPECKER > Experimental or old feature. No idea what this does. 
    #DWANT_SYSLOGS
    #DWANT_DEV_RANDOM > Experimental or old feature. No idea what this does.
    #DWANT_FULLSCRAPE > Compile in support for querying opentracker for all tracked torrents. Defualt. Change Makefile to compile out this support.

    #D_DEBUG_HTTPERROR

    make    LIBOWFAT_HEADERS="../libowfat-$libowfatver" \
            LIBOWFAT_LIBRARY="../libowfat-$libowfatver" \
            FEATURES="-DWANT_SYSLOGS -DDEBUG_HTTPERROR"
}

package() {

    cd $srcdir/

    install -d $pkgdir/usr/bin/
    install -m 755 opentracker-master/opentracker $pkgdir/usr/bin/

    install -d $pkgdir/usr/lib/systemd/system
    install -m 755 opentracker.service $pkgdir/usr/lib/systemd/system/

    install -d $pkgdir/etc/
    install -m 644 opentracker-master/opentracker.conf.sample $pkgdir/etc/opentracker.conf

    install -d $pkgdir/usr/share/doc/opentracker/
    install -m 644 opentracker-master/opentracker.conf.sample $pkgdir/usr/share/doc/opentracker/

    install -d $pkgdir/usr/share/licenses/opentracker/
    install -m 644 license.txt $pkgdir/usr/share/licenses/opentracker/
}