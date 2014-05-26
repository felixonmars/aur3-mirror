# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
# Contributor: Moritz Heidkamp <moritz@twoticketsplease.de>

pkgname=otf-essays
_pkgname=essays1743
pkgver=2.001
pkgrel=1
pkgdesc="A font based on the typeface used in a 1743 English translation of Montaigne's Essays."
arch=('any')
license=('LGPL')
url="http://www.thibault.org/fonts/essays/"
install=otf.install
depends=(xorg-fonts-encodings xorg-fonts-alias xorg-font-utils fontconfig)
source=("http://www.thibault.org/fonts/essays/$_pkgname-$pkgver-1-otf.tar.gz")
md5sums=('3f37a671704d961db58113651b1305bb')

package() {
  cd "$srcdir/$_pkgname"
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF/"
}
