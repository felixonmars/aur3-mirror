# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=tux3-dkms-git
pkgver=0.r1862.g0285527
pkgrel=3
pkgdesc="tux3 file system module - git checkut"
arch=('any')
url="http://www.tux3.org/"
license=('GPL')
depends=('linux-headers' 'dkms')
makedepends=('git')
provides=('tux3-dkms')
conflicts=('tux3-dkms')
install=tux3-dkms.install
source=('git+https://github.com/OGAWAHirofumi/tux3#branch=hirofumi'
	'dkms.conf')

pkgver() {
	cd tux3/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

prepare() {
	cd tux3/user/

	sed "s/%VERSION%/${pkgver}/" < ${srcdir}/dkms.conf > dkms.conf
	sed -i 's/$(CONFIG_TUX3)/m/' kernel/Makefile
}

package() {
	cd tux3/user/

	mkdir -p ${pkgdir}/usr/src/
	cp -a kernel/ ${pkgdir}/usr/src/tux3-${pkgver}/

	install -D -m0644 dkms.conf ${pkgdir}/usr/src/tux3-${pkgver}/dkms.conf

}

sha256sums=('SKIP'
            '8fad98424518a5e5fe2188986f2eb932b9d904fc8253f88c643923ed1a88fe0a')
