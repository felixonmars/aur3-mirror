# Maintainer: Marat Akhin <Marat.Akhin@gmail.com>

pkgname=libantlr3-cpp
pkgver=3.5.2
pkgrel=2
pkgdesc="C++ target for ANTLR 3"
url="http://www.antlr3.org/"
arch=("i686" "x86_64")
license=("BSD")
source=("${pkgname}"::"git://github.com/antlr/antlr3.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  git checkout "${pkgver}"
}

package() {
  mkdir -p "${pkgdir}/usr/include"
  cp -r "${srcdir}/${pkgname}/runtime/Cpp/include" "${pkgdir}/usr"
}
