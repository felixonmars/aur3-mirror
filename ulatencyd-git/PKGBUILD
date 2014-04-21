# Contributor: Harley Laue <losinggeneration@gmail.com>

pkgname=ulatencyd-git
pkgver=865.b0d08be
pkgrel=1
# poelzi's official repo seems to be inactive
pkgdesc="A daemon to minimize latency on a linux system using cgroups (gajdusek's fork)"
arch=('i686' 'x86_64')
url="https://github.com/exine/ulatencyd/"
license=('GPL')
depends=('dbus-glib' 'lua51-static' 'lua51-posix' 'libxcb' 'python2' 'dbus-python' 'lua51-bitop')
optdepends=('python2-qt: Qt GUI')
makedepends=('cmake' 'git' 'procps-ng-static')
backup=("etc/ulatencyd/ulatencyd.conf")
provides=('ulatencyd')
conflicts=('ulatencyd')
source=(
	'git://github.com/poelzi/ulatencyd.git'
	'archlinux.patch'
)

_branchname="ulatencyd"


md5sums=('SKIP'
         '2b1ceb7e94a6c711baa08f4643b49d68')



pkgver() {
	cd "$srcdir/$_branchname"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "$srcdir/$_branchname"

	patch -p1 < "$srcdir/archlinux.patch"

	cmake \
		-DRUNTIME_DESTINATION=bin \
		-DLUA_INCLUDE_DIR=/usr/include/lua5.1 \
		-DDEVELOP_MODE=false \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DSYSTEMD_DIR=/usr/lib/systemd/system \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo

	make
}

package() {
	cd "$srcdir/$_branchname"
	make DESTDIR="$pkgdir" install
}

