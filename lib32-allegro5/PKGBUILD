# Maintainer: josephgbr <rafael.f.f1 at gmail dot com>
# Contributor: 

_pkgbasename=allegro
pkgname=lib32-${_pkgbasename}5
pkgver=5.0.4
pkgrel=3
pkgdesc="Portable library mainly aimed at video game and multimedia programming (32 bit)"
arch=('x86_64')
url="http://alleg.sourceforge.net/"
license=('custom:allegro')
depends=('lib32-alsa-lib' 'lib32-gtk2' 'lib32-libjpeg-turbo' 'lib32-libpulse'
	 'lib32-libxxf86vm' 'lib32-libgl' 'lib32-openal' 'lib32-physfs'
	 'lib32-libxpm' 'allegro5')
makedepends=('cmake' 'gcc-multilib')
options=('!makeflags')
conflicts=('lib32-allegro')
source=(http://downloads.sourceforge.net/alleg/${_pkgbasename}-${pkgver}.tar.gz)
md5sums=('e2e314ee7116c7efddd0497d6c885e46')

build() {
  cd "${srcdir}"
  rm -rf build
  mkdir build && cd build  
  cmake "../${_pkgbasename}-${pkgver}" \
  	-DCMAKE_BUILD_TYPE=Release \
  	-DCMAKE_INSTALL_PREFIX=/usr \
  	-DLIB_SUFFIX="32" \
	-DCMAKE_C_FLAGS="$CFLAGS -m32" \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -m32" \
	-DWANT_DOCS=OFF
  make
}

package() {
  cd "${srcdir}/build"  
  make DESTDIR="${pkgdir}" install
  rm -rf ${pkgdir}/usr/{bin,include}
  install -Dm644 "../${_pkgbasename}-${pkgver}/LICENSE.txt" \
  		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
