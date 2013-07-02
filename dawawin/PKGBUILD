# Maintainer: M-Hashem <med.hashem@gmail.com>

pkgname=dawawin
pkgver=0.1.27
pkgrel=1
pkgdesc="Display and store Arabic poems"
arch=('i686' 'x86_64')
license=('waqf')
url="http://linuxac.org"
depends=('python2' 'python2-gobject' 'gstreamer0.10')
source=(http://sourceforge.net/projects/dawawin/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('60c5d6b4acd2d043ddf5fa271e2793ee')
build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	python2 setup.py install --root=$pkgdir/ --optimize=1
	install -Dm 644 ${pkgname}.svg ${pkgdir}/usr/share/pixmaps/${pkgname}.svg
}
