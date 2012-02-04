# Maintainer: chris_L <chrislcenter dash mamoru at yahoo.com dot mx>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=chocolate-doom-svn
pkgver=2478
pkgrel=1
pkgdesc="A Doom port reproducing the behavior of the original DOS version"
arch=('i686' 'x86_64')
url="http://www.chocolate-doom.org/"
license=('GPL')
depends=('sdl_mixer' 'sdl_net')
makedepends=('svn' 'autoconf' 'automake')
provides=('chocolate-doom')
conflicts=('chocolate-doom')
source=()
md5sums=()

_svntrunk=http://chocolate-doom.svn.sourceforge.net/svnroot/chocolate-doom/trunk/chocolate-doom
_svnmod=chocolate-doom

build() {
	cd $startdir/src
	svn co $_svntrunk -r $pkgver $_svnmod
	cd $_svnmod
	msg "Starting build..."

	sed 's|/games|/bin|g' -i {src,setup}/Makefile.am
	sed 's|share/games|share|g' -i src/d_iwad.c
	sed	-e '/samplerate/d' \
		-e 's| CFLAGS=|: # CFLAGS=|g' \
		-i configure.in

	./autogen.sh --prefix=/usr

	msg "Starting make..."

	make || return 1
	make DESTDIR="$pkgdir" install
}


