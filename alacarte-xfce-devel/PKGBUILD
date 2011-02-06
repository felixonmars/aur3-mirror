# Maintainer: Xavier Devlamynck <magicrhesus@ouranos.be> 
# Contributor: xerverius

pkgname=alacarte-xfce-devel
pkgver=0.13.2
pkgrel=2
pkgdesc="Menu editor for Xfce"
arch=(any)
license=('LGPL')
url="http://git.gnome.org/browse/alacarte/"
depends=('gnome-menus>=2.30.4' 'exo-devel')
makedepends=('intltool')
options=('!libtool')
conflicts=('alacarte')
source=(http://ftp.gnome.org/pub/gnome/sources/alacarte/0.13/alacarte-${pkgver}.tar.bz2)
sha256sums=('9fa36e5181b1eea947b184cb0f79d796b25cc5a5f122819a1ac2ff01bc7ee4ed')

build() {
	cd ${srcdir}/alacarte-${pkgver}
	sed -e 's/gnome-desktop-item-edit/exo-desktop-item-edit/g' -i Alacarte/MainWindow.py
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
	make
}

package() {
	cd ${srcdir}/alacarte-${pkgver}
	make DESTDIR=${pkgdir} install
}
