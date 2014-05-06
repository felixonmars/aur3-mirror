pkgname=xfwm4-git-wbr
pkgver=20131023
pkgrel=3
pkgdesc="Xfce window manager - git checkout with path fix window borders do not respond to some touchscreen"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://git.xfce.org/xfce/xfwm4"
groups=('xfce4')
depends=('hicolor-icon-theme' 'libwnck')
makedepends=('git' 'xfce4-dev-tools' 'libxfce4ui-git')
provides=('xfwm4')
conflicts=('xfwm4' 'xfwm4-git')
source=(
    'git://git.xfce.org/xfce/xfwm4'
    'touch_events_on_window_frame.patch'
)
md5sums=(
    'SKIP'
    '440b187de154c539f2e64354d11fade4'
)

pkgver() {
	cd xfwm4/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[_-+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd xfwm4/

	patch -Np1 -i ../../touch_events_on_window_frame.patch

	./autogen.sh
	./configure \
		--enable-maintainer-mode \
		--prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib \
		--localstatedir=/var \
		--disable-static \
		--enable-compositor \
		--enable-xsync \
		--disable-debug
	make
}

package() {
	cd xfwm4/

	make DESTDIR=${pkgdir} install
}
