# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: w0rm <w0rmtux@gmail.com>

pkgname=obexpushd
pkgver=0.10.1
pkgrel=1
pkgdesc="Can be used to receive files via Bluetooth/IrDA/TCP"
arch=('i686' 'x86_64')
url="http://www.gitorious.org/obexpushd"
license=('GPL2')
depends=('openobex')
makedepends=('cmake' 'pkgconfig' 'xmlto')
optdepends=('tcp_wrappers')
source=(http://www.hendrik-sattler.de/downloads/$pkgname/0.10/$pkgname-$pkgver-source.tar.gz)
md5sums=('f917b5cdf19a04134c255c311181a67a')

build() {
  cd ${srcdir}
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver}-source \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make || return 1
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install || return 1

  install -D -m644 $pkgdir/usr/share/doc/obexpushd/LICENSE \
    $pkgdir/usr/share/licenses/$pkgname/LICENSE
  rm -rf $pkgdir/usr/share/doc
}
