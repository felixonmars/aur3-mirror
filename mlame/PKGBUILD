# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Andrey Semenov <russianpirate@gmail.com>

pkgname=mlame
pkgver=3.99.5
pkgrel=1
pkgdesc="A shell wrapper for LAME to encode multiple MP3s simultaneously"
arch=('any')
url="http://lame.sourceforge.net/"
license=('LGPL')
depends=('lame')
source=(http://downloads.sourceforge.net/lame/lame-$pkgver.tar.gz)
md5sums=('84835b313d4a8b68f5349816d33e07ce')

package() {
  install -Dm755 "$srcdir/lame-$pkgver/misc/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
