# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>

_pkg=FluidR3
pkgname=fluidr3
pkgver=122501
pkgrel=7
pkgdesc="Large MIDI soundfont for timidity++ and other midi players"
arch=('any')
url="http://www.hammersound.net"
license=('custom:Public Domain')
makedepends=('sfarkxtc')
install="$pkgname.install"
#source=("http://sunsite.univie.ac.at/musicres/thammer/HammerSound/localfiles/soundfonts/FluidR3$pkgver.zip"
#source=("http://soundfonts.homemusician.net/files/$_pkg$pkgver.zip"
source=("http://www.ibiblio.org/thammer/HammerSound/localfiles/soundfonts/$_pkg$pkgver.zip"
        "license")
md5sums=('acf366e7161c46d0422805109c2b8151'
         'f73c7a86201ed5932baca12e1a435a04')

build() {
  cd "$srcdir"

  sfarkxtc "$_pkg GM.sfArk"
}

package() {
  cd "$srcdir"

  # soundfont
  install -Dm644 "$_pkg GM.SF2" "$pkgdir/usr/share/soundfonts/$pkgname/${_pkg}GM.SF2"

  # doc
  install -Dm644 *.doc "$pkgdir/usr/share/doc/$pkgname/${_pkg}-Readme.doc"

  # license
  install -Dm644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
