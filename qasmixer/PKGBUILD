# Contributor: Spyros Stathopoulos <foucault.online@gmail.com>
# Maintainer: Spyros Stathopoulos <foucault.online@gmail.com>

pkgname='qasmixer'
pkgver=0.15
pkgrel=3
pkgdesc="A mixer application for the Linux sound system ALSA powered by a Qt GUI."
arch=('i686' 'x86_64')
license=('GPL3')
url="http://xwmw.org/qasmixer/"
depends=('qt')
makedepends=('cmake')
install='qasmixer.install'
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgver}/${pkgname}_${pkgver}.tar.xz")
md5sums=('279bafdd67155676f2b622903155bf9d')

build() {
  cd ${srcdir}
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../${pkgbase}_${pkgver}
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install
}

