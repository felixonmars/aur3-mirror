# Contributor: Joshua Taylor (deficite) <joshtaylor.mail@gmail.com>
pkgname=pythondialog
pkgver=2.7
pkgrel=4
arch=('i686' 'x86_64')
license=('LGPL')
pkgdesc="Python package for interfacing with dialog"
url="http://pythondialog.sf.net"
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)
depends=('python' 'dialog')
md5sums=('19e68b362fe61ef84b981d53d96f0735')

build() {
	cd $startdir/src/$pkgname-$pkgver
	python setup.py install --prefix=/usr --root=$startdir/pkg
}
