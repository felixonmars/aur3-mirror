# Contributor: Juan Diego Tascon

pkgname=osgart2
pkgver=2.0_RC3
pkgrel=2
pkgdesc="Library that simplifies the development of augmented reality"
arch=('i686' 'x86_64')
url="http://www.osgart.org"
license=('GPL')
depends=('artoolkit-svn' 'openscenegraph')
source=("http://www.osgart.org/files/osgART_${pkgver}.zip")
md5sums=('e42bef7f45df694acb0bc0f5d75074b4')

build() {
	cd $srcdir/osgART_${pkgver}

	cat include/osgART/Utils | sed s/exit/return/ >> Utils.tmp
	mv -f Utils.tmp include/osgART/Utils

	cmake -DCMAKE_INSTALL_PREFIX=/usr/ .
	make
	make DESTDIR=$pkgdir install
}

