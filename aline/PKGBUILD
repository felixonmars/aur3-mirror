# Maintainer: Stefan Seemayer <mail@semicolonsoftware.de>
pkgname=aline
pkgver=011208
pkgrel=2
pkgdesc="An Extensible WYSIWYG Protein Sequence Alignment Editor for Publication Quality Figures"
arch=(any)
url="http://crystal.bcs.uwa.edu.au/px/charlie/software/aline/"
license=('unkown')
depends=('perl>=5.8.0', 'perl-tk')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=$pkgname.install
source=(http://crystal.bcs.uwa.edu.au/px/charlie/software/aline/aline_011208.tar.gz aline.png aline.desktop)
md5sums=('6e462b37bb016de731a3352cc9503cd9'
         '3c495c9ceb8fa092f1a0a02acc98443b'
         '4d756b9d62e1a1825cab43cbbc22a0e0')

build() {
  # no build needed
  echo No build needed.
}

package() {
  cd "$srcdir/aline_$pkgver"
  
  mkdir -p "$pkgdir/usr/share/" "$pkgdir/usr/bin"
  mv "$srcdir/aline_$pkgver/" "$pkgdir/usr/share/aline";
  
  ln -s "/usr/share/aline/bin/aline" "$pkgdir/usr/bin/aline"
  install -Dm644 "$srcdir/aline.png" "$pkgdir/usr/share/pixmaps/aline.png"
  install -Dm644 "$srcdir/aline.desktop" "$pkgdir/usr/share/applications/aline.desktop"
}

# vim:set ts=2 sw=2 et:
