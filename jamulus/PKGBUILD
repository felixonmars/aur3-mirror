# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=jamulus
pkgver=3.3.5
pkgrel=1
pkgdesc="Low-Latency (Internet) Connection tool for real-time jam sessions"
arch=(i686 x86_64)
url="http://llcon.sourceforge.net/"
license=('GPL')
depends=('qt5-base' 'jack')
provides=('llcon')
replaces=('llcon')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/llcon/Jamulus/$pkgver/Jamulus-$pkgver.tar.gz"
        "$pkgname.png::http://c.fsdn.com/allura/p/llcon/icon")
md5sums=('ee2b0f24aba8f4b526920667261a7194'
         'fdac338459a0a7a3cd970f81a2b8fd95')

build() {
  cd Jamulus$pkgver
  qmake
  make
}

package() {
  cd Jamulus$pkgver

  # bin
  install -Dm755 Jamulus "$pkgdir/usr/bin/$pkgname"

  # desktop file
  install -Dm644 src/res/$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icon
  install -Dm644 ../$pkgname.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
