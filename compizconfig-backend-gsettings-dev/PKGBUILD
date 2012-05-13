# Maintainer: Nathan Hulse <nat.hulse@gmail.com>

pkgname=compizconfig-backend-gsettings-dev
_pkgseries=0.9.5
pkgver=${_pkgseries}.92
pkgrel=1
pkgdesc="GSettings backend for Compiz"
url="https://launchpad.net/compiz-compizconfig-gsettings"
license=('GPL' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
depends=('gconf' 'dconf' 'libcompizconfig-dev')
makedepends=('intltool' 'cmake')
provides=('compizconfig-backend-gsettings')
conflicts=('compizconfig-backend-gsettings')
groups=('compiz-dev')
install='compizconfig-backend-gsettings-dev.install'
source=("https://launchpad.net/compiz-compizconfig-gsettings/${_pkgseries}/${pkgver}/+download/compizconfig-backend-gsettings-${pkgver}.tar.bz2")
md5sums=('8f38de7e58a34d352c505de990f4f8b8')

build()
{
	cd "compizconfig-backend-gsettings-${pkgver}"
	[[ -d build ]] || mkdir build
	cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE="Release" \
    -DCOMPIZ_BUILD_WITH_RPATH=FALSE \
    -DCOMPIZ_DESTDIR="${pkgdir}"
  make
}

package() {
	cd "compizconfig-backend-gsettings-${pkgver}/build"
	make install
  rm -f "${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled"
}
