# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=python26-distribute
_pkgname=distribute
pkgver=0.6.26
pkgrel=1
pkgdesc="Easily build and distribute Python packages"
arch=('any')
license=('PSF')
url="http://pypi.python.org/pypi/distribute"
depends=('python26')
source=("http://pypi.python.org/packages/source/d/$_pkgname/$_pkgname-$pkgver.tar.gz"
	       'distribute-0.6.16-fix_deprecation_warnings.patch')
md5sums=('841f4262a70107f85260362f5def8206'
         '0aaccee4d8e102dbab186274b8a16fdb')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	patch -Np1 -i "$srcdir/distribute-0.6.16-fix_deprecation_warnings.patch"
	python2.6 setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python2.6 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
