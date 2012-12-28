# Maintainer: Francesc Ortiz <francescortiz@gmail.com>
pkgname=font2otf
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Convert a font to Open Type OTF"
arch=('any')
url="http://www.francescortiz.net/"
license=('GPL')
groups=()
depends=('fontforge')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(font2otf font2otf.ff)
noextract=()
md5sums=() #generate with 'makepkg -g'

build() {
  echo "nothing to do"
}

check() {
  echo "nothing to do"
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/font2otf" "$pkgdir/usr/bin"
  cp "$srcdir/font2otf.ff" "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
md5sums=('02748ab66f453137c6cb5da4b515c5bc'
         'e6b0fcde74e4742a4b4bd9ff6b264a90')
