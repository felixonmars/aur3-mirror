# Maintainer: speps <speps at aur dot archlinux dot org>

DLAGENTS[1]+=' -A "Mozilla/4.0"'

pkgname=urbanlightscape
pkgver=1.3.3
pkgrel=1
pkgdesc="A photo filter for exposure, brightness and lighting correction."
arch=(i686 x86_64)
url="http://www.indii.org/software/urbanlightscape"
license=('GPL')
depends=('wxgtk' 'desktop-file-utils')
makedepends=('boost')
install="$pkgname.install"
source=("http://www.indii.org/files/$pkgname/releases/$pkgname-$pkgver.tar.gz"
        "http://www.indii.org/images/urbanlightscape_128.png" "$pkgname.desktop")
md5sums=('08e2b3b0c940f35ac8c4f7a3fac3f199'
         'b6940433e6e0bcd85fea1e311c520804'
         '5e539ae8c7b40974a135c78e9650ab02')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install

  # desktop file
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icon
  install -Dm644 ../${pkgname}_128.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
