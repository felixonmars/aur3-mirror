# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com
# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pkgname=oscpack
pkgver=1.1.0
_pkgver=${pkgver//./_}
pkgrel=2
pkgdesc="A set of C++ classes for packing and unpacking OSC packets."
license=('MIT')
arch=('i686' 'x86_64')
url="http://www.rossbencina.com/code/oscpack"
source=("https://oscpack.googlecode.com/files/oscpack_${_pkgver}.zip") 
md5sums=('8a0a932a3ff2490e75212cfad5f26aa5')

build() {
  cd oscpack_${_pkgver}
  if test "$CARCH" == x86_64; then
    make CXX='g++ -fPIC' lib
  else
    make lib
  fi
}

package() {
  cd oscpack_${_pkgver}
  # header
  install -d -m755 "$pkgdir"/usr/include/oscpack/{osc,ip}
  install -m644 ip/*.h "$pkgdir"/usr/include/oscpack/ip
  install -m644 osc/*.h "$pkgdir"/usr/include/oscpack/osc
  # lib
  install -d -m755 "$pkgdir"/usr/lib
  install -m755 liboscpack.so.${pkgver}  "$pkgdir"/usr/lib/liboscpack.so.${pkgver}
  (cd "$pkgdir"/usr/lib; ln -s liboscpack.so.${pkgver} liboscpack.so)
  # docs
  install -d -m755 "${pkgdir}"/usr/share/{licenses/oscpack,doc/oscpack}
  install -m644 LICENSE "${pkgdir}"/usr/share/licenses/oscpack
  install -m644 README CHANGES "${pkgdir}"/usr/share/doc/oscpack
}
