# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>

pkgname=xfwm4-titleless
pkgver=4.10.1
pkgrel=1
pkgdesc="Xfce window manager - patched with option to hide titlebar when maximized"
arch=('i686' 'x86_64')
url="https://bitbucket.org/thesame/xfwm4-titleless"
license=('GPL2')
depends=('libxfce4ui' 'libwnck' 'hicolor-icon-theme')
makedepends=('intltool')
options=('!libtool')
conflicts=('xfwm4')
provides=('xfwm4')
install=${pkgname%%-*}.install
source=("http://archive.xfce.org/src/xfce/${pkgname%%-*}/4.10/${pkgname%%-*}-${pkgver}.tar.bz2"
	"xfwm4-hide-titlebar-when-maximized.patch")

build() {
	cd "${srcdir}/${pkgname%%-*}-${pkgver}"

	patch -Np1 < ${srcdir}/xfwm4-hide-titlebar-when-maximized.patch

	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib \
		--localstatedir=/var \
		--disable-static \
		--enable-startup-notification \
		--enable-randr \
		--enable-compositor \
		--enable-xsync \
		--disable-debug
	make
}

package() {
	cd "${srcdir}/${pkgname%%-*}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}

sha256sums=('380c44fba6eb779e34be0fe94f3726cfa131803014d6073c45aec8a1257fa740'
            '20f9b18f7e2af3566a81adb58a1675ce4c193c392a594e32243f9c00472dbd0f')
