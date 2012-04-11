# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=hamachi-gui
pkgver=0.9.6
pkgrel=5
pkgdesc="A graphical user interface for the zero configuration VPN client Hamachi."
arch=('i686' 'x86_64')
url="http://hamachi-gui.sourceforge.net"
license=('GPL')
depends=('gtk2' 'hamachi' 'libglade')
makedepends=('perl-xml-parser')
optdepends=('gksu: Needed to facilitate launching from menus')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}_${pkgver}.tar.gz"
        'pt_BR-0.9.6.tar.gz')
md5sums=('f90457e141f21d16ec9df97ae8b35b9a'
         '4c6bd039f3b4f474d49593d27dc585b1')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	
	# Fix missing libX11.so in linker
	export LIBS+=" -lX11"	
	# Fix GtkSpinButton "adjustment with non-zero page size" deprecation message. 
	sed "s#0.10000000000000001<#0#" -i resources/window.glade
    # Add translation: pt_Br.po
	cp -a "${srcdir}/pt_BR.po" po/
	sed "s#^ALL_LINGUAS=\"#ALL_LINGUAS=\"pt_BR #" -i configure
	
	./configure --prefix=/usr
	make
}
package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
