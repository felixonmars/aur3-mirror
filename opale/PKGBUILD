# Maintainer: TDY <tdy@gmx.com>

pkgname=opale
pkgver=1.1
pkgrel=1
pkgdesc="A personal bank account manager"
arch=('i686' 'x86_64')
url="http://freehackers.org/Opale/"
license=('GPL')
depends=('qt' 'hicolor-icon-theme' 'shared-mime-info')
makedepends=('cmake' 'doxygen')
install=opale.install
source=(http://labs.freehackers.org/attachments/download/436/Opale-$pkgver.tar.bz2)
md5sums=('0ea0f078f20b8222cd093b0c4e00d644')

build() {
  cd "$srcdir/Opale-$pkgver"
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DENABLE_KDE=OFF ..
  make
}

package() {
  cd "$srcdir/Opale-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
