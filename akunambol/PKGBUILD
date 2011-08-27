# Maintainer: Federico Chiacchiaretta <federico.chia at gmail.com>
pkgname=akunambol
pkgver=0.2.2
pkgrel=1
pkgdesc="A little application that allows you to synchronize your Akonadi data with any SyncML server."
arch=('i686' 'x86_64')
url="http://akunambol.ruphy.org/"
license=('GPL')
depends=('libfunambol' 'liblikeback-git' 'kdepimlibs')
makedepends=('cmake' 'automoc4' 'boost')
install=akunambol.install
source=(http://akunambol.ruphy.org/tarballs/$pkgname-$pkgver.tar.gz)
md5sums=('677ecb446cb1c863cc71067cc3a4fbab')

build() {
  cd ${srcdir}
  mkdir ${srcdir}/build
  cd ${srcdir}/build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ../${pkgname}-${pkgver}
  make
}

package() {
  cd $srcdir/build

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
