# Maintainer: Cesar Ramone <cesar@ovejo.com>
pkgname=django-dnt
pkgver=0.1.0
pkgrel=1
pkgdesc="Make Django requests aware of the DNT header"
url="http://github.com/mozilla/django-dnt"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python2')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://pypi.python.org/packages/source/d/django-dnt/$pkgname-$pkgver.tar.gz)
md5sums=('edde1e64a9f9d6dfbdf1606f58e1da72')

build() {
	  cd $startdir/src/$pkgname-$pkgver
	    python2 setup.py build || return 1
		python2 setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}
