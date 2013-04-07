# Contributor: Lex Black <autumn-wind at web dot de>
# Contributer: N30N <archlinux@alunamation.com>

pkgname=canto
pkgver=0.7.10
pkgrel=3
pkgdesc="A ncurses Atom/RSS/RDF aggregator"
url="http://codezen.org/canto/"
license='GPL'
arch=('i686' 'x86_64')
makedepends=('python2')
depends=('ncurses' 'python2' 'python2-chardet')
optdepends=('python2-feedparser: instead of built-in')
install=${pkgname}.install
source=(http://codezen.org/static/$pkgname-$pkgver.tar.gz)
md5sums=('541d1770496866a5d513305e118b2ab5')


package() {
	cd ${pkgname}-${pkgver}

	msg "Starting build process."
	python2 setup.py install --root=${pkgdir}
}
