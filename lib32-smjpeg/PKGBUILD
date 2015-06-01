# Maintainer: Miikka Ahonen <ma65547 at gmail dot com>

_pkgname=smjpeg
pkgname=lib32-${_pkgname}
pkgver=0.2.2
pkgrel=1
pkgdesc="SDL Motion JPEG Library (32-bit)"
arch=('x86_64')
url="http://icculus.org/smjpeg/"
license=('GPL2')
depends=('lib32-sdl' ${_pkgname})
makedepends=('gcc-multilib' 'svn')
options=('!libtool')
source=("${_pkgname}-${pkgver}::svn://svn.icculus.org/smjpeg/trunk")
md5sums=('SKIP')

prepare() {
  cd "${_pkgname}-${pkgver}"

  aclocal
  autoconf
  automake --foreign --add-missing --force --copy
}

build() {
  cd "${_pkgname}-${pkgver}"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  
  ./configure --prefix=/usr --libdir=/usr/lib32 --disable-static
  make
}

check() {
  cd "${_pkgname}-${pkgver}"

  make check
}

package() {
  cd "${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{bin,include}
  install -dm755 "${pkgdir}/usr/share/licenses"
  ln -s "${_pkgname}" "${pkgdir}/usr/share/licenses/${pkgname}"
}
