pkgname=glestae-svn
pkgver=775
pkgrel=1
pkgdesc="Glest Advanced Engine"
url="http://sf.net/projects/glestae"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('lua>=5.1' 'mesa' 'libvorbis' 'zlib' 'wxgtk' 'freetype2')
makedepends=('cmake' 'svn')
#source=(glestae-src-svn.tar.bz2)
#md5sums=('6acdc62fd80972d8a9e3a2ed16c2b8f4')

_svntrunk=https://glestae.svn.sourceforge.net/svnroot/glestae/trunk
_svnmod=glestae_svn

build() {
	cd "$srcdir"

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	#rm -rf "$srcdir/$_svnmod-build"
	#cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
	#cd "$srcdir/$_svnmod-build"

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	rm -rf build
	mkdir -p build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		"$srcdir/$_svnmod" || return 1
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
}
