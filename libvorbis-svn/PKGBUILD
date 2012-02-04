pkgname=libvorbis-svn
pkgver=16950
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc="Vorbis codec library"
url="http://www.xiph.org/ogg/vorbis"
license=('custom')
depends=('libogg>=1.1.4')
makedepends=('subversion')
provides=('libvorbis=1.3.1')
conflicts=('libvorbis')

_svntrunk=http://svn.xiph.org/trunk/vorbis
_svnmod=libvorbis

build() {
	cd "$srcdir"

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_svnmod-build"
	cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
	cd "$srcdir/$_svnmod-build"

	./autogen.sh --prefix=/usr
	make || return 1
	make DESTDIR="$pkgdir/" install || return 1

	rm -rf "$srcdir/$_svnmod-build"
}

