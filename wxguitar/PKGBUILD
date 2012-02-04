# Maintainer: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=wxguitar
pkgver=1.01
pkgrel=4
pkgdesc="A simple program to help novice guitarist faster (and better) to tune your guitar."
arch=(i686 x86_64)
depends=('audiere' 'xdg-utils')
makedepends=('make')
source=(http://mirror.amdmi3.ru/distfiles/${pkgname}-${pkgver}.tar.gz)
url="http://code.google.com/p/wxguitar/"
license=('GPL')
md5sums=('cc60ac7d0b8d29b2f33522a014690652')

build() {
  cd ${srcdir}/wxGuitar
  sed -i "s/gitara_icon_64.ico/gitara.png/g" data/wxGuitar.desktop
  ./configure --prefix=/usr
  make
  }

package() {
  cd ${srcdir}/wxGuitar
  make DESTDIR=${pkgdir} install
}
