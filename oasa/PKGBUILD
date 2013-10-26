# Maintainer: ertua <mfl.34.qal@spamgourmet.com>
# heavily inspired by the bkchem PKGBUILD of mykhal/Xyne
pkgname=oasa
pkgver=0.13.1
pkgrel=1
pkgdesc="BKChem's chemistry formula rendering as a library"
arch=('any')
url="http://bkchem.zirael.org/oasa_en.html"
license=('GPL')
depends=(python2)
optdepends=("inchi: InChI generation")
source=(http://bkchem.zirael.org/download/$pkgname-$pkgver.tar.gz)
md5sums=('49f573537cf81db3892627bc3b5c31dd')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's/python/python2/g' setup.py
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install \
		--prefix=/usr \
		--root="$pkgdir"
	#install -Dm644
}
