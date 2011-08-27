# Maintainer: Cesar Ramone <cesar@ovejo.com>
pkgname=rapidgiza
_pkgname=RapidGiza
pkgver=0.2.1
pkgrel=1
pkgdesc="Set of paster templates for rapid Pyramid development"
url="https://github.com/serverzen/RapidGiza"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python2')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://pypi.python.org/packages/source/R/RapidGiza/$_pkgname-$pkgver.tar.gz)
md5sums=('dd06290723b8575b107dbf43282a38a1')

build() {
	  cd $startdir/src/$_pkgname-$pkgver
	    python2 setup.py build || return 1
		python2 setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}
