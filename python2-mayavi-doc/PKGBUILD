# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-mayavi-doc
pkgver=4.2.0
_githubtag=a1e562a
pkgrel=1
pkgdesc="Documentation for Mayavi"
arch=('any')
url="https://github.com/enthought/mayavi"
license=('BSD')
depends=("python2-mayavi=${pkgver}")
makedepends=('python2-sphinx')
conflicts=('python2-mayavi-doc-git')
options=(!emptydirs)

source=("$pkgname.tar.gz::https://github.com/enthought/mayavi/tarball/${pkgver}")
md5sums=('b46fb048176002738de64eed8d2b447a')

build() {
  cd "$srcdir/enthought-mayavi-${_githubtag}"

  cd docs

  make SPHINXBUILD=sphinx-build2 html

  install -d "${pkgdir}"/usr/share/doc/enthought/{mayavi,tvtk}
  cp -r build/mayavi/html/* "${pkgdir}"/usr/share/doc/enthought/mayavi
  cp -r build/tvtk/html/* "${pkgdir}"/usr/share/doc/enthought/tvtk

  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find "${pkgdir}" -name '*.py')

  install -D "../LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

