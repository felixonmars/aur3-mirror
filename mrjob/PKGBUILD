# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# based on community version of stable ipython package

pkgname=mrjob
pkgver=0.2.8
pkgrel=1
_githubtag=248a7f1
pkgdesc="MapReduce framework for writing and running Hadoop Streaming jobs"
url="https://github.com/Yelp/mrjob/"
arch=('any')
depends=('python2' 'python-boto' 'python-simplejson' 'python-yaml')
license=('apache')
source=("https://github.com/Yelp/mrjob/tarball/v$pkgver")
md5sums=('e1ef25c3fbb6da170014a88c0e9fc16d')

build() {
  true
}

package() {
  cd "$srcdir/Yelp-mrjob-$_githubtag"

  python2 setup.py install --prefix=/usr --root="$pkgdir"
  find "$pkgdir" -name '*.py' -print0 |xargs -0 \
    sed -i -e 's,^#!/usr/bin/env python$,#!/usr/bin/env python2,' \
    -e 's,^#!/usr/bin/python$,#!/usr/bin/python2,'
}
