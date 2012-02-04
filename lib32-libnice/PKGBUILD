_pkgbasename=libnice
pkgname=lib32-$_pkgbasename
pkgver=0.1.0
pkgrel=1
pkgdesc="An implementation of the IETF's draft ICE (for p2p UDP data streams) (32 bit)"
arch=('x86_64')
license=('LGPL')
url="http://nice.freedesktop.org/releases/"
depends=()
makedepends=('intltool' 'gcc-multilib')
options=('!libtool')
source=(${url}/libnice-${pkgver}.tar.gz)
md5sums=('c077e2aa74c9afb4b4e157efc8a6ad9d')
 
build() {
  cd "${srcdir}/libnice-${pkgver}"
 
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
                        --libexecdir=/usr/lib32 --libdir=/usr/lib32 \
                        CC='gcc -m32' CXX='g++ -m32'
  make
}
 
package() {
  cd "${srcdir}/libnice-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf ${pkgdir}/usr/{bin,include,share}
}
