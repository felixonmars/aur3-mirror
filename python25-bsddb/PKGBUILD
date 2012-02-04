# Contributor Jakub Skaryd <skaryd@gmail.com>
pkgname=python25-bsddb
pkgver=4.7.5
pkgrel=1
pkgdesc="Python 2.5 interface for BerkeleyDB"
arch=('i686' 'x86_64')
license=('MIT')
url="http://www.jcea.es/programacion/pybsddb.htm"
depends=('db' 'python25')
source=(http://pypi.python.org/packages/source/b/bsddb3/bsddb3-$pkgver.tar.gz)

md5sums=('8f0773f5de160c39263f5af9ead1d0dc')

build () {
	cd $startdir/src/bsddb3-$pkgver
	python2.5 setup.py build --berkeley-db=/usr
	python2.5 setup.py install --root=$startdir/pkg --berkeley-db=/usr
}
