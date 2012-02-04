# Contributor: Ray Rashif <schivmeister@gmail.com>

pkgname=midirandomizer
_pkgname=MidiRandomizer
pkgver=0.8
pkgrel=2
pkgdesc="Generate randomized MIDI SMF and PAT files"
arch=(any)
url="http://midirandomizer.sourceforge.net/"
license=('GPL')
depends=('java-runtime')
source=(http://downloads.sourceforge.net/midirandomizer/$_pkgname.$pkgver.bin.zip)

build() {
  cd "$srcdir"

  install -Dm644 $_pkgname.jar "$pkgdir/usr/share/$pkgname/$_pkgname.jar"
  install -Dm755 ../$pkgname.sh "$pkgdir/usr/bin/$pkgname"
}
md5sums=('2a4e7dbc44445aa8498ab7dddeba5b76')
