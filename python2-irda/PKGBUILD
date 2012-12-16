# Contributor: Jonathan Krauss <jkrauss@asymworks.com>

pkgname=python2-irda
pkgver=1.1
pkgrel=2
pkgdesc="IrDA extension module for Python"
arch=(any)
url="https://github.com/asymworks/python-irda"
license=(BSD)
depends=(python2)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/i/irda/irda-$pkgver.tar.gz)
md5sums=(ea36942f8ca26fdd5284f50c25fb5ee2)
install=

package() {
	cd "$srcdir/irda-$pkgver"
	python2 setup.py install --root="$srcdir/irda-$pkgver/" --optimize=1
}
