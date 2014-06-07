# Submitter: Chee Sing Lee <cheesinglee {at} gmail.com>
pkgname=python2-bigmler
pkgver=1.8.11
pkgrel=1
pkgdesc="A Higher Level API to BigML.io, the public BigML API"
arch=('any')
url="http://bigmler.readthedocs.org/en/latest/"
license=('APACHE')
groups=()
depends=('python2' 'python2-bigml>=1.4.4')
makedepends=()
checkdepends=()
optdepends=('python2-numpy: for local predictions' 'python2-scipy: for local predictions')
provides=('python2-bigmler')
conflicts=()
replaces=()
backup=()
options=()
changelog=
source=(https://pypi.python.org/packages/source/b/bigmler/bigmler-$pkgver.tar.gz)
md5sums=('c60e73eab9d48bbb1e2b83aa9ad16c1e')

package() {
	cd "$srcdir/bigmler-$pkgver"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}
