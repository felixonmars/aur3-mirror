# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=naspro-bridge-it
pkgver=0.5.0
pkgrel=1
pkgdesc="A little helper library to develop insert-your-API-here to LV2 bridges."
arch=('i686' 'x86_64')
url="http://naspro.sourceforge.net/"
license=('LGPL')
groups=('naspro')
depends=("naspro-core>=$pkgver")
makedepends=('lv2')
options=('!libtool')
source=("http://download.sourceforge.net/project/naspro/naspro/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('d467e9f164a568ce210090be641f0c64')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --enable-static=no
  make && make html
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
