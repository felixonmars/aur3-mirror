# Maintainer: David McInnis <davidm at eagles dot ewu dot edu>

pkgname=python-watershed
pkgver=2.0
pkgrel=1
pkgdesc="image segmentation based on watershed algorithm"
url="https://engineering.purdue.edu/kak/distWatershed/Watershed-2.0.html"
arch=('any')
license=('Python Software Foundation License')
makedepends=('python-setuptools')
source=(https://engineering.purdue.edu/kak/distWatershed/Watershed-$pkgver.tar.gz)
sha256sums=('ec3083819462754df435bf6835b3931242f0f131d876670ce9ff7c3b6dc1ad9d')

build () {
  cd $srcdir/Watershed-$pkgver
  python setup.py build
  make docs
}

check() {
  cd $srcdir/Watershed-$pkgver
  export PYTHONPATH="$PWD/build/lib.linux-$CARCH-3.4:$PYTHONPATH"
  make test
}


package () {
  pkgdesc+=" (Python3.x)"
  depends=('python')

  cd $srcdir/Watershed-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
  
  install -D Watershed.html $pkgdir/usr/share/doc/Watershed.html
  install -D README $pkgdir/usr/share/doc/README
  install -d $pkgdir/usr/share/doc/examples
  cp -Rf      Examples/* $pkgdir/usr/share/doc/examples/
}