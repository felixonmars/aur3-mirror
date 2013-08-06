# Contributor: Stefan Kirrmann <stefan.kirrmann at gmail dot com>

pkgname=totem-plugin-arte-git
pkgver=20120529
pkgrel=7
pkgdesc="Arte+7 plugin for Totem (only available for IPs in Austria, Belgium, France, Germany and Switzerland)"
arch=("i686" "x86_64")
url="http://gitorious.org/totem-plugin-arte"
license=('GPL')
depends=('totem>=3.0.0' 'vala>=0.15.0' 'libsoup>=2.4' 'totem-plparser' 'gstreamer0.10-bad-plugins' 'libpeas>=1.2.0' 'gsettings-desktop-schemas' 'gstreamer0.10-bad-plugins')
makedepends=('git')
conflicts=('totem-plugin-arte')
source=('totem-plugin-arte::git://gitorious.org/totem-plugin-arte/mainline.git')
install="totem-plugin-arte.install"
sha256sums=('SKIP')

pkgver() {
	cd totem-plugin-arte/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd totem-plugin-arte/
	sed -i '/glib-compile-schemas.*/d' Makefile
	make
}

package() {
	cd totem-plugin-arte/
	make DESTDIR=$pkgdir install
}
