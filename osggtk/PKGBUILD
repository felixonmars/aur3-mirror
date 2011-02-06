# Contributor: Dmitry Batenkov <dima dot batenkov at gmail dot com>

pkgname=osggtk
pkgver=0.1.4
pkgrel=1
pkgdesc="GTK Widgets for OpenSceneGraph"
arch=('i686' 'x86_64')
url="http://osggtk.sourceforge.net/"
depends=('gtkglextmm' 'gtkmm' 'openscenegraph')
license=('GPL')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('3e8152b9e97f961acea059ec7f981c17')

build(){
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr --enable-examples --enable-gtkmm
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
}
