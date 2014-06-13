# Maintainer: udeved <udeved@openrc4arch.site40.net>

pkgname=openrc-settingsd
pkgver=1.0.1
pkgrel=6
pkgdesc="System settings D-Bus service for OpenRC"
arch=('i686' 'x86_64')
url="http://dev.gentoo.org/~tetromino/distfiles/openrc-settingsd/"
license=('GPL2')
groups=('openrc-systemd')
depends=('dbus' 'openrc-core' 'glib2' 'polkit' 'systemd' 'xz')
makedepends=('pkg-config')
conflicts=('eudev' 'eudev-git')
install=${pkgname}.install
source=("${url}/$pkgname-$pkgver.tar.xz")
sha256sums=('2047267982c716cbc113d76d826f9b694706dbf737273eaaab239f6839d9ade2')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure \
	  --prefix=/usr \
	  --sbindir=/usr/bin \
	  --libexecdir=/usr/lib \
	  --with-pidfile=/run/openrc-settingsd.pid \
	  --sysconfdir=/etc
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	local _shebang='s|#!/sbin/runscript|#!/usr/bin/runscript|' _lib='s|@libexecdir@|/usr/lib|'
	sed -e "${_shebang}" -e "${_lib}" -i "${pkgdir}/etc/init.d/${pkgname}"
	rm -r ${pkgdir}/usr/share/{dbus-1,polkit-1}
	rm -r ${pkgdir}/etc/dbus-1
}
