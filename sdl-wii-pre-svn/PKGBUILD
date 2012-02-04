# Maintainer:  Matthew Bauer <mjbauer95@gmail.com>

pkgname=sdl-wii-pre-svn
pkgver=78
pkgrel=1
pkgdesc="SDL port for the Wii."
makedepends=(libogc-svn "devkitppc>=17" sdl-wii-deps)
arch=(any)
url="http://code.google.com/p/sdl-wii"
license=('custom')

_svntrunk=http://sdl-wii.googlecode.com/svn/trunk/
_svnmod=trunk

build() {
	mkdir -p $pkgdir/opt/devkitpro/libogc/include;
	mkdir -p $pkgdir/opt/devkitpro/libogc/lib/wii;

	cd ${srcdir}

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	cp -r $_svnmod $_svnmod-build
	cd $_svnmod-build/SDL

	make
	make INSTALL_HEADER_DIR=$pkgdir/opt/devkitpro/libogc/include INSTALL_LIB_DIR=$pkgdir/opt/devkitpro/libogc/lib/wii install

	cd ../smpeg;
	make
	make INSTALL_HEADER_DIR=$pkgdir/opt/devkitpro/libogc/include INSTALL_LIB_DIR=$pkgdir/opt/devkitpro/libogc/lib/wii install
}
