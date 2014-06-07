# Submitter: Chee Sing Lee <cheesinglee {at} gmail.com>
pkgname=python2-pptx
pkgver=0.4.2
pkgrel=1
pkgdesc="A Python library for creating and updating PowerPoint (.pptx) files."
arch=('any')
url="http://python-pptx.readthedocs.org/en/latest/"
license=('MIT')
groups=()
depends=('python2' 'python2-lxml' 'python2-pillow')
makedepends=()
checkdepends=()
optdepends=()
provides=('python2-pptx')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://pypi.python.org/packages/source/p/python-pptx/python-pptx-$pkgver.tar.gz)
md5sums=('897370f62a293501bd50bf726ce44329')

package() {
	cd "$srcdir/python-pptx-$pkgver"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}
