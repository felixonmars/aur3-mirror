# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=gadmin-openvpn-client
pkgver=0.1.9
pkgrel=1
pkgdesc='A GTK+ graphical user interface for OpenVPN(client).'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk2' 'openvpn')
makedepends=('pkgconfig')
optdepends=('gksu: Graphical SU support')
options=(!libtool)
url="http://dalalven.dtdns.net/linux/gadmintools-webpage/"
source=("http://dalalven.dtdns.net/linux/gadmin-openvpn/client/${pkgname}-${pkgver}.tar.gz" \
		"${pkgname}.desktop" \
		"${pkgname}-menu")
md5sums=('f4fd3b2a82d7da76b094448f725ab68b'
         'c006771d442f98cb86c33355fab0cb08'
         '9d565afd1456a75103a416ebda8d68ae')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr 
	make 
}
package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install 
	install -Dm755 ${srcdir}/${pkgname}-menu ${pkgdir}/usr/sbin/${pkgname}-menu
	install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}


