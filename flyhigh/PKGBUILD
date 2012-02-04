# Maintainer: Matthias Maennich <arch@maennich.net>

pkgname=flyhigh
pkgver=0.9.0
pkgrel=1
pkgdesc="Use your flight devices with Linux"
arch=('i686' 'x86_64')
url="http://flyhigh.sourceforge.net"
license=('GPL')
depends=('qt' 'gnuplot' 'mysql')
makedepends=('cmake')
optdepends=()
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('fbb2ced9041c61b6f45d2c046092b315eb74811fc82a081c08ef5ad583bd67bd')

build() {
  mkdir -p ${srcdir}/$pkgname-$pkgver/build

  cd ${srcdir}/$pkgname-$pkgver/build

  cmake -DCMAKE_INSTALL_PREFIX= -DCMAKE_BUILD_TYPE=Release ..
  
  make
}

package(){
  cd ${srcdir}/$pkgname-$pkgver/build

  make DESTDIR=${pkgdir} install
}
