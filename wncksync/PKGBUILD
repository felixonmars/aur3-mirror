# Contributor: twa022 <twa022 at gmail dot com>

pkgname=wncksync
pkgver=0.2.8
pkgrel=2
pkgdesc='A library to build launchers'
arch=('i686' 'x86_64')
url='http://launchpad.net/wncksync'
license=('GPL3')
source=(http://launchpad.net/${pkgname}/${pkgver%.*}/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz)
depends=('dbus-glib' 'libwnck' 'libgtop' 'glib2-ubuntu' 'gnome-menus')
makedepends=()
options=(!libtool)

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr || return 1
	make || return 1
	make install DESTDIR=$pkgdir
}

md5sums=('eb936c9340bbad18856a2797d57a015d')
