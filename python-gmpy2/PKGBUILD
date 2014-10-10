# Maintainer: Omar Sandoval <osandov at cs dot washington dot edu>
# Contributor: Kevin Lui kevinywlui gmail
pkgname=python-gmpy2
pkgver=2.0.4
pkgrel=1
pkgdesc="Provides C-coded Python modules for fast multiple-precision arithmetic."
arch=('i686' 'x86_64')
url="http://code.google.com/p/gmpy/"
license=('LGPL2.1')
depends=('python' 'gmp')
conflicts=('gmpy')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/g/gmpy2/gmpy2-${pkgver}.zip")
md5sums=('b5f0e5bbb64fcd1582ddd5079c9a7b73')

package() {
  cd "$srcdir/gmpy2-$pkgver"
  python setup.py install --root=$pkgdir/ --optimize=1

  install -d -m 755 $pkgdir/usr/share/doc/$pkgname
  install -m 644 -t $pkgdir/usr/share/doc/$pkgname docs/*
}
