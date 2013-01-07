# Contributor: Nikolaus Brandt <sua-aur-661bbb3b@brandt-n.eu>
pkgname=python-whois
pkgver=0.7
pkgrel=1
pkgdesc="Python module/library for retrieving WHOIS information of domains."
arch=(any)
url="http://code.google.com/p/python-whois/"
license=('MIT')
depends=('python')
#makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/w/whois/whois-$pkgver.tar.gz)
md5sums=('01a31bcb0d0fa3d02b7ea336a00fe4f4')

package() {
    cd $srcdir/${pkgname/python-/}-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1
}
