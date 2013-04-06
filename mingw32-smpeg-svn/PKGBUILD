# Maintainer: Andreas Krinke <andreas.krinke@gmx.de>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alex Ghoust <ghoust@skyper.homelinux.org>

pkgname=mingw32-smpeg-svn
pkgver=399
pkgrel=1
pkgdesc="SDL MPEG Player Library (mingw32)"
arch=('i686' 'x86_64')
url="http://icculus.org/smpeg/"
license=('LGPL')
depends=('mingw32-sdl')
makedepends=()
optdepends=()
options=(!strip !buildflags !libtool)
_svntrunk='svn://svn.icculus.org/smpeg/trunk'
_svnmod='smpeg'

build() {
	msg "Using revision 399 (libSDL 2.0 support in r400 breaks compatibility)"
	cd $srcdir

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r 399)
	else
		svn co $_svntrunk --config-dir ./ -r 399 $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	if [ -d $srcdir/$_svnmod-build ]; then
		rm -r $srcdir/$_svnmod-build
	fi
	unset LDFLAGS
	cd smpeg
	./autogen.sh || return 1
	PKG_CONFIG= SDL_CONFIG=/usr/i486-mingw32/bin/sdl-config ./configure \
		--prefix=/usr/i486-mingw32 --disable-static \
		--build=i686-pc-linux-gnu --target=i486-mingw32 --host=i486-mingw32 \
		--disable-opengl-player --disable-gtk-player || return 1
	make CXXLD='$(CXX) -no-undefined' || return 1
	make DESTDIR="$pkgdir" install || return 1
}
