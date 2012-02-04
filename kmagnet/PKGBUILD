# Contributor: Álvaro Villalba Navarro <vn.alvaro@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=kmagnet
pkgver=0.10
pkgrel=1
pkgdesc="Simple puzzle game with a built-in puzzle editor."
url="http://www.kde-apps.org/content/show.php/kMagnet?content=109111"
license="GPL"
arch=('i686' 'x86_64')
depends=('kdegames-libkdegames')
makedepends=('cmake' 'automoc4')
source=(http://www.kde-apps.org/CONTENT/content-files/109111-${pkgname}-${pkgver}.tar.bz2)
md5sums=('ca146898c7f7a9f1c189760ee88a0beb')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}