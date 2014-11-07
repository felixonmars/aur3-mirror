# Maintainer: Frostyfrog <frostyfrog2+aur@gmail.com>
pkgname=python-term2048
pkgver=0.2.5
pkgrel=0
pkgdesc="2048 in the terminal"
arch=('any')
url="https://github.com/bfontaine/term2048"
license=('MIT')
depends=('python-colorama>=0.2.7' 'python')
makedepends=('python-setuptools')
conflicts=('python2-term2048')
source=(https://github.com/bfontaine/term2048/archive/${pkgver}.tar.gz)
sha1sums=('7f384a3baddbcc2f1efd0cbf33edede39920a3cf')

package() {
	cd "$srcdir/term2048-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" || return 1
}
