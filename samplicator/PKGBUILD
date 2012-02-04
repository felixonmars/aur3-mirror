# Maintainer: Viliam Pucik <viliam.pucik@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=samplicator
pkgver=1.3.6
pkgrel=2
pkgdesc="An UDP datagrams receiver and forwarder with option to spoof the source IP address"
arch=(i686 x86_64)
url='http://code.google.com/p/samplicator/'
license=('GPL2')
depends=(glibc)
makedepends=()
source=("maxpdu.patch"
        "http://samplicator.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('22ee6e76ead265f1972ce80b3d8bde59'
         '8924d7de9bad725e898a0f40e0497e1f')
sha512sums=('46a96e1ca2364264fd7f94f0e942013003b46e1d7d0cb8f55b739f2d77a96322dd810871c51ae85b27f2c28d2da883ae7bd66c041977302d9b1337dbee78ff0a'
            'a4023344ec911d3dc6992ddce139e6f1c86a67bd9948a3f92a995dc26aeda1753becea4b0f5d9ad45a06d628029bffc0a77c28fbd277da9faf42100c01d55f31')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < "$srcdir/maxpdu.patch"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
