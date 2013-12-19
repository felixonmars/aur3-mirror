# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=python26-cython
pkgver=0.14.1
pkgrel=2
pkgdesc="C extensions for Python"
arch=('i686' 'x86_64')
url="http://www.cython.org"
license=('APACHE')
depends=('python26')
source=("http://www.cython.org/release/Cython-$pkgver.tar.gz")
md5sums=('1ae1947c1218110f0e41fc95b2bc4530')

package() {
 cd "$srcdir/Cython-$pkgver"
 python2.6 setup.py install --root="$pkgdir"
 rm -rv "$pkgdir/usr/bin"
}
