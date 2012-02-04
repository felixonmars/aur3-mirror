pkgname=mod_h264
pkgver=2.2.7
pkgrel=1
pkgdesc="H264 Streaming Module for Apache"
arch=('i686' 'x86_64')
url="http://h264.code-shop.com/trac/wiki"
license=('CCPL')
depends=('apache')
source=("http://h264.code-shop.com/download/apache_${pkgname}_streaming-${pkgver}.tar.gz")
md5sums=('123cacef68e9ff56fe908200bd0feea5')
install="${pkgname}.install"

build() {
  cd ${srcdir}/${pkgname}_streaming-${pkgver}
  ./configure --with-apxs=`which apxs2`
  make
}

package() {
  cd ${srcdir}/${pkgname}_streaming-${pkgver}
  make install DESTDIR=${pkgdir}
}
