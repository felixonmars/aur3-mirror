# Contributor: JJ <jueldo@gmail.com>

pkgname=gjots2
pkgver=2.3.10
pkgrel=1
pkgdesc="A hierarchical text editor for X11/gtk-gnome"
arch=('i686' 'x86_64')
url="http://bhepple.freeshell.org/gjots/"
license=('GPL')
depends=('gtk2' 'gnome-python')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tgz)
md5sums=('8211fb010b02f99f006691bae1ca5034')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	mkdir -p ${pkgdir}/usr/lib/python2.6/site-packages
	python setup.py install --prefix=${pkgdir}/usr
}
