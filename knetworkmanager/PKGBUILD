# Contributor: Leonardo A. Gallego <leonardo@archlinux-es.org>
pkgname=knetworkmanager
pkgver=0.2.2
pkgrel=4
license=('GPL')
arch=('i686' 'x86_64')
options=(libtool)
pkgdesc="A NetworkManager front-end for kde3 and kde4, based in version 0.2.2 stable"
url="http://en.opensuse.org/Projects/KNetworkManager"
depends=('networkmanager>=0.6.6' 'kdelibs3' 'dbus-qt3')
makedepends=('pkgconfig')
source=("ftp://ftp.kde.org/pub/kde/stable/apps/KDE3.x/network/${pkgname}-${pkgver}.tar.bz2" \
	'policy-fix.patch')
md5sums=('82ba5d7987b147db783fbcb97ed74369' 'fc827365f8e36f7721cfe978b9b41fee')

build() {
	cd $startdir/src/$pkgname-$pkgver

	cd knetworkmanager
	patch -p1 -i $startdir/src/policy-fix.patch || return 1
	cd ..
	./configure --with-distro=arch --prefix=/opt/kde --sysconfdir=/etc \
	--without-arts --with-dialup --with-pptp --with-vpnc \
       	--with-qt-dir=/opt/qt --enable-final || return 1
	make || return 1
	make DESTDIR=$startdir/pkg/ install || return 1
}
