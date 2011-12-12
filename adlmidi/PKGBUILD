# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=adlmidi
pkgver=1.1.2
pkgrel=1
pkgdesc="A commandline program that plays MIDI files using software OPL3 emulation (FM synthesis)."
arch=(i686 x86_64)
url="http://bisqwit.iki.fi/source/adlmidi.html"
license=('GPL')
depends=('sdl')
source=("http://bisqwit.iki.fi/src/arch/$pkgname-$pkgver.tar.bz2")
md5sums=('a7d139042970394752e4b95117dc34c7')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i "s|Load.*(\"|&/usr/share/$pkgname/|g" *.cc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # folders
  install -d "$pkgdir"/usr/{bin,share/$pkgname}

  # bins
  install -Dm 755 `find . -perm -a=x -type f` "$pkgdir/usr/bin"

  # data
  cp -a `find * -type d` "$pkgdir/usr/share/$pkgname"
}

# vim:set ts=2 sw=2 et:
