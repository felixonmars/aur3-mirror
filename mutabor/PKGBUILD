# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=mutabor
pkgver=4.0.0beta3
pkgrel=1
pkgdesc="A Program that allows performing and composing microtonal music using a normal MIDI keybord."
arch=(i686 x86_64)
url="http://www.math.tu-dresden.de/~mutabor/"
license=('GPL')
depends=('jack' 'wxgtk2.8')
makedepends=('perl')
install="$pkgname.install"
source=("http://download.berlios.de/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop")
md5sums=('92cb8098233168b4010b05eb71227352'
         '3846971fe53cfa052267e38c472b6e0e')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
              --libdir=/usr/lib/$pkgname \
              --with-wx-config=wx-config-2.8 \
              --enable-static=no
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install

  # desktop file
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icon
  install -Dm644 Images/about.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
