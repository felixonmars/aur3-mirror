# Maintainer: Klemen Košir <klemen913@gmail.com>

pkgname=xfwm4-git-vlc
pkgver=4.11.1.r98.g91c632a
pkgrel=1
pkgdesc="Xfce window manager - git checkout, patched to hide the panel when VLC is fullscreen."
arch=('i686' 'x86_64')
license=('GPL2')
url="http://git.xfce.org/xfce/xfwm4"
groups=('xfce4')
depends=('libxfce4ui-git' 'hicolor-icon-theme' 'libwnck')
makedepends=('git' 'xfce4-dev-tools' 'intltool')
provides=('xfwm4')
conflicts=('xfwm4')
install="xfwm4.install"
source=('git://git.xfce.org/xfce/xfwm4' 'vlc-fullscreen.patch')
sha256sums=('SKIP' '78d1399888cfed91ab73d9e496b85d5ce1d0c2866ba67af34669881866a3fdb8 ')

pkgver() {
	cd xfwm4/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git-vlc}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[_-+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd xfwm4/

	patch -p0 < $srcdir/vlc-fullscreen.patch

	./autogen.sh
	./configure \
		--enable-maintainer-mode \
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
	cd xfwm4/

	make DESTDIR="$pkgdir" install
}