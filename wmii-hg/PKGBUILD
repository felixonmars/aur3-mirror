# Contributor: Anthony Martin <ality@pbrane.org>
# Maintainer: N30N <archlinux@alunamation.com>
# Contributer: thomasd <thdahms@gmx.de>
# Contributer: karnath <karnath@pop3.ru>
# Contributer: MrBougo <bougospam@gmail.com>
# Contributor: Wolf Ramovsky <wolf.ramovsky@gmail.com>
# Contributor: Benjamin van der Burgh <benjaminvdb@gmail.com>

pkgname="wmii-hg"
pkgver=2813.75881cc5391e
pkgrel=1
pkgdesc="The latest hg pull of wmii, a lightweight, dynamic window manager for X11"
url="http://wmii.suckless.org"
license=("MIT")
arch=("i686" "x86_64")
depends=("libx11" "libxinerama" "libxrandr")
makedepends=("mercurial" "txt2tags" "libixp-hg" "libxft")
optdepends=("libxft: for anti-aliased font support"
	"plan9port: for use of the alternative plan9port wmiirc"
	"python2: for use of the alternative Python wmiirc"
	"ruby-rumai: for use of the alternative Ruby wmiirc"
	"xorg-xmessage: for use of the default wmiirc configs"
	"dash: for use of the default wmiirc configs")
provides=("wmii")
conflicts=("wmii")
source=("wmii::hg+https://wmii.googlecode.com/hg" \
	"fix-freetype-include.patch::https://projects.archlinux.org/svntogit/community.git/plain/trunk/fix-freetype-include.patch?h=packages/wmii")
md5sums=("SKIP" "97febd4a1df80aa4afbd126de1f36496")

pkgver() {
	cd wmii
	echo "$(hg identify -n).$(hg identify -i)"
}

build() {
	cd wmii
	patch -Np1 -i ${srcdir}/fix-freetype-include.patch

	sed -i 's|PREFIX = /usr/local|PREFIX = /usr|' config.mk
	sed -i 's|ETC = $(PREFIX)/etc|ETC = /etc|' config.mk
	sed -i 's# !=#!=#' mk/hdr.mk
	sed -i 's#env python#env python2#' alternative_wmiircs/python/wmiirc
	echo 'LIBS+=-lXrender -lX11 -ldl' >>config.mk

	export MAKEFLAGS="-j1"
	export LDFLAGS="$(echo ${LDFLAGS} | sed -r "s/(^|,)--as-needed(,|$)/ /")"
	make
}

package() {
	cd wmii
	install -Dm644 debian/file/wmii.desktop \
		"${pkgdir}/usr/share/xsessions/${pkgname}.desktop"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	install -d "${pkgdir}/usr/lib/python2.7/site-packages/pygmi"

	make DESTDIR="${pkgdir}" PYTHON=python2 install
}

# vim: set noet ff=unix
