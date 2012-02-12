pkgname=python2-uncompyle
pkgver=0.0.2
pkgrel=1
_githubtag=9708c4c
pkgdesc="Python 2.7 byte-code decompiler"
url="https://github.com/gstarnberger/uncompyle/"
arch=('any')
depends=('python2')
license=('GPL3')
source=("https://github.com/gstarnberger/uncompyle/tarball/v$pkgver")
md5sums=('89664d8884e2cccdd3f9587e5eb0026d')

build() {
  true
}

package() {
  cd "$srcdir/gstarnberger-uncompyle-$_githubtag"

  python2 setup.py install --prefix=/usr --root="$pkgdir"
  find "$pkgdir" -name '*.py' -print0 |xargs -0 \
    sed -i -e 's,^#!/usr/bin/env python$,#!/usr/bin/env python2,' \
    -e 's,^#!/usr/bin/python$,#!/usr/bin/python2,'
}
