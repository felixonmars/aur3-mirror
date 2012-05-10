# Contributor: Francois Boulogne < fboulogne at april dot org >
# Maintainer: Francois Boulogne < fboulogne at april dot org >
pkgname=vpnautoconnect
pkgver=2.0.5
pkgrel=5
pkgdesc="Reconnect automatically (at startup too) a vpn create with network manager."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/vpnautoconnect/"
license=('GPL')
depends=()
install=vpnautoconnect.install
source=(http://sourceforge.net/projects/vpnautoconnect/files/${pkgname}-${pkgver}.tar.gz
	"vpnautoconnect")
md5sums=('e944b4190b98bea4eb9f60fa1c11d8bb' '4fe9f28d13782f4d129a521a1b97c93d')

build() {
  	cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix="${pkgdir}/usr" 
    #The build scripts are made for debian-like systems
    #workaround:
    sed -i 's/install-exec-local$/#install-exec-local/' Makefile.in
    sed -i 's/\sinstall-exec-local\s//' Makefile.in
    make 
}

package(){
  	cd "${srcdir}/${pkgname}-${pkgver}"
    make install 
  	install -d "${pkgdir}"/etc/rc.d
	  ##The daemon provided upstream is for debian-like systems
	  ##A new write, suitable for arch, has been written
    install -m 0755 "${startdir}"/vpnautoconnect "${pkgdir}"/etc/rc.d
    rm -f "${pkgdir}"/usr/share/icons/hicolor/icon-theme.cache
}
# vim:ts=2:sw=2:et:
