# Maintainer: Kozec <kozec at kozec dot com>

pkgname=python-brisa
pkgver=0.10.1
pkgrel=1
pkgdesc="Python framework for building UPnP devices, services and control points."
arch=('i686' , 'x86_64')
url="http://brisa.garage.maemo.org/"
license=('LGPL')
depends=('python2' 'python2-paste')
source=(https://garage.maemo.org/frs/download.php/6793/${pkgname}_${pkgver}maemo0.tar.gz)

build() {
	true
}

package() {
	cd ${pkgname}
	python2 setup.py install --prefix=$pkgdir/usr
}

md5sums=('6929bb68c67547dcbaffe55c4b303a00')
