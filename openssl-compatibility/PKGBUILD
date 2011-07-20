# Contributor: Marvn <mistrmarvn@gmail.com>

pkgname=openssl-compatibility
pkgver=0.9.8
pkgrel=3
pkgdesc="libssl and libcrypto 0.9.8 libs"
arch=('i686' 'x86_64')
url="https://www.openssl.org"
license=('GPL')
depends=()
makedepends=()
source=(http://schlunix.org/archlinux/core/os/$CARCH/openssl-0.9.8n-1-$CARCH.pkg.tar.xz)
if [ $CARCH = "x86_64" ]
then
md5sums=('c97c359cff79ff25ee8f221541642aa3')
else
md5sums=('b1860e7fd78210542fbb4913aa7e8eb1')
fi

package()
{
mkdir -p $pkgdir/usr/lib/
install -D -m555 $srcdir/usr/lib/libcrypto.so.0.9.8 $pkgdir/usr/lib/
install -D -m555 $srcdir/usr/lib/libssl.so.0.9.8 $pkgdir/usr/lib/

}
