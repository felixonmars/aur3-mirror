# Maintainer: josephgbr <rafael.f.f1 at gmail.com>
# Contributor: Synthead <synthead at gmail.com>

_pkgbase=devil
pkgname=lib32-${_pkgbase}
pkgver=1.7.8
pkgrel=5
pkgdesc="Library for reading several different image formats (32 bit)"
arch=('x86_64')
url="http://openil.sourceforge.net/"
depends=('lib32-libpng' 'lib32-libmng' 'lib32-gcc-libs' 'lib32-lcms' 
         'lib32-openexr' 'lib32-libjpeg-turbo' "${_pkgbase}")
makedepends=('gcc-multilib')
options=('!libtool' '!docs')
license=('LGPL')
source=("http://downloads.sourceforge.net/openil/DevIL-$pkgver.tar.gz"
        'libpng14.patch')
md5sums=('7918f215524589435e5ec2e8736d5e1d'
         '0f839ccefd43b0ee8b4b3f99806147fc')
         
build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd "${_pkgbase}-${pkgver}"
  patch -Np1 -i "${srcdir}"/libpng14.patch
  ./configure --prefix=/usr --enable-ILU --libdir=/usr/lib32
  make
}

package() {
  cd "${_pkgbase}-${pkgver}"
  make prefix="${pkgdir}"/usr libdir="${pkgdir}"/usr/lib32 install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
