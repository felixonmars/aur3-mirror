# Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: Vasily Shevkunov <vasily@shevkunov.name>

pkgname=python2-progressbar
pkgver=2.3
pkgrel=1
pkgdesc="Text progressbar library for python. Using python 2."
arch=('i686' 'x86_64')
url="http://code.google.com/p/python-progressbar/"
license=('LGPL')
makedepends=('python2')
depends=('python2')
source=(http://python-progressbar.googlecode.com/files/progressbar-$pkgver.tar.gz)
md5sums=('4f904e94b783b4c6e71aa74fd2432c59')
build() {
  cd $startdir/src/progressbar-$pkgver

  sed -i 's|^#!/usr/bin/python$|#!/usr/bin/python2|' examples.py
  sed -i 's|^#!/usr/bin/python$|#!/usr/bin/python2|' setup.py
  sed -i 's|^#!/usr/bin/python$|#!/usr/bin/python2|' progressbar/compat.py
  sed -i 's|^#!/usr/bin/python$|#!/usr/bin/python2|' progressbar/__init__.py
  sed -i 's|^#!/usr/bin/python$|#!/usr/bin/python2|' progressbar/widgets.py

  python2 setup.py install --root=$startdir/pkg || return 1
}
