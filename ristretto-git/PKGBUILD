# $Id: PKGBUILD 39718 2009-05-20 16:54:13Z ronald $
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=ristretto-git
pkgver=0.6.0.r124.g19403ef
pkgrel=1
pkgdesc="Ristretto is a image viewer for Xfce (Git version)"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/applications/ristretto"
license=('GPL2')
depends=('libxfce4ui-git' 'libexif' 'desktop-file-utils')
makedepends=('git' 'intltool')
optdepends=('librsvg: SVG support'
            'tumbler-git: thumbnailing support')
conflicts=('ristretto')
groups=("xfce4-git")
install=ristretto.install
md5sums=('SKIP')
source=("ristretto::git://git.xfce.org/apps/ristretto")

pkgver() {
	cd "ristretto"

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[_-+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}
build() {
	cd "${srcdir}/ristretto"

	./autogen.sh --prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-debug
	make
}

package() {
	cd "${srcdir}/ristretto"
	make DESTDIR=${pkgdir} install
}
