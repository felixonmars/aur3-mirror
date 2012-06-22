pkgname=python-rtmpy
pkgver=0.1
pkgrel=1
pkgdesc="A Python module that provides RTMP support"
depends=('python' 'python-pyamf' 'twisted' 'zope-interface')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/R/RTMPy/RTMPy-${pkgver}.tar.gz")
url="http://rtmpy.org"
license=('LGPL2.1')
arch=('i686' 'x86_64')
md5sums=('a4ccc082a7b97c48bb7e6fc41750102d')

build() {
  cd "$srcdir"/RTMPy-$pkgver
  python2 setup.py install --root=$pkgdir || return 1
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp $srcdir/RTMPy-$pkgver/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname || return 1

}



