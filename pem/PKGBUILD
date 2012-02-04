# maintainer Philipp Seiler <philippseiler1991@web.de>
# contributor Prasad J Pandit <pj.pandit@yahoo.co.in> 

pkgname=pem
pkgver=0.7.9
pkgrel=1
pkgdesc="GNU Pem - A personal expenses manager for the command line"
arch=(i686 x86_64)
url="http://www.gnu.org/pem/"
depends=('gawk')
license=("GPL3")
source=(http://ftp.gnu.org/gnu/pem/$pkgname-$pkgver.tar.gz)
md5sums=('97699c1868d2ae6021a88e64783830d7')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install
} 
