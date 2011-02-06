# Maintainer: TDY <tdy@gmx.com>

pkgname=ttf-staypuft
pkgver=1.0
pkgrel=1
pkgdesc="A quirky font inspired by the Stay Puft Marshmallow Man from Ghostbusters"
arch=('i686' 'x86_64')
url="http://www.thibault.org/fonts/staypuft/"
license=('LGPL')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://www.thibault.org/fonts/staypuft/StayPuft.ttf.tar.gz)
md5sums=('d0e63e24da1abe749b2debb0d7d87b28')

build() {
  install -Dm644 "$srcdir/StayPuft.ttf" "$pkgdir/usr/share/fonts/TTF/StayPuft.ttf"
}
