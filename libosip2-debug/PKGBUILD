pkgname=libosip2-debug
pkgver=3.1.0
pkgrel=1
pkgdesc="oSIP is an implementation of SIP"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/osip/"
license=('LGPL')
options=(!emptydirs !libtool)
conflicts=(libosip2)
provides=(libosip2)
source=(http://ftp.gnu.org/gnu/osip/libosip2-${pkgver/_/-}.tar.gz)
md5sums=('7eb305608256ac2a7a27b66ce52627c8')

build() {
  cd ${startdir}/src/libosip2-${pkgver/_/-}/

  ./configure --prefix=/usr --enable-debug --enable-trace
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
