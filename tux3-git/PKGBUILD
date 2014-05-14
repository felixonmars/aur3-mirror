# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=tux3-git
pkgver=0.r1862.gd5e8a10
pkgrel=1
pkgdesc="tux3 file system - git checkut"
arch=('x86_64' 'i686')
url="http://www.tux3.org/"
license=('GPL')
makedepends=('git')
optdepends=('fuse: use tux3 in userspace')
provides=('tux3')
conflicts=('tux3')
source=('git+https://github.com/OGAWAHirofumi/tux3#branch=hirofumi')
sha256sums=('SKIP')

pkgver() {
	cd tux3/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd tux3/user/

	make
}

package() {
	cd tux3/user/

	make DISTDIR="${pkgdir}/" PREFIX="/usr" install
}

