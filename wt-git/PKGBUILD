# Maintainer: Tomas Volf <volf.tomas@jstation.cz>

pkgname=wt-git
pkgver=2015.03.16.g76463ee
pkgrel=1
pkgdesc="A C++ library and application server for developing and deploying web applications."
arch=('i686' 'x86_64')
url="http://www.webtoolkit.eu/"
license=('GPL')
depends=('boost-libs' 'libharu' 'graphicsmagick' 'pango' 'zlib')
makedepends=('git' 'cmake' 'boost' 'postgresql-libs' 'fcgi' 'sqlite' 'doxygen' 'mesa' 'glu' 'mysql++' 'qt4')
optdepends=('openssl: for SSL support in built-in webserver'
            'fcgi: for FastCGI support'
            'postgresql-libs: for PostgreSQL Dbo support'
            'sqlite: for Sqlite Dbo support'
            'mysql++: for the hangman example'
            'qt4: for the Wt/Qt interopability example (wtwithqt)')
backup=('etc/wt/wt_config.xml')
conflicts=('wt')
provides=('wt')
source=("git+https://github.com/kdeforche/wt.git")
md5sums=('SKIP')

_gitname='wt'

pkgver() {
    cd "$srcdir/$_gitname"
    git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

build() {
	cd ${srcdir}/${_gitname}

	[[ -d build ]] && rm -r build
	mkdir -p build && cd build

	cmake \
		-DCONNECTOR_FCGI=ON \
		-DCONNECTOR_HTTP=ON \
		-DWT_CPP_11_MODE=-std=c++0x \
		-DWT_WRASTERIMAGE_IMPLEMENTATION=GraphicsMagick \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DWEBUSER=http \
		-DWEBGROUP=http \
		-DUSE_SYSTEM_SQLITE3=ON \
		..

	make
}

package() {
	cd ${srcdir}/${_gitname}/build

	make DESTDIR=${pkgdir} install

	install -Dm644 ${pkgdir}/usr/cmake/FindWt.cmake ${pkgdir}/usr/share/cmake-3.1/Modules/FindWt.cmake
	rm -r ${pkgdir}/usr/cmake
	rm -rf $pkgdir/var/run

	mkdir -p ${pkgdir}/etc/wt
	install -Dm644 ${srcdir}/${_gitname}/build/wt_config.xml ${pkgdir}/etc/wt/wt_config.xml
}
