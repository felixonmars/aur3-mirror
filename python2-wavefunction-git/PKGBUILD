
# Maintainer: Andres F. Urquijo <alfagalileox@gmail.com>
_pkgname=wavefunction
pkgname=python2-wavefunction-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Python package for calculating wavefunctions for 1D and 2D potentials"
arch=("any")
url="https://github.com/jrjohansson/wavefunction"
license=('LGPL')
depends=("python2" "git")
optdepends=("python2-matplotlib")

source=( "$pkgname"::'git://github.com/jrjohansson/wavefunction.git')

md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	python2 setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	python2 setup.py install --prefix=/usr --root="$pkgdir"
}
