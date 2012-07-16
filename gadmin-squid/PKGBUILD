# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=gadmin-squid
pkgver=0.1.4
pkgrel=1
pkgdesc="A C/GTK+ graphical user interface for the Squid proxy server."
arch=(i686 x86_64)
license=('GPL')
depends=('gtk2' 'squid')
makedepends=('pkgconfig')
options=(!libtool)
url="http://dalalven.dtdns.net/linux/gadmintools-webpage/app_pages/gadmin-squid.html"
source=("http://dalalven.dtdns.net/linux/${pkgname}/${pkgname}-${pkgver}.tar.gz" "${pkgname}.desktop" "${pkgname}-menu")
optdepends=('gksu: Graphicial Sudo Support')
md5sums=('6a95e3857290efcd6b062b7144d394f8'
         '5711c997615db68d550e1fcf1bdd5d2f'
         '0dec2afb273774234cf29c0e60edbe8c')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    autoconf
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var 
    make 
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    install -d ${pkgdir}/usr/share/{applications,pixmaps}
    make DESTDIR=${pkgdir} install
    install -Dm644 pixmaps/${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
    install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    ## For Optional Dependency Support
    install -Dm755 ${srcdir}/${pkgname}-menu ${pkgdir}/usr/sbin/${pkgname}-menu
}
