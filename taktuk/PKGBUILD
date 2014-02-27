# Maintainer: tostaky80 <manu -at- lothlorien -dot- fr>

pkgname=taktuk
pkgver=3.7.5
pkgrel=0
pkgdesc="a tool for large scale remote execution deployment"
arch=('i686' 'x86_64')
url="http://taktuk.gforge.inria.fr/"
license=('GPL')
depends=('perl' 'openssh')
source=(https://gforge.inria.fr/frs/download.php/33412/$pkgname-$pkgver.tar.gz)
md5sums=('8ee161128a2f780e86f1c9979492d0a3')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr 
  make || return 1
}

package() {
	  cd ${srcdir}/${pkgname}-${pkgver}
	  make DESTDIR=${pkgdir} install
}
