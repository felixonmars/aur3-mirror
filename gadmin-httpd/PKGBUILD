# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=gadmin-httpd
pkgver=0.1.5
pkgrel=1
pkgdesc="A GTK+ graphical user interface for the Apache httpd webserver."
arch=(i686 x86_64)
license=('GPL')
depends=('gtk2' 'apache')
optdepends=("gksu: Graphical Su Support")
makedepends=('pkgconfig')
options=(!libtool)
url="http://dalalven.dtdns.net/linux/gadmintools-webpage/"
source=("http://dalalven.dtdns.net/linux/${pkgname}/${pkgname}-${pkgver}.tar.gz" "${pkgname}.desktop" "${pkgname}-menu")
md5sums=('8ac1af620aa06a2bf0865e62fb800064'
         '1344e98bcbd23fcd2143617155ca6e11'
         'e4d763e03f444a95e13aad83a3f554f9')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
			  --sbindir=/usr/sbin \
              --localstatedir=/var --disable-static 
  make 
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
    install -d ${pkgdir}/usr/share/applications/
	install -Dm755 ${srcdir}/${pkgname}-menu ${pkgdir}/usr/sbin/${pkgname}-menu
    install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}


