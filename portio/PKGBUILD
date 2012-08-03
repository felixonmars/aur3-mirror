# Contributor: Pasquale Boemio <boemianrapsodi@gmail.com>

pkgname=portio
pkgver=0.4
pkgrel=1
pkgdesc="python low level port I/O for Linux x86"
arch=('i686' 'x86_64')
url="http://portio.inrim.it/"
license=('GPL')
depends=('python2')
source=(http://portio.inrim.it/$pkgname-$pkgver.tar.gz)
md5sums=('4296848d5e970f716b125f85acfc4e7d')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  patch -p0 setup.py ../../portio-0.2-remove_documentation.patch 
  python2 setup.py install --root="$pkgdir"
}
