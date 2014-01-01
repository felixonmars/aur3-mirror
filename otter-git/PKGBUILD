# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=otter-git
pkgver=0.1.01.r0.g45f02ef
pkgrel=1
pkgdesc="Otter Browser, project aiming to recreate classic Opera (12.x) UI using Qt5 - git checkout"
arch=('x86_64' 'i686')
url="http://otter-browser.org/"
license=('GPL2')
provides=('otter')
conflicts=('otter')
depends=('qt5-webkit' 'libxcb')
makedepends=('git')
source=('git+https://github.com/Emdek/otter.git')

pkgver() {
	cd otter/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd otter/

	cmake -DCMAKE_INSTALL_PREFIX="/usr" .
	make
}

package() {
	cd otter/

	make DESTDIR=${pkgdir} install
}

sha256sums=('SKIP')
