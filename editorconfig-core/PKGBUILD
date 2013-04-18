# Maintainer: Erik van der Kolk <developer at smerik dot nl>
pkgname=editorconfig-core
pkgver=0.10.0
pkgrel=3
pkgdesc="EditorConfig core code written in C (for use by plugins supporting EditorConfig parsing)"
arch=('i686' 'x86_64')
url="https://github.com/editorconfig/${pkgname}/downloads"
license=('BSD')
depends=('glibc')
makedepends=('cmake>=2.6')
provides=('editorconfig-core')
conflicts=('editorconfig-core')
changelog=CHANGELOG
source=("https://github.com/downloads/editorconfig/${pkgname}/editorconfig-${pkgver}.tar.gz")
md5sums=('c82a6b12fad3853acfb9b2a43d547f5e')

build() {
  cd "${srcdir}"

  msg "Starting make..."
  cmake -D CMAKE_INSTALL_PREFIX=/usr .
  make
}

check() {
  cd "${srcdir}"
  make test
}

package() {
  cd "${srcdir}"
  make DESTDIR="${pkgdir}" install

  msg "Including license..."
  install -v -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
