# Maintainer: Thomas Favre-Bulle <thomas.favre-bulle at bull dot net>
pkgname=ttf-octicons
pkgver=2.2.0
pkgrel=1
pkgdesc="GitHub's octicons TrueType font"
arch=(any)
url="http://octicons.github.com/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=('https://github.com/github/octicons/archive/v2.2.0.tar.gz')
md5sums=('941697fbddf4a04c2514f548d8818350')
install=$pkgname.install

package() {
  install -Dm644 "$srcdir/octicons-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/ttf-octicons/LICENSE.txt"
  install -d "$pkgdir/usr/share/fonts/TTF"
  cp -dpr --no-preserve=ownership "$srcdir/octicons-$pkgver/octicons/octicons-local.ttf" "$pkgdir/usr/share/fonts/TTF/"
}
