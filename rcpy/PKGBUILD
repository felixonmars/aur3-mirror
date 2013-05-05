# Maintainer: bleader <bleader@ratonland.org>

pkgname=rcpy
pkgver=0.4
pkgrel=1
pkgdesc="Raccoon Caluctalor in Python, RPN calculator with bases support"
arch=('any')
url="http://github.com/bleader/rcpy"
license=('BSD')
depends=('python')
optdepends=()
provides=('rcpy')
_ghuser="bleader"
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/$_ghuser/$pkgname/tar.gz/v$pkgver)
md5sums=('3e78de917e6bc00eb75ff0afaaf7c27c')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	gzip rcpy.1
}

package(){
	install -D -m755 ${srcdir}/${pkgname}-${pkgver}/rcpy ${pkgdir}/usr/bin/rcpy
	install -D -m644 ${srcdir}/${pkgname}-${pkgver}/rcpy.1.gz ${pkgdir}/usr/share/man/man1/rcpy.1.gz
}

