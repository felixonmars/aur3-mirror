#  Contributor: Shizeeg Unadequatov <shizeeque at gmail.com>
pkgname=qxmpp-git
pkgver=20140423
pkgrel=2
pkgdesc="A cross-platform C++ XMPP client library based on Qt"
arch=('i686' 'x86_64')
url="https://code.google.com/p/qxmpp/"
license=('LGPL')
depends=('qt4')
conflicts=('qxmpp')
source=("$pkgname::git+https://github.com/qxmpp-project/qxmpp.git")
sha256sums=('SKIP')

_optimal_make_jobs() {
	if [ -r /proc/cpuinfo ]; then
		local core_count=$(grep -Fc processor /proc/cpuinfo)
	else
		local core_count=0
	fi

	if [ ${core_count} -gt 1 ]; then
		echo -n $[${core_count}-1]
	else
		echo -n 1
	fi
}

pkgver() {
	cd "${srcdir}/${pkgname}"
	git log -1 --date=short | grep 'Date:' | sed 's|[^0-9]||g'
}

prepare() {
	cd "${srcdir}/${pkgname}"
	sed -i '/tests/d' qxmpp.pro
	sed -i '/examples/d' qxmpp.pro
}

build() {
	cd "${srcdir}/${pkgname}"
	qmake-qt4 PREFIX="/usr"
	make -j$(_optimal_make_jobs)
}

package() {
	cd "${srcdir}/${pkgname}"
	make INSTALL_ROOT="${pkgdir}" install
}

