# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=python26-gnutls114
_pkgname=python-gnutls
pkgver=1.1.4
pkgrel=3
pkgdesc="Python wrapper for the GNUTLS library"
arch=('i686' 'x86_64')
url="http://cheeseshop.python.org/pypi/python-gnutls"
depends=('python26' 'libgnutls13')
conflicts=('python26-gnutls')
provides=('python26-gnutls')
license=('LGPL')
source=("http://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('82179cc0a7e211ac6c92f0ee485375bc')

package() {
 cd "$srcdir/$_pkgname-$pkgver"
 python26 setup.py install --root="$pkgdir"
}
