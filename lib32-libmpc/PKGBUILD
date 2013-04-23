# Contributor: Vadym Abramchuk <abramm@gmail.com>

pkgname=lib32-libmpc
pkgver=1.0.1
pkgrel=1
pkgdesc="Library for the arithmetic of complex numbers with arbitrarily high precision (32-bit)"
arch=('x86_64')
url="http://www.multiprecision.org/"
groups=('lib32')
license=('LGPL')
depends=('libmpc' 'lib32-mpfr>=3.0.0')
options=('!libtool')
install=libmpc.install
source=(http://www.multiprecision.org/mpc/download/mpc-${pkgver/_/-}.tar.gz)
md5sums=('b32a2e1a3daa392372fbd586d1ed3679')

build() {
  cd "${srcdir}/mpc-${pkgver}"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export LDFLAGS="-m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export ABI=32
   
  ./configure --prefix=/usr --libdir='/usr/lib32' --with-mpfr-lib='/usr/lib32/'\
  --with-gmp-lib='/usr/lib32'

  make
}

check() {
  cd "${srcdir}/mpc-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/mpc-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{share,include}
}
