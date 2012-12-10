# Maintainer: localizator <localizator@ukr.net>

pkgname=libappindicator1
pkgver=12.10.0
pkgrel=1
pkgdesc="Library to allow applications to export a menu into the Unity Menu bar (GTK+ 2 library)"
url="https://launchpad.net/libappindicator"
license=('LGPL')
depends=('libindicator' 'libdbusmenu-gtk2')
makedepends=('gobject-introspection' 'vala' 'gtk-sharp-2' 'pygtk' 'perl-xml-libxml' 'dbus-glib')
options=(!strip !zipman)

arch=('i686' 'x86_64')
if [ "$CARCH" = 'i686' ]; then
   source=("${pkgname}_${pkgver}-0ubuntu1_i386.deb::http://mirror.leaseweb.com/ubuntu/pool/main/liba/libappindicator/${pkgname}_${pkgver}-0ubuntu1_i386.deb")
   sha256sums=('501c0b1e3b6ae6964419aa1cd9b28df3ae558e5cfe6cd2f3343086f3613838cf')
elif [ "$CARCH" = "x86_64" ]; then
   source=("${pkgname}_${pkgver}-0ubuntu1_amd64.deb::http://mirror.leaseweb.com/ubuntu/pool/main/liba/libappindicator/${pkgname}_${pkgver}-0ubuntu1_amd64.deb")
   sha256sums=('c765dd9ba14df19e1e20407d913dcabc1713aca85ac7d1db72667f6f9ef9400a')
fi

package() {
	     cd $srcdir
         tar xvf data.tar.gz
         cp -rp usr $pkgdir
}