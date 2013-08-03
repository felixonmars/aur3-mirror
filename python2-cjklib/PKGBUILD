# Maintainer: Alexey Zinovyev <alzinovyev@gmail.com>

pkgname=python2-cjklib
pkgver=0.3.2
pkgrel=2
pkgdesc="Han character library for CJKV languages"
arch=('any')
url="http://code.google.com/p/cjklib/"
license=('LGPL')
replaces=('python-cjklib')
provides=('python-cjklib')
conflicts=('python-cjklib')
depends=('python2-sqlalchemy-0.6' 'python2-distribute' 'sqlite3' 'python2')
options=(!emptydirs)
source=("http://cjklib.googlecode.com/files/cjklib-$pkgver.tar.gz")
md5sums=('32780bc5cc0b132204d1c9b8a1642157')


build() {
  cd "$srcdir/cjklib-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 
  find "$pkgdir" -name '*.py' -print0|xargs -0 \
	   sed -i -e 's,^#!/usr/bin/env python$,#!/usr/bin/env python2,' \
	   -e 's,^#!/usr/bin/python$,#!/usr/bin/python2,' \
           -e 's,from sqlalchemy.exceptions,from sqlalchemy.exc,g' 
}
