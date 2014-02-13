pkgname=python-stardb-git
pkgver=5
pkgrel=1
pkgdesc="A Python library for manipulating Starbound database files"
arch=(any)
url="https://github.com/McSimp/StarDB"
license=("MIT")
depends=(python)
makedepends=(python-setuptools git)
conflicts=(python-stardb)
provides=(python-stardb)
source=("${pkgname%-*}::git+https://github.com/McSimp/StarDB.git"
"setup.py")
md5sums=('SKIP'
         '91ec099c988ec1af524b3d2f7d13314c')

pkgver () {
	cd "$srcdir/${pkgname%-*}"
	echo $(git rev-list --count master)
}

prepare() {
	cd "$srcdir/${pkgname%-*}"
	cp ../setup.py .
}

package() {
	pyver=`python -V`
	cd "$srcdir/${pkgname%-*}"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python-stardb/LICENSE"
} 
