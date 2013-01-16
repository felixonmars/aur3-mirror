# Maintainer: TDY <tdy@archlinux.info>

pkgname=ttf-rockets
pkgver=1.0
pkgrel=1
pkgdesc="A font inspired by space travel"
arch=('any')
url="http://thibault.org/fonts/rockets/"
license=('LGPL')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://www.thibault.org/fonts/rockets/Rockets-ttf.tar.gz)
md5sums=('4eb9724d6da65339ab42c116245e0251')

package() {
  cd "$srcdir/rockets"
  install -Dm644 Rockets.ttf "$pkgdir/usr/share/fonts/TTF/Rockets.ttf"
}

# vim:set ts=2 sw=2 et:
