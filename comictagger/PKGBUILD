# Contributor: Peter van Liesdonk <peter@liesdonk.nl>

pkgname=comictagger
pkgver=1.1.15_beta
pkgrel=1
pkgdesc="A cross-platform GUI/CLI app for writing metadata to comic archives."
url="https://code.google.com/p/comictagger/"
arch=('any')
license=('Apache')
depends=("python2-configparser" "python2-beautifulsoup4" "python2-pillow" "python2-pyqt4")
makedepends=('python2-setuptools')
options=!strip
source=("https://56952d1b024b94dff7d6f0a977fae0fb4df63ad7.googledrive.com/host/0Bw4IursaqWhhOHF6Wk9ab3FkejQ/1.1.15-beta/comictagger-1.1.15-beta.zip")
sha256sums=('2a28e02380533e190f2f2612eb768fcd4e1f018e4ef970343b1f1627c99e9995')

build() {
  cd "${srcdir}"/$pkgname-${pkgver//_/-}

  python2 setup.py build
}

package() {
  cd "${srcdir}"/$pkgname-${pkgver//_/-}

  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find "${pkgdir}" -name '*.py')

}
