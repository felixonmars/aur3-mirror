pkgname=compizconfig-backend-gconf-dev
pkgseries=0.9.5
pkgver=${pkgseries}.92
pkgrel=1
pkgdesc="GConf backend for Compiz 0.9.x"
url="http://www.compiz.org/"
install="compizconfig-backend-gconf-dev.install"
license=('GPL' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
#depends=('gconf' 'libcompizconfig-dev')
makedepends=('intltool' 'cmake')
provides=('compizconfig-backend-gconf')
conflicts=('compizconfig-backend-gconf')
source=("https://launchpad.net/compiz-compizconfig-gconf/${pkgseries}/${pkgver}/+download/compizconfig-backend-gconf-${pkgver}.tar.bz2")
md5sums=('c298fa74921cfd0360b3eef3c0b527ef')

build()
{
	cd "compizconfig-backend-gconf-${pkgver}"
	[[ -d build ]] || mkdir build
	cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCOMPIZ_DESTDIR="${pkgdir}"
    make
}
package() {
	cd "compizconfig-backend-gconf-${pkgver}"
	make install
}
