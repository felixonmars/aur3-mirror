pkgname=python-pyamf
pkgver=0.6.1
pkgrel=1
pkgdesc="A Python module that provides AMF support"
depends=('python')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/P/PyAMF/PyAMF-${pkgver}.tar.bz2")
url="http://pyamf.org"
license=('MIT')
arch=('i686' 'x86_64')
md5sums=('5ce344815e5d366ff5dc34d27f03b831')

build() {
  cd "$srcdir"/PyAMF-$pkgver
  python2 setup.py install --root=$pkgdir || return 1
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp $srcdir/PyAMF-$pkgver/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname || return 1

}



