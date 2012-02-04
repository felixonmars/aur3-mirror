# Maintainer: Moritz Wilhelmy <moritz plus uiv at wzff dot de>
pkgname=uiv
pkgver=0.15
pkgrel=2
pkgdesc="uiv is a tiny and customizable image viewer written in Tcl/Tk"
arch=('any')
url="http://barfooze.de/~moritz/projects/uiv"
license=('MIT')
depends=('tcl' 'tk' 'tkimg')
source=("http://barfooze.de/~moritz/projects/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('8004df6eec0f11e5d0737b3d69be6d77')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/usr" install
  install -D -m644 uivrc.example $pkgdir/usr/share/doc/uiv/uivrc.example
}

# vim:set ts=2 sw=2 et:
