# PKGBUILD updated by 0xReki <reki@rekislife.de>
pkgname="x-unikey"
pkgver=1.0.4
pkgrel=2
pkgdesc="X and GTK input method for typing Vietnamese"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/unikey"
license=(GPL)
depends=(libstdc++5 libx11 gtk2)
install=unikey.install
source=("http://downloads.sourceforge.net/unikey/x-unikey-${pkgver}.tar.bz2"
	"usrkeymap.cpp.diff"
	"Makefile_unikey-gtk.in.diff"
	"mactab.cpp.diff"
	"Makefile_xim.in.diff")

md5sums=('9019f3f5eae3df333171c8099f0a2f44'
         '52fed0480602f6708befbf2987b759fe'
         '3131daf0ab98a0538714872e46e82aad'
         '89d15c253348d89ac9a48214ab59c816'
         '76a7e201bfc2cc6c550d2875726afff9')

build()
{
	cd ${srcdir}/${pkgname}-${pkgver}
	patch -uN src/ukengine/usrkeymap.cpp ../usrkeymap.cpp.diff || return 1
	patch -uN src/xim/Makefile.in ../Makefile_xim.in.diff || return 1
	patch -uN src/unikey-gtk/Makefile.in ../Makefile_unikey-gtk.in.diff || return 1
	patch -uN src/ukengine/mactab.cpp ../mactab.cpp.diff || return 1
	./configure --with-unikey-gtk --prefix=/usr --sysconfdir=/etc
}

package()
{
	cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install || return 1
}
