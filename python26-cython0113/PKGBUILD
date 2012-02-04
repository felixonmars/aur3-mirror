# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=python26-cython0113
pkgver=0.11.3
pkgrel=1
pkgdesc="C extensions for Python"
arch=('i686' 'x86_64')
url="http://www.cython.org"
license=('APACHE')
depends=('python26')
conflicts=('python26-cython')
provides=('python26-cython')
source=("http://www.cython.org/release/Cython-$pkgver.tar.gz")
md5sums=('470d1f928886f4e59463d7ead5d5e300')

package() {
 cd "$srcdir/Cython-$pkgver"
 python26 setup.py install --root="$pkgdir"
 rm -rv "$pkgdir/usr/bin"
}
