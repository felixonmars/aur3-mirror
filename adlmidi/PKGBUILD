# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=adlmidi
pkgver=1.2.1
pkgrel=1
pkgdesc="OPL3 MIDI player emulation (with FM synthesis)."
arch=(i686 x86_64)
url="http://bisqwit.iki.fi/source/adlmidi.html"
license=('GPL')
depends=('sdl')
source=("http://bisqwit.iki.fi/src/arch/$pkgname-$pkgver.tar.bz2"
        "https://raw.github.com/kode54/adlmidi/master/fraction")
md5sums=('37cb1340f8e80a801cf385e4f28f7466'
         'eb0c19aa0c45b173669bfa701d70a82a')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # use specific folder for data
  sed -i "s|Load.*(\"|&/usr/share/$pkgname/|g" *.cc

  # missing source file
  install -Dm644 ../fraction .
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # bins
  install -d "$pkgdir/usr/bin"
  install -Dm 755 `find . -perm -a=x -type f` "$pkgdir/usr/bin"

  # data
  install -d "$pkgdir/usr/share/$pkgname"
  cp -a `find * -type d` "$pkgdir/usr/share/$pkgname"
}

# vim:set ts=2 sw=2 et:
