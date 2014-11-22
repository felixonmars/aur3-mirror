# Maintainer: Alcasa Mz <alcasa.mz@gmail.com>
pkgname=sni-qt
pkgver=0.2.6
pkgrel=2
pkgdesc="A Qt plugin which turns all QSystemTrayIcon into StatusNotifierItems (appindicators)"
arch=('i686' 'x86_64')
url="https://launchpad.net/sni-qt"
license=('GPL')
depends=('qt4' 'libdbusmenu-qt')
makedepends=('cmake')
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.bz2
        sni-qt.conf)
md5sums=('e84c66e776f7c22c961817387f618c81'
         '4bc8bd4cd17006c6d3ce2cd320c8e7b2')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Disable building tests
  sed -i '/tests/ d' CMakeLists.txt

  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # Install config file for apps that need "Activate" action
  install -Dm644 "$srcdir/sni-qt.conf" "$pkgdir/etc/sni-qt.conf"
}
