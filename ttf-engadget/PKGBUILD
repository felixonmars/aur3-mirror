# Maintainer: TDY <tdy@gmx.com>

pkgname=ttf-engadget
pkgver=1.001_1
pkgrel=1
pkgdesc="A modernistic font based on the Engadget blog logo"
arch=('any')
url="http://www.thibault.org/fonts/engadget/"
license=('LGPL')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://www.thibault.org/fonts/${pkgname/*-}/${pkgname/*-}-${pkgver/_/-}-ttf.tar.gz)
md5sums=('f9bfa66c4669758ba143459a0e292392')

build() {
  cd "$srcdir/${pkgname/*-}"
  install -Dm644 Engadget.ttf "$pkgdir/usr/share/fonts/TTF/Engadget.ttf"
}
