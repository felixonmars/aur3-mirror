# Maintainer: Ian Brunton <iandbrunton at gmail dot com>
pkgname=ttf-digital-readout
pkgver=1.1
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Several styles of digital readouts including condensed, upright, slanted, and thick."
arch=('any')
license=('custom')
url=(http://www.shyfoundry.com/)
source=(http://www.shyfoundry.com/fonts/download/win/sfdigitalr.zip)
md5sums=('1659ad07af649b940e2b16a3c8327f91')
install=$pkgname.install

package()
{
  mkdir -p "$pkgdir/usr/share/fonts/TTF"
  cp "$srcdir"/TrueType/*.ttf "$pkgdir/usr/share/fonts/TTF"
  mkdir -p "$pkgdir/usr/share/licences/ttf-digital-readout"
  cp "$srcdir/ShyFoundry Freeware EULA.pdf" "$pkgdir/usr/share/licences/ttf-digital-readout/"
}
