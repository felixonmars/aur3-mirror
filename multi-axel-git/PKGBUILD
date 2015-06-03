# Maintainer: Jiachen Yang <farseerfc@gmail.com>

pkgname=multi-axel-git
pkgver=r37.6c42a22
pkgrel=2
pkgdesc="A GUI for Axel supporting multiple processes for each download"
arch=('i686' 'x86_64')
url="https://github.com/manushanga/multi-axel"
license=('CUSTOM')
depends=('qt4' 'axel')
makedepends=('git')
source=("${pkgname}"::"git+https://github.com/manushanga/multi-axel")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${pkgname}"
  qmake-qt4 nbproject/qt-Release.pro
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -D -m755 "${srcdir}/${pkgname}/dist/Release/GNU-Linux-x86/multi-axel" "$pkgdir/usr/bin/multi-axel"
}
