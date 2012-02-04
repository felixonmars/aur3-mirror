# Contributor: Oleg Smirnov <oleg.smirnov@gmail.com>
pkgname=pysnmp-mibs
pkgver=0.0.8a
pkgrel=2
arch=('i686' 'x86_64')
license=('custom:BSD')
pkgdesc="Pre-compiled MIB modules for PySNMP"
url="http://sourceforge.net/projects/pysnmp/"
depends=('python2' 'setuptools')
source=(http://mesh.dl.sourceforge.net/sourceforge/pysnmp/files/$pkgname-$pkgver.tar.gz)
md5sums=('274f0ac3a4bb31471d0799fee60883a6')
build() {
	cd $startdir/src/$pkgname-$pkgver
	python2 setup.py install --root=$startdir/pkg || return 1
	# install LICENSE
    	install -D -m 644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
