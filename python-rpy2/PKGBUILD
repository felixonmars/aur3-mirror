# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: David Scholl <djscholl@gmail.com> 
# Contributor: David Pretty <david.pretty@gmail.com>

pkgname=python-rpy2
pkgver=2.5.1
pkgrel=1
pkgdesc="A simple, robust Python interface to the R Programming Language."
arch=('i686' 'x86_64')
url="http://rpy.sourceforge.net/"
license=('MPL' 'GPL' 'LGPL')
depends=('python-numpy' 'r')
source=("http://pypi.python.org/packages/source/r/rpy2/rpy2-$pkgver.tar.gz")
md5sums=('d1f77b439093655faf473105b17ba9d2')

build() {
  cd "$srcdir/rpy2-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/rpy2-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1

  mkdir -p "$pkgdir/etc/ld.so.conf.d"
  echo /usr/lib/R/lib > "$pkgdir/etc/ld.so.conf.d/rpy2.conf"
}

