# Maintainer: TDY <tdy@archlinux.info>

pkgname=kognite
pkgver=20081004
pkgrel=2
pkgdesc="A personal document manager"
arch=('i686' 'x86_64')
url="http://kognite.googlecode.com/"
license=('GPL3')
depends=('poppler-qt' 'xapian-core')
source=(http://$pkgname.googlecode.com/files/Kognite_source_$pkgver.zip
        $pkgname-$pkgver-qt.diff
        $pkgname.desktop)
md5sums=('d8402d09c5c61fcc0aff4d67a66c3811'
         '311e173c26364046eb6cbfe5e37fa4c9'
         '965e554b8d5a3b4fe883ee779ffe26cf')

build() {
  cd "$srcdir/Kognite"
  patch -Np1 -i ../$pkgname-$pkgver-qt.diff
  sh build-linux
}

package() {
  cd "$srcdir/Kognite"
  install -Dm755 Kognite "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
