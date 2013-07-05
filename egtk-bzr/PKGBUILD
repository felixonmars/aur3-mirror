# Maintainer: fresh24 <pascher dot christian at gmail dot com>

pkgname=egtk-bzr
pkgver=649
pkgrel=1
pkgdesc="Development branch of the elementary GTK theme."
arch=('i686' 'x86_64')
url="https://launchpad.net/egtk"
license=('GPL2')
depends=('gtk-engine-murrine' 'gtk-engine-unico')
optdepends=('elementary-icons')
makedepends=('bzr')
conflicts=('elementary-gtk-theme')

_bzrmod=egtk
source=('bzr+lp:egtk')
md5sums=('SKIP')

pkgver() {
	cd $_bzrmod
	
	bzr revno
}

package() {
	cd ${_bzrmod}

	mkdir -p ${pkgdir}/usr/share/themes/elementary/
	cp -r gtk-2.0 ${pkgdir}/usr/share/themes/elementary/
	cp -r gtk-3.0 ${pkgdir}/usr/share/themes/elementary/
	cp -r metacity-1 ${pkgdir}/usr/share/themes/elementary/

	# ensure sane perms
	find ${pkgdir}/usr/share/themes/elementary/ -type f -exec chmod 644 {} \;
	find ${pkgdir}/usr/share/themes/elementary/ -type d -exec chmod 755 {} \;

		install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
