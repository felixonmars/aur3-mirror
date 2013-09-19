
# Contributor: Mathieu Clabaut <mathieu@clabaut.net>
pkgname=pecan
pkgver=0.3.2
pkgrel=1
pkgdesc="A WSGI object-dispatching web framework, designed to be lean and
fast, with few dependancies"
arch=("any")
url="http://github.com/dreamhost/pecan"
license=('LGPL')
depends=(python2)
makedepends=('git')
provides=(pecan)
source=("http://pypi.python.org/packages/source/p/pecan/pecan-$pkgver.tar.gz")


build() {
  cd "$srcdir/pecan-$pkgver"
  python2 setup.py build
  python2 setup.py install --prefix=/usr --root="$pkgdir"

  # move this "old" version out of the way
  #mv "$pkgdir/usr/bin/smiley" "$pkgdir/usr/bin/smiley2"

  # should report this upstream as still not fixed...
  #sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" \
    #$pkgdir/usr/lib/python2.7/site-packages/smiley.py
 
}
md5sums=('b0d6ed667d0f83f18c19e4c970994e0f')
