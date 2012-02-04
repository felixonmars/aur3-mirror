# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=qaddress
pkgver=0.3
pkgrel=1
pkgdesc="A simple and to the point address book. It is written in C++, uses SQLite as database backend and Qt as GUI toolkit."
arch=(i686 x86_64)
url="http://qaddress.sourceforge.net/"
license=('GPL')
depends=('qt')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2"
        "$pkgname.desktop")
md5sums=('6a007a4b302d743296675e50a2d04316'
         '3dde771dea60e736b6bfae6f46284565')

build() {
  cd "$srcdir/$pkgname"

  qmake
  make
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm 755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Desktop file
  install -Dm 644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
