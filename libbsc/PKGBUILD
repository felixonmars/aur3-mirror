# Contributor: Kovivchak Evgen <oneonfire@gmail.com>

pkgname=libbsc
pkgver=3.1.0
pkgrel=2
pkgdesc="Program and a library for lossless, block-sorting data compression."
arch=('i686' 'x86_64')
license=('APACHE')
url="http://libbsc.com"
depends=('gcc-libs')
source=("libbsc-3.1.0.tar.gz::https://github.com/IlyaGrebnov/libbsc/tarball/master")
md5sums=('838afee37956a3c240f7a312d5ec4dd0')

package() {
  cd ${srcdir}/IlyaGrebnov-libbsc-e604226
  make
  make PREFIX=${pkgdir}/usr install
} 
