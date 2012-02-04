# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=otf-isabella
_pkgname=Isabella
pkgver=1.202
pkgrel=1
pkgdesc="A font based on the calligraphic hand used in the Isabella Breviary"
arch=('any')
url="http://www.thibault.org/fonts/isabella/"
license=('LGPL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=otf.install
source=("http://www.thibault.org/fonts/isabella/$_pkgname-$pkgver-ttf.tar.gz")
md5sums=('00bf298551484725092fa6ec3e193a73')

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 "$_pkgname.otf" "$pkgdir/usr/share/fonts/OTF/$_pkgname.otf"
}
