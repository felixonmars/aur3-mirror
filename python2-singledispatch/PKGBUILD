# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-singledispatch
pkgver=3.4.0.3
pkgrel=1
pkgdesc="This library brings functools.singledispatch from Python 3.4 to Python 2.6-3.3"
arch=('any')
url="https://bitbucket.org/ambv/singledispatch"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/s/singledispatch/singledispatch-$pkgver.tar.gz" license)
md5sums=('af2fc6a3d6cc5a02d0bf54d909785fcb'
         '360faaffcf297a20e20e2289af00ce07')

build() {
  cd "${srcdir}"/singledispatch-$pkgver

  python2 setup.py build
}

package() {
  cd "${srcdir}"/singledispatch-$pkgver

  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find "${pkgdir}" -name '*.py')

  install -D "${srcdir}"/license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

