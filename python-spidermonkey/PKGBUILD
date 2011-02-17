# Maintainer: Cesar Ramone <cesar@ovejo.com>
pkgname=python-spidermonkey
pkgver=0.0.10
pkgrel=1
pkgdesc="JavaScript / Python bridge."
url="http://github.com/davisp/python-spidermonkey"
arch=('i686' 'x86_64')
license=('MIT')
depends=('python2')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://pypi.python.org/packages/source/p/python-spidermonkey/$pkgname-$pkgver.tar.gz)
md5sums=('baf9d5fcd30c80829e9e65071a8238d1')

build() {
	  cd $startdir/src/$pkgname-$pkgver
	    python2 setup.py build || return 1
		python2 setup.py install --prefix=/usr --root=$startdir/pkg || return 1
	    
		install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
