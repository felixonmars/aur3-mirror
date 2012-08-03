# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Gustavo Chain <g@0xff.cl>

pkgname=lightblue
pkgver=0.4
pkgrel=1
pkgdesc="LightBlue is a cross-platform Bluetooth API for Python which provides simple access to Bluetooth operations"
arch=('i686' 'x86_64')
url="http://lightblue.sourceforge.net/"
license=('GPL')
depends=('python2' 'python-pybluez' 'openobex')
source=(http://ufpr.dl.sourceforge.net/sourceforge/lightblue/$pkgname-$pkgver.tar.gz)
md5sums=('2f2bf66faa4bf1a79eb28a47584077b7')

build() {
	cd $srcdir/$pkgname-$pkgver
	python2 setup.py install --root=$pkgdir
}
