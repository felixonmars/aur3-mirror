# Contributor:	Pablo Lezaeta	<prflr88 @ gmail.com>

pkgname=traylib
_pkgname=TrayLib
pkgver=0.3.2.1
_pkgver=0.3.2.1
pkgrel=1
pkgdesc="TrayLib is a python2 module that eases the creation of tray-like applets. These
are applets that mainly consist of a box, which contains some icons representing
some objects in the system."
group=('rox-desktop')
arch=('i686'  'x86_64')
url="http://roscidus.com/desktop/TaskTray"
license=('GPL')
makedepends=('epydoc')
depends=('rox-lib')
source=(ftp://ftp.berlios.de/pub/rox4debian/libs/TrayLib-0.3.2.1.tgz)
#	arch_specific.patch)

md5sums=('65835e3a78562c8e1f91a432beda801d')

build() {
	cd "$srcdir/$_pkgname"
#	patch -Np1 -i ../arch_specific.patch
	./make_docs
	rm -R Help
}

package () {
	cd "${srcdir}/$_pkgname"
	install -d "${pkgdir}/usr/lib"
	cp -a ${srcdir}/$_pkgname ${pkgdir}/usr/lib
}
