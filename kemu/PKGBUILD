
# Contributor: A Rojas (nqn1976 @ gmail.com)

pkgname=kemu
pkgver=0.0.4
pkgrel=2
pkgdesc="A graphical front-end for QEMU and KVM"
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php?content=116980"
license=('GPL')
depends=('qemu' 'kdebindings-korundum')
makedepends=('cmake' 'automoc4')
source=(http://rpdev.net/projects/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('2d78f1b0e0db99c087c8c16e6c391dab')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/src/ui
  make ui
  cd "../.."
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}
