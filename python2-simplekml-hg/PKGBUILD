# Maintainer: Thomas Gubler <thomasgubler@gmail.com>
# Based on python3 PKGBUILD by Dave Reisner <d@falconindy.com>

pkgname=python2-simplekml-hg
pkgver=r70.09c0c63cabfc
pkgrel=1
pkgdesc="KML generation with as little effort as possible"
arch=('any')
url="https://code.google.com/p/simplekml/"
license=('GPL')
depends=('python2')
makedepends=('mercurial')
source=("hg+http://code.google.com/p/simplekml/")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/simplekml"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
	cd "$srcdir/simplekml"
	python2 setup.py install --root="${pkgdir}/" --optimize=1
}
