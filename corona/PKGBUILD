# Original Contributor: Jared McKee
# Current Contributor: allocius.reikei <allociusdotreikei at gmail dotcom>
pkgname=corona
pkgver=1.0.2
pkgrel=2
pkgdesc="An image input/output library"
arch=('i686' 'x86_64')
url="http://corona.sourceforge.net/"
license=('zlib')
depends=()
makedepends=()
source=(http://downloads.sourceforge.net/sourceforge/corona/$pkgname-$pkgver.tar.gz cor1.patch)
md5sums=('29d1a7f1e2c85a83e9620496c62740ce' '4a85c82c2ee592f1e0ff98e72e9a0b59')
 
build() {
  cd $startdir/src/$pkgname-$pkgver
  msg "Applying Patch"
  patch -Np1 < ../cor1.patch || return 1
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
