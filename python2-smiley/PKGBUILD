# Maintainer: Mathieu Clabaut <mathieu@clabaut.net>


pkgname=('python2-smiley')
pkgver=0.5.0
pkgrel=1
pkgdesc="spies on your Python app while it runs"
url="http://www.smiley.org/"
arch=('any')
license=('MIT')
makedepends=('python2')
depends=('python2-cliff' 'python2-cmd2' 'gprof2dot' 'pecan' 'python2-coverage'
'python2-webtest' 'python-simplegeneric>=0.8' 'python2-distribute')
replaces=('smiley')
conflicts=('smiley')
source=("http://pypi.python.org/packages/source/s/smiley/smiley-$pkgver.tar.gz")


package_python2-smiley() {
  depends=('python2')

  cd "$srcdir/smiley-$pkgver"
  python2 setup.py build
  python2 setup.py install --prefix=/usr --root="$pkgdir"

  # move this "old" version out of the way
  #mv "$pkgdir/usr/bin/smiley" "$pkgdir/usr/bin/smiley2"

  # should report this upstream as still not fixed...
  #sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" \
    #$pkgdir/usr/lib/python2.7/site-packages/smiley.py
 
}

md5sums=('1486bde4a6539bb1102cc25dfdd69e4b')
