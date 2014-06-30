# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=adlmidi
pkgver=1.2.3
pkgrel=1
pkgdesc="OPL3 MIDI player emulation (with FM synthesis)."
arch=(i686 x86_64)
url="http://bisqwit.iki.fi/source/adlmidi.html"
license=('GPL')
depends=('sdl')
source=("http://bisqwit.iki.fi/src/arch/$pkgname-$pkgver.tar.bz2")
md5sums=('54b94e0ccd87d40874199705045be37c')

prepare() {
  cd $pkgname-$pkgver

  # use specific folder for data
  sed -i "s|Load.*(\"|&/usr/share/$pkgname/|g" *.cc
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver

  # bins
  install -d "$pkgdir/usr/bin"
  install -Dm755 `find . -perm -a=x -type f` "$pkgdir/usr/bin"

  # data
  install -d "$pkgdir/usr/share/$pkgname"
  cp -a `find * -type d` "$pkgdir/usr/share/$pkgname"
}

# vim:set ts=2 sw=2 et:
