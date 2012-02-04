# Contributor: Hugo Doria <hugodoria@gmail.com>
# Maintainer: Hugo Doria <hugodoria@gmail.com>

pkgname=gedit-pomode
pkgver=0.1.6
pkgrel=1
pkgdesc="plugin for convinient editing PO files in the gedit text editor"
url="http://sourceforge.net/projects/gedit-pomode"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gedit' 'gnome-python')
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('32e2c26e187c98cecf1e78b8b19c4f78')

build() {
	cd ${startdir}/src/${pkgname}-${pkgver}
	make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1
}
