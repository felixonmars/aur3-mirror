# Maintainer: philanecros <philanecros@gmail.com>
_pkgname=sphinx-intl
pkgname=python-sphinx-intl
pkgver=0.9.5
pkgrel=1
pkgdesc="Sphinx utility that make it easy to translate and to apply translation."
arch=('any')
url="https://pypi.python.org/pypi/sphinx-intl"
license=('BSD')
groups=()
depends=('python' 'python-polib')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
changelog=
source=(https://pypi.python.org/packages/source/s/sphinx-intl/$_pkgname-$pkgver.tar.gz)
md5sums=('4e7dffde660dad03f4254c6b23f9ab36')
noextract=()

package() {
	cd "$srcdir/$_pkgname-$pkgver"
        python setup.py install --root="$pkgdir/" --optimize=1
}
