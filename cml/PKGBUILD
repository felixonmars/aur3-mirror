# Contributor: krigun <gunnar.kriik AT gmail DOT com>
# Maintainer: Luca Bennati <lucak3 AT gmai DOT com>

pkgname=cml
pkgver=1.0.3
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc="Configurable Math Library, a template-based C++ math library."
arch=('any')
url="http://cmldev.net/"
license=('BSL1.0')
depends=()
source=("http://downloads.sf.net/sourceforge/cmldev/CML%201.0/${pkgname}-${_pkgver}.zip")
md5sums=('907e4a3a23d5be7d53bc26b4e82ee5fe')

build() {
  true
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  install -dm755 "${pkgdir}/usr/"{include/cml,share/cml/{examples,cmake/Modules}}"/"
  cp -R cml/ "${pkgdir}/usr/include/"
  chmod -R 0755 "${pkgdir}/usr/include/cml"
  install -DTm755 doc/parameters.txt "${pkgdir}/usr/share/doc/cml/parameters.txt"
  install -Dm755 examples/* "${pkgdir}/usr/share/cml/examples/"
  install -Dm644 *.cmake "${pkgdir}/usr/share/cml/cmake/Modules/"
}

# vim:set ts=2 sw=2 et:
