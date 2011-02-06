#Contributor: Michael Krauss <hippodriver@gmx.net>
#old contributor: Jacek Poplawski <jacekpoplawski@gmail.com> 

pkgname=lgeneral-data
pkgver=1.2
pkgrel=2
pkgdesc="automatic download of data files for lgeneral"
url="http://lgames.sourceforge.net/index.php?project=LGeneral"
license=('GPL' 'custom') # see lgeneral package
depends=("lgeneral")
arch=('x86_64' 'i686')
source=(http://downloads.sourceforge.net/lgeneral/pg-data.tar.gz)

build() {
	# create directory layout for scenario data
	mkdir -p $startdir/pkg/usr/share/games/lgeneral/{ai_modules,convdata,maps,nations,sounds,themes,campaigns,gfx,music,scenarios,terrain,units}
	cd $startdir/pkg/usr/share/games/lgeneral
	mkdir gfx/{flags,terrain,units}
	mkdir themes/default
	# convert PG data
	cd $startdir/src
        lgc-pg -s $startdir/src/pg-data -d $startdir/pkg/usr/share/games/lgeneral
}

md5sums=('40c4be23f60d1dc732aabe13b58fc5e3')

