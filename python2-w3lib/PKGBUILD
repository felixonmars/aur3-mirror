# Maintainer: Bence Balint <balintbence1337@gmail.com>

pkgname=python2-w3lib
pkgver=1.10.0
pkgrel=1
pkgdesc="Library of web-related functions."
arch=(any)
url="http://pypi.python.org/pypi/w3lib"
license=('BSD')
groups=()
depends=('python2' 'python2-setuptools')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
changelog=
source=("http://pypi.python.org/packages/source/w/w3lib/w3lib-$pkgver.tar.gz")
noextract=()
md5sums=('4188d2dbc790dd07c6b3877dcd0ebd7b')

package() {
	cd "$srcdir/w3lib-$pkgver"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}
