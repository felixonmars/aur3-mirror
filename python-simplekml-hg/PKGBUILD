# Maintainer: Dave Reisner <d@falconindy.com> 

pkgname=python-simplekml-hg
pkgver=r70.09c0c63cabfc
pkgrel=1
pkgdesc="KML generation with as little effort as possible"
arch=('any')
url="https://code.google.com/p/simplekml/"
license=('GPL')
depends=('python')
makedepends=('mercurial')
source=("hg+http://code.google.com/p/simplekml/")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/simplekml"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
	cd "$srcdir/simplekml"
	python setup.py install --root="${pkgdir}/" --optimize=1
}
