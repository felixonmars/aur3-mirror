# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=ppl
pkgname=lib32-${_pkgbase}
pkgver=1.0
pkgrel=1
pkgdesc="A modern library for convex polyhedra and other numerical abstractions. (32 bit)"
arch=('x86_64')
url="http://bugseng.com/products/ppl"
license=('GPL3')
depends=('lib32-gmp' "${_pkgbase}")
makedepends=('gcc-multilib')
options=('!docs' '!libtool')
source=(${url}/download/ftp/releases/${pkgver}/${_pkgbase}-${pkgver}.tar.xz)
md5sums=('e8caeb84cd858f64b36333c368891c7b')

build() {  
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export LDFLAGS="$LDFLAGS -I/usr/lib32/gmp" #force lib32-gmp headers
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd "${_pkgbase}-${pkgver}"
  ./configure --prefix=/usr --enable-interfaces="c,cxx" \
		--libdir=/usr/lib32 --libexecdir=/usr/lib32
  make
}

package() {
  cd "${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
