#Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=eselect
pkgver=1.3.4
pkgrel=1
pkgdesc="Gentoo's multi-purpose configuration and management tool"
url="http://www.gentoo.org/proj/en/eselect/"
install=${pkgname}.install
source=("http://git.overlays.gentoo.org/gitweb/?p=proj/eselect.git;a=snapshot;h=adf60f091a1220b49d9aab51630de31fb7ac1065;sf=tgz")
arch=('i686' 'x86_64')
options=('emptydirs')
backup=('etc/make.conf')
depends=('file' 'sed' 'ncurses' 'gettext')
license=('GPL2')
md5sums=('9f9ed58b6739c6a126e197d5d09c324f')

build() {
     cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr
    make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
	#FIX NON-EXISTING LINK TO FILES
	rm -r ${pkgdir}/usr/share/man/man1
	install -Dm644 man/eselect.1 ${pkgdir}/usr/share/man/man1/eselect.1

}

