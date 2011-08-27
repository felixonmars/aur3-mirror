# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=kmobiletools
pkgver=1.5.0SVN20101222
pkgrel=1
pkgdesc="Allows to synchronize and manage mobile phones with your PC"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://opendesktop.org/content/show.php?content=15259"
depends=('kdebase-runtime' 'gammu' 'kdepimlibs')
makedepends=('cmake' 'automoc4' 'boost' 'docbook-xsl')
install="${pkgname}.install"
source=("http://opendesktop.org/CONTENT/content-files/15259-${pkgname}-${pkgver}.tar.bz2")
md5sums=('03f83c33fed37d6bc9f9fb240f09bdc8')

build() {
  cd "${srcdir}"
  mkdir build
  cd build
  cmake ../${pkgname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
}
