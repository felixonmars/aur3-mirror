# Contrinutor: shining <shiningxc@gmail.com>
# Maintainer: phillid <dbphillipsnz _at_thingy_that_swirly_a_symbol gmaildott comm>
pkgname=pydot
pkgver=1.0.28
pkgrel=2
pkgdesc="Python interface to Graphviz's Dot language"
arch=(any)
url="http://code.google.com/p/pydot/"
license=(MIT)
depends=(python2-pyparsing graphviz)
makedepends=(setuptools)
source=("http://pydot.googlecode.com/files/$pkgname-$pkgver.tar.gz"
        "noncomma.patch")
md5sums=('c0a7a027176a62c412fd0f54951af692'
         'c709dccc04dfa1960b64fbd8aa7c5da7')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p0 -i${srcdir}/noncomma.patch
	python2 setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --install-data=/usr/share/pydot --root=$pkgdir
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
