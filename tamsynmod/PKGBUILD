# Maintainer: stlarch  stlarchie@gmail.com
# Tamsyn font by Scott Fial, icons by stlarch

pkgname=tamsynmod
pkgver=1.7
pkgrel=1
pkgdesc="Tamsyn font with added status icons"
arch=('any')
url="http://sourceforge.net/projects/tamsynmod"
license=('GPL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=tamsynmod.install
source=("http://sourceforge.net/projects/tamsynmod/files/$pkgname-$pkgver.tar.gz")

build () {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/fonts/local"

  install -m644 * "$pkgdir/usr/share/fonts/local/"
}
md5sums=('dc10e2b3c2dae4fef3539d0a8417df8b')
