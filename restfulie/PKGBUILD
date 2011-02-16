# Maintainer: Cesar Ramone <cesar@ovejo.com>
pkgname=restfulie
pkgver=0.8
pkgrel=1
pkgdesc="CRUD through HTTP is a good step forward to using resources and becoming RESTful, another step further is to make use of hypermedia aware resources and Restfulie allows you to do it in Python"
url="http://restfulie.caelum.com.br/"
arch=('i686' 'x86_64')
license=('OSI')
depends=('python2' 'httplib2')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://pypi.python.org/packages/source/r/restfulie/$pkgname-$pkgver.tar.gz)
md5sums=('cc9ff456a2281bdd51b226924634853b')

build() {
	  cd $startdir/src/$pkgname-$pkgver
	    python2 setup.py build || return 1
		python2 setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}
