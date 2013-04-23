# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=jmess
pkgver=1.0.1
pkgrel=2
pkgdesc="A utility to save your jack audio connections."
arch=(i686 x86_64)
url="http://code.google.com/p/jmess-jack/"
license=('GPL')
depends=('qt4' 'jack')
source=("http://jmess-jack.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('ffc3d246d4bbae632c40754c85a1d927')

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  qmake-qt4
  make release
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"
  install -Dm 755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
