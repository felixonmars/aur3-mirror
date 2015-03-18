# Maintainer: willwish <willwish@outlook.com>
pkgname=eunzip
pkgver=0.1
pkgrel=2
_pyver=3.4.3
pkgdesc="A script for extracting and viewing zip files, with decoding filenames support"
arch=("any")
url="http://www.python.org/"
license=("custom")
depends=("python")
source=("http://www.python.org/ftp/python/${_pyver%rc*}/Python-${_pyver}.tar.xz"
        "eunzip.patch")
md5sums=('7d092d1bba6e17f0d9bd21b49e441dd5'
         '5024a0d88081038125631ded21208a1e')

build() {
  patch Python-${_pyver}/Lib/zipfile.py eunzip.patch -o eunzip
}

package() {
  install -Dm755 "eunzip" "${pkgdir}/usr/bin/eunzip"
}
