# Maintainer: speps <speps at aur dot archlinux dot org>

_name=Add64
pkgname=add64
pkgver=1.2.3
pkgrel=1
pkgdesc="An additive synthesizer with Jack support"
arch=(i686 x86_64)
url="http://add64.sourceforge.net/"
license=('GPL3')
depends=('qt4' 'jack')
install="$pkgname.install"
source=("https://downloads.sourceforge.net/project/$pkgname/$_name-$pkgver.tar.bz2"
        "$pkgname.png::http://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Ambox_emblem_plus.svg/96px-Ambox_emblem_plus.svg.png"
        "$pkgname.desktop")
md5sums=('89db8b0c3b35603bc978d490f7ac7ae7'
         '91d64b748b688e4b087ba99760ac2628'
         'b724925782302c9e077f33550a9e9e93')

build() {
  cd "$srcdir/$_name-$pkgver"

  qmake-qt4
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
