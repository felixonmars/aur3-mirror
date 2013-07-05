pkgname=libwebm-git
pkgver=libwebm.1.0.0.25.68.g8206558
pkgrel=1
pkgdesc="WebM File Parser\Writer."
arch=('any')
url="http://webmproject.org"
license=('unknown')
makedepends=('git')
source=('git+http://git.chromium.org/webm/libwebm.git')
_gitname='libwebm'

pkgver() {
  cd ${_gitname}
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/${_gitname}"
  
  make libwebm.so
}

package() {
  cd "${srcdir}/${_gitname}"
  mkdir -p "${pkgdir}/usr/include/webm"
  mkdir -p "${pkgdir}/usr/lib"
  cp *.hpp "${pkgdir}/usr/include/webm"
  cp libwebm.so "${pkgdir}/usr/lib"
}
md5sums=('SKIP')

