# Maintainer : MrJohnsson <christian at mrjohnsson dot net>
# Contributor : sebikul <sebikul@gmail.com>
# Contributor: Morfeo
# Contributor: Jakob <dammawit@gmail.com>

pkgname=gadmin-proftpd
pkgver=0.4.6
pkgrel=1
pkgdesc="A GTK+ graphical user interface for the proftpd FTP server."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'gksu' 'gnome-icon-theme' 'proftpd')

options=(!libtool)
url="http://dalalven.dtdns.net/linux/gadmintools-webpage/"

source=(http://dalalven.dtdns.net/linux/$pkgname/$pkgname-$pkgver.tar.gz)

md5sums=('87fca723c0661f0b569325c8f5765700')

build() {

	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin --localstatedir=/var
	make || return 1

}

package() {

	cd ${srcdir}/${pkgname}-${pkgver}

	make DESTDIR=${pkgdir} install
  
	mkdir -p ${pkgdir}/usr/share/applications/
	install -m644 desktop/gadmin-proftpd.desktop ${pkgdir}/usr/share/applications/
  
	chmod 700 ${pkgdir}/etc/gadmin-proftpd

	install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENCE


}