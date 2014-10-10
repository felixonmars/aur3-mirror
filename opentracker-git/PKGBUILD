# Maintainer: TheCreeper <loxoko@gmail.com>

pkgname=opentracker-git
pkgver=r583.6c60309
pkgrel=1
pkgdesc="Opentracker is a open and free bittorrent tracker project. It aims for minimal resource usage and is intended to run at your wlan router."
arch=('any')
url="http://erdgeist.org/arts/software/opentracker/"
license=('custom')
depends=('libowfat')
makedepends=(
	'git'
	#'cvs'
	'make'
	'gcc'
	'gcc-libs'
	'dietlibc'
)
backup=("etc/opentracker/config")
source=(
	'opentracker.service'
	'license.txt'
	"$pkgname"::'git://erdgeist.org/opentracker')
sha1sums=(
	'f623a45a0722bdc007f1d4b303ff6e3913281953'
	'7cd200ee8ee89ddbd302dbbf63b6993bc51d4e3e'
	'SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {

	## BEWARE:
	## I had problems compiling this on arm using the new verson of GCC.

	####
	## Build Libowfat
	####

	## Pull in libowfat
	#msg "Pulling in libowfat"
	#cvs -d :pserver:cvs@cvs.fefe.de:/cvs -z9 co libowfat

	## Compile libowfat
	#msg "Compiling libowfat"
	#cd "$srcdir/libowfat"
	#make

	####
	## Build Opentracker
	####

	####
	## The following is a list of compile time options
	## Add them to the 'FEATURES' option of the make command below

	#DWANT_V6 > Compile in IPV6 only support.

	## Only one of the following accesslist options can be used.
	#DWANT_ACCESSLIST_BLACK > Compile in a blacklist of allowed torrents.
	#DWANT_ACCESSLIST_WHITE > Compile in a whitelist of allowed torrents.

	#FDWANT_SYNC_LIVE > Compile in support for running in clusters.
	#DWANT_IP_FROM_QUERY_STRING > Experimental or old feature. No idea what this does.
	#DWANT_COMPRESSION_GZIP > Compile in support for GZIP. This is used when downloading scrapes.
	#DWANT_COMPRESSION_GZIP_ALWAYS > Always compress scrapes using GZIP before serving them to clients.
	#DWANT_LOG_NETWORKS > Experimental or old feature. No idea what this does.
	#DWANT_RESTRICT_STATS > Compile in support for restricting tracker stats based on IP. Can be configured in the configuration file.
	#DWANT_IP_FROM_PROXY > Experimental or old feature. No idea what this does.
	#DWANT_FULLLOG_NETWORKS > Experimental or old feature. No idea what this does.
	#DWANT_LOG_NUMWANT > Experimental or old feature. No idea what this does.
	#DWANT_MODEST_FULLSCRAPES > Experimental or old feature. No idea what this does.
	#DWANT_SPOT_WOODPECKER > Experimental or old feature. No idea what this does.
	#DWANT_SYSLOGS > Experimental or old feature. No idea what this does.
	#DWANT_DEV_RANDOM > Experimental or old feature. No idea what this does.
	#DWANT_FULLSCRAPE > Compile in support for querying opentracker for all tracked torrents. Defualt. Change Makefile to compile out this support.

	#D_DEBUG_HTTPERROR > This should add in support for serving errors to clients when pages like 127.0.0.1:6969/random are accessed which are not used by opentracker.

	msg "Compiling Opentracker"
	cd "$srcdir/opentracker-git/"

	make 	LIBOWFAT_HEADERS="/usr/include" \
		LIBOWFAT_LIBRARY="/usr/lib" \
		#LIBOWFAT_HEADERS="../libowfat" \
		#LIBOWFAT_LIBRARY="../libowfat" \
		FEATURES="-DWANT_SYSLOGS -DDEBUG_HTTPERROR" \
		CC="/opt/diet/bin/diet gcc"
}

package() {

	msg "Preparing the package"

	cd "$srcdir/"

	install -d $pkgdir/usr/bin/
	install -m 755 opentracker-git/opentracker $pkgdir/usr/bin/

	install -d $pkgdir/usr/lib/systemd/system
	install -m 755 opentracker.service $pkgdir/usr/lib/systemd/system/

	install -d $pkgdir/etc/opentracker
	install -m 644 opentracker-git/opentracker.conf.sample $pkgdir/etc/opentracker/config

	install -d $pkgdir/usr/share/doc/opentracker/
	install -m 644 opentracker-git/opentracker.conf.sample $pkgdir/usr/share/doc/opentracker/config

	install -d $pkgdir/usr/share/licenses/opentracker/
	install -m 644 license.txt $pkgdir/usr/share/licenses/opentracker/

	msg "Finished"
}