# Maintainer: SpepS <dreamspepser at yahoo dot it>

_name=Add64
pkgname=add64
pkgver=1.2.2
pkgrel=1
pkgdesc="An additive synthesizer with Jack support"
arch=(i686 x86_64)
url="http://add64.sourceforge.net/"
license=('GPL3')
depends=('qt' 'jack')
install="$pkgname.install"
source=("https://downloads.sourceforge.net/project/$pkgname/$_name-$pkgver.tar.bz2"
        "$pkgname.png::http://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Ambox_emblem_plus.svg/96px-Ambox_emblem_plus.svg.png"
        "$pkgname.desktop")
md5sums=('9799d5b5ca88b04b194d832c29a78c46'
         '91d64b748b688e4b087ba99760ac2628'
         'b724925782302c9e077f33550a9e9e93')

build() {
  cd "$srcdir/$_name-$pkgver"

  qmake
  make
}

package() {
  cd "$srcdir/$_name-$pkgver"

  # bin
  install -Dm755 $_name "$pkgdir/usr/bin/$pkgname"

  # desktop file
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icon
  install -Dm644 ../$pkgname.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
