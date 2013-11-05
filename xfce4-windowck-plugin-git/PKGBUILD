# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=xfce4-windowck-plugin-git
pkgver=0.2.3.r0.g1f3483e
pkgrel=1
pkgdesc="Xfce panel plugin which allows to put the maximized window title on the panel - git checkout"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/cedl38/xfce4-windowck-plugin"
groups=('xfce4-goodies')
depends=('xfce4-panel')
conflicts=('xfce4-windowck-plugin')
provides=('xfce4-windowck-plugin')
makedepends=('xfce4-dev-tools' 'git')
options=('!libtool')
install=xfce4-windowck-plugin.install
source=('git+https://github.com/cedl38/xfce4-windowck-plugin.git')

pkgver() {
	cd xfce4-windowck-plugin/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}


build() {
	cd xfce4-windowck-plugin/

	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd xfce4-windowck-plugin/

	make DESTDIR="${pkgdir}" install
}

sha256sums=('SKIP')
