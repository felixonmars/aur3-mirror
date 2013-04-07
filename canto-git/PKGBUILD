# Contributor: Lex Black <autumn-wind at web dot de>
# Contributer: N30N <archlinux@alunamation.com>

_pkgname=canto
pkgname=canto-git
pkgver=0.7.9.7.ge5a4b15
pkgrel=1
epoch=1
pkgdesc="A ncurses Atom/RSS/RDF aggregator"
url="http://codezen.org/canto/"
license='GPL'
arch=('i686' 'x86_64')
makedepends=('python2' 'git')
depends=('ncurses' 'python2' 'python2-chardet')
optdepends=('python2-feedparser: instead of built-in')
provides=('canto')
conflicts=('canto')
install=${pkgname}.install
source=('git://codezen.org/git/canto')
md5sums=('SKIP')


pkgver() {
	cd $_pkgname
	git describe --always | sed -e 's|-|.|g'
}

package() {
	cd ${_pkgname}

	msg "Starting build process."
	python2 setup.py install --root=${pkgdir}
}
