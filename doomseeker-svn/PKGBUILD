# Contributor: Wesley <rudirennsau_at_hotmail_dot_com>

pkgname=doomseeker-svn
pkgver=589
pkgrel=1
pkgdesc="Multiplayer Lobby for Doom ports (ZDaemon, Chocolate Doom, Vavoom, Skulltag and Odamex)"
arch=('i686' 'x86_64')
url="http://skulltag.net/doomseeker"
conflicts=('doomseeker')
provides=('doomseeker')
depends=('qt' 'zlib')
makedepends=('cmake' 'svn')
license=('GPL')
source=(doomseeker.sh doomseeker.desktop)
md5sums=('d03909d5d98e31cae480a3dd598a17ef' 'e2c32666b75fb56d4f0221d255598cb2')

_svntrunk=svn://skulltag.net/doomseeker/trunk
_svnmod=trunk

build() {
	cd $startdir/src

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	cd $_svnmod
	cmake .
	make || return 1
}

package() {
	mkdir -p $startdir/pkg/opt/doomseeker
	cp $startdir/src/$_svnmod/doomseeker $startdir/pkg/opt/doomseeker/
	cp $startdir/src/$_svnmod/libwadseeker.so $startdir/pkg/opt/doomseeker/
	cp -r $startdir/src/$_svnmod/media $startdir/pkg/opt/doomseeker/
	cp -r $startdir/src/$_svnmod/engines $startdir/pkg/opt/doomseeker/

	mkdir -p $startdir/pkg/usr/share/{applications,pixmaps}
	install -D -m644 $startdir/src/$_svnmod/media/icon.png $startdir/pkg/usr/share/pixmaps/doomseeker.png
	install -D -m644 $startdir/doomseeker.desktop $startdir/pkg/usr/share/applications/doomseeker.desktop
	install -D -m755 $startdir/doomseeker.sh $startdir/pkg/usr/bin/doomseeker
}