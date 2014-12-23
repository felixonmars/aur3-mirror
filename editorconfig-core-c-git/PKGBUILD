# Original Author: Erik van der Kolk <developer at smerik dot nl>
# Maintainer: Hong Xu <hong@topbug.net>
pkgname=editorconfig-core-c-git
pkgver=v0.12.0.r11.g7291b40
pkgrel=1
pkgdesc="EditorConfig core code written in C (for use by plugins supporting EditorConfig parsing)"
arch=('i686' 'x86_64')
url="https://github.com/editorconfig/editorconfig-core-c"
license=('BSD')
depends=('pcre')
source=("${pkgname}::git+https://github.com/editorconfig/editorconfig-core-c")
makedepends=('git' 'cmake>=2.6')
provides=('editorconfig-core' 'editorconfig-core-c')
conflicts=('editorconfig-core' 'editorconfig-core-c')
md5sums=('SKIP')

prepare() {
  cd "${pkgname}"
  git submodule update --init
}

build() {
  cd "${pkgname}"

  msg "Starting make..."
  cmake -D CMAKE_INSTALL_PREFIX=/usr -D INSTALL_HTML_DOC=ON .
  make
}

check() {
  cd "${pkgname}"
  make test
}

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install

  msg "Including license..."
  install -v -D -m 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
