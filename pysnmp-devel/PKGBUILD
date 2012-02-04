# Contributor: TheGrudge <andi.clemens@gmx.net>

pkgname=pysnmp-devel
pkgver=4.1.10a
pkgrel=1
arch=('i686' 'x86_64')
license=('custom:BSD')
pkgdesc="SNMP for the python language"
url="http://sourceforge.net/projects/pysnmp/"
depends=('python' 'setuptools' 'pyasn1')
source=(http://mesh.dl.sourceforge.net/sourceforge/pysnmp/pysnmp-$pkgver.tar.gz)
md5sums=('bc8b01d35349fe45536dd5ecee010c38')

build() {
	cd $startdir/src/pysnmp-$pkgver
	python setup.py install --root=$startdir/pkg || return 1
    # install LICENSE
    install -D -m 644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
} 
