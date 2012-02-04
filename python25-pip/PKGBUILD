# Maintainer: Blake Imsland <blake@retroco.de>

pkgname=python25-pip
pkgver=1.0.2
pkgrel=1
pkgdesc="An easy_install replacement for installing pypi python packages"
url="http://pypi.python.org/pypi/pip"
arch=('any')
license=('MIT')
depends=('python25' 'python25-distribute')
source=(http://pypi.python.org/packages/source/p/pip/pip-$pkgver.tar.gz
        python25.patch)
md5sums=('47ec6ff3f6d962696fe08d4c8264ad49'
         '63768b2d3282fe25c12c7356f3dcbb8c')

build() {
  cd $srcdir/pip-$pkgver

  patch -Np1 -i $srcdir/python25.patch

  sed -i pip/__init__.py \
    -e 's|^#!/usr/bin/env python.*|#!/usr/bin/env python2.5|'

  python2.5 setup.py build
  #python2.5 setup.py test
}

package() {
  cd $srcdir/pip-$pkgver

  python2.5 setup.py install --prefix=/usr --root=$pkgdir --optimize=1 --skip-build
}
