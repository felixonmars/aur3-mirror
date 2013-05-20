pkgname=kdm-rosa-theme-git
_pkgname=kdm-rosa-theme
pkgver=4.10.1
pkgrel=1
pkgdesc="Kdm theme from Rosa Desktop 2012, requires patched kdebase-workspace"
arch=('i686' 'x86_64')
url=('http://www.rosalab.ru/')
conflicts=('kdm-rosa-theme')
license=('GPL' 'LGPL' 'FDL')
depends=('kdebase-workspace-rosa')
provides=('kdm-rosa-theme')
conflicts=('kdm-rosa-theme')
_gitroot="https://bober@abf.rosalinux.ru/bober/archlinux-rosa-kdm.git"
_gitname="archlinux-rosa-kdm"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
	    cd $_gitname && git pull origin
	    msg "The local files are updated."
	else
	    git clone $_gitroot $_gitname
	fi
	
	msg "GIT checkout done or server timeout"	
}

package() {
	cd ${srcdir}
	mkdir -p ${pkgdir}/usr/share/apps/kdm/themes/mandriva-kde4/
	mkdir -p ${pkgdir}/usr/share/apps/kdm/package/
	cp -Rn $_gitname/mandriva-kde4/ ${pkgdir}/usr/share/apps/kdm/themes/
	#cp -Rn $_gitname/package/ ${pkgdir}/usr/share/apps/kdm/
}