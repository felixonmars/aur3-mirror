# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=meterec
pkgver=0.9.1
pkgrel=1
pkgdesc="Console based multi-track monitoring and recording tool."
arch=(i686 x86_64)
url="http://meterec.sourceforge.net/"
license=('GPL')
depends=('jack' 'libconfig')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tgz")
md5sums=('7e2ef4c522bbabc9d701270b2de84122')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # bin
  install -d "$pkgdir/usr/bin"
  install -Dm755 $pkgname{,-init-conf} \
    "$pkgdir/usr/bin"

  # doc
  install -Dm644 README \
    "$pkgdir/usr/share/doc/$pkgname/README"
}
