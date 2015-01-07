# Submitter: Chee Sing Lee <cheesinglee {at} gmail.com>
pkgname=python2-bigml
pkgver=1.10.1
pkgrel=1
pkgdesc="An open source binding to BigML.io, the public BigML API"
arch=('any')
url="http://bigml.readthedocs.org/en/latest/"
license=('APACHE')
groups=()
depends=('python2' 'python2-unidecode' 'python2-requests' 'python2-poster')
makedepends=()
checkdepends=()
optdepends=('python2-simplejson: use simplejson instead of Python built-in JSON library' 
            'python2-numpy: for local predictions' 
            'python2-scipy: for local predictions')
provides=('python2-bigml')
conflicts=()
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=
source=(https://pypi.python.org/packages/source/b/bigml/bigml-$pkgver.tar.gz)
md5sums=('6d93223bf59b5a9d008fd8102116145a')

package() {
	cd "$srcdir/bigml-$pkgver"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}
