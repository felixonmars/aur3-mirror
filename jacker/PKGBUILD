# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=jacker
pkgver=2010.9.21
pkgrel=3
pkgdesc="A pattern based, tracker-like jack midi sequencer"
arch=('i686' 'x86_64')
url="http://bitbucket.org/paniq/jacker/wiki/Home"
license=('GPL3')
depends=('gtkmm' 'jack' 'desktop-file-utils')
makedepends=('scons')
install="$pkgname.install"
source=("http://bitbucket.org/paniq/jacker/downloads/$pkgname-$pkgver.tar.bz2"
        "$pkgname.desktop")
md5sums=('bf479d2896ddfdd2db3b6ca3cb2848bd'
         '7e3e94c6dafac9422b5ad25fc7908b87')

prepare() {
  # gcc fix
  sed -i 's|insert|this->&|' "$srcdir/$pkgname-$pkgver/model.hpp"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  scons PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  scons DESTDIR="$pkgdir" install

  # desktop file
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icon
  install -Dm644 $pkgname.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
