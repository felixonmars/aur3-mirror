# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Victor Feight <vrfeight3 at gmail dot com>

pkgname=ttf-weather
pkgver=1.0
pkgrel=2
pkgdesc="A font of weather symbols"
arch=('any')
url="http://www.dafont.com/weather.font"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=($pkgname-$pkgver.zip::"http://img.dafont.com/dl/?f=weather")
install=ttf.install
md5sums=('517189f8160e9b2b67f508131eb3d699')

package() {
  cd "$srcdir"
  install -Dm644 wef_____.ttf "$pkgdir/usr/share/fonts/TTF/weather.ttf"
  install -Dm644 orderme.txt "$pkgdir/usr/share/licenses/$pkgname/orderme.txt"
  install -Dm644 aboutwe.txt "$pkgdir/usr/share/licenses/$pkgname/aboutwe.txt"
}

# vim:set ts=2 sw=2 et:
