# Maintainer: Cesar Ramone <cesar@ovejo.com>
pkgname=makesite
pkgver=0.5.2
pkgrel=1
pkgdesc="Makesite is collection scripts for make and control site structure."
url="http://github.com/klen/makesite"
arch=('any')
license=('OSI')
depends=('python2' 'python-pip')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://pypi.python.org/packages/source/m/makesite/$pkgname-$pkgver.tar.gz)
md5sums=('8658ec8263e322774a63355c70795cf7')

build() {
	  cd $startdir/src/$pkgname-$pkgver
	    python2 setup.py build || return 1
		python2 setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}
