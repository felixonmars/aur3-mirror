# Maintainer: Bartosz Chmura <chmurli at gmail dot com>

pkgname=python-py-notify
_pkgname=
pkgver=0.2.1
pkgrel=3
pkgdesc="providing tools for implementing Observer programming pattern (include signals, conditions and variables)"
arch=('any')
url="http://home.gna.org/py-notify/"
license=('GNU LGPL 2.1')
depends=('python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://download.gna.org/py-notify/py-notify-${pkgver}.tar.gz)
md5sums=('985b323173e8e5cc73e89cbb3a0b9704')

build () {

	cd $srcdir/py-notify-$pkgver
	#./setup.py build
	#./setup.py install
	
	python2 setup.py install --root=$pkgdir/ --optimize=1

}





