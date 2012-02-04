# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=python26-gnutls
_pkgname=python-gnutls
pkgver=1.2.0
pkgrel=1
pkgdesc="Python wrapper for the GNUTLS library"
arch=('i686' 'x86_64')
url="http://cheeseshop.python.org/pypi/python-gnutls"
depends=('python26' 'gnutls')
license=('LGPL')
source=("http://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('18a7b92abdc1598b916d7ff5019b72bf')

package() {
 cd "$srcdir/$_pkgname-$pkgver"
 python26 setup.py install --root="$pkgdir"
}
