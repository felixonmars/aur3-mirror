# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=udev-net-notify
pkgver=0.2.1.r2.gad5603a
pkgrel=1
pkgdesc="Notify about udev net events"
arch=('i686' 'x86_64')
url="http://www.eworm.de/"
depends=('libnotify' 'udev' 'gnome-icon-theme')
makedepends=('git')
license=('GPL')
source=('git://github.com/eworm-de/udev-net-notify.git')

pkgver() {
	cd udev-net-notify/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[_-+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}


build() {
	cd udev-net-notify/

	make
}

package() {
	cd udev-net-notify/

	install -D -m0755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
	install -D -m0644 ${pkgname}.desktop ${pkgdir}/etc/xdg/autostart/${pkgname}.desktop
}

sha256sums=('SKIP')
