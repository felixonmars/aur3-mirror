# Maintainer: Marek Petrik <marekpetrik@gmail.com>

pkgname=python-simplekml
pkgver=1.2.3
pkgrel=1
pkgdesc="KML generation with as little effort as possible"
arch=('any')
url="https://pypi.python.org/pypi/simplekml"
license=('GPL')
depends=('python')
source=("https://pypi.python.org/packages/source/s/simplekml/simplekml-1.2.3.zip")
md5sums=('05a95b5da1adb5474d061fb96a211445')

package() {
	cd "$srcdir/simplekml-$pkgver"
	python setup.py install --root="${pkgdir}/" 
}
