# Maintainer: Brett Goulder <predator.hawk@gmail.com>
pkgname=light-themes-bzr
pkgver=45
pkgrel=1
pkgdesc="Ubuntu 'light' themes Ambiance and Radiance (GTK2 and GTK3)"
arch=('i686' 'x86_64')
url="https://launchpad.net/light-themes"
license=('GPL')
depends=("gtk-engine-murrine" "ubuntu-mono" "gtk3" "gtk-engine-unico")
makedepends=('bzr')
provides=('light-themes')
conflicts=('light-themes')
source=()
md5sums=()
_bzrbranch=lp:ubuntu/light-themes
_bzrmod=light-themes

build() {
	cd ${srcdir}

	msg "Connecting to the server...."

	if [ ! -d ./${_bzrmod} ]; then
		bzr co ${_bzrbranch} ${_bzrmod}
	else
		bzr up ${_bzrmod}
	fi

	msg "BZR checkout done or server timeout"
	msg "Starting make..."

	[ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
	cp -r ./${_bzrmod} ./${_bzrmod}-build
	cd ./${_bzrmod}-build

	install -d ${pkgdir}/usr/share/themes || return 1
	cp -R Ambiance/ ${pkgdir}/usr/share/themes/ || return 1
	cp -R Radiance/ ${pkgdir}/usr/share/themes/ || return 1

	sed -i -e "/shadow radius/d" "$pkgdir/usr/share/themes/Ambiance/metacity-1/metacity-theme-1.xml"
	sed -i -e "/shadow radius/d" "$pkgdir/usr/share/themes/Radiance/metacity-1/metacity-theme-1.xml"
	sed -i -e "/padding/d" "$pkgdir/usr/share/themes/Ambiance/metacity-1/metacity-theme-1.xml"
	sed -i -e "/padding/d" "$pkgdir/usr/share/themes/Radiance/metacity-1/metacity-theme-1.xml"
}
