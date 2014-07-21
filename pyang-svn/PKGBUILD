# Maintainer: Luka Perkov <luka.perkov@sartura.hr>

pkgname=pyang-svn
pkgver=r958
pkgrel=1
pkgdesc='An extensible YANG validator and converter in python (svn)'
arch=(any)
url='https://code.google.com/p/pyang/'
license=('BSD')
depends=(python)
makedepends=(python-setuptools svn)
provides=(pyang)
conflicts=(pyang)
source=("svn+http://pyang.googlecode.com/svn/trunk/")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/trunk"
	local ver="$(svnversion)"
	printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
	cd "$srcdir/trunk"

	python setup.py build
}

package() {
	cd "$srcdir/trunk"

	python setup.py install -O1 --root="$pkgdir"
}
